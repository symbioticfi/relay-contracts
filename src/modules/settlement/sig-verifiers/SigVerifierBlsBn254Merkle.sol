// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BN254} from "../../../libraries/utils/BN254.sol";
import {ExtraDataStorageHelper} from "./libraries/ExtraDataStorageHelper.sol";
import {KeyBlsBn254} from "../../../libraries/keys/KeyBlsBn254.sol";
import {KeyTags} from "../../../libraries/utils/KeyTags.sol";
import {SigBlsBn254} from "../../../libraries/sigs/SigBlsBn254.sol";

import {ISettlement} from "../../../interfaces/modules/settlement/ISettlement.sol";
import {ISigVerifierBlsBn254Simple} from
    "../../../interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254Simple.sol";
import {ISigVerifier} from "../../../interfaces/modules/settlement/sig-verifiers/ISigVerifier.sol";
import {KEY_TYPE_BLS_BN254} from "../../../interfaces/modules/key-registry/IKeyRegistry.sol";

import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

/**
 * @title SigVerifierBlsBn254Simple
 * @notice Contract for verifying validator's set attestations based on BLS signatures on the BN254 curve
 *         by decompressing the whole validator set on-chain.
 */
contract SigVerifierBlsBn254Merkle is ISigVerifier {
    using BN254 for BN254.G1Point;
    using ExtraDataStorageHelper for uint32;
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyTags for uint8;

    error SigVerifierBlsBn254Simple_UnsupportedKeyTag();
    error SigVerifierBlsBn254Simple_InvalidMessageLength();
    error SigVerifierBlsBn254Simple_TooManyValidators();
    error SigVerifierBlsBn254Simple_InvalidNonSignerIndex();
    error SigVerifierBlsBn254Simple_InvalidNonSignersOrder();
    error SigVerifierBlsBn254Simple_InvalidProofLength();
    error SigVerifierBlsBn254Simple_InvalidProofOffset();

    uint32 public constant VERIFICATION_TYPE = 2;

    bytes32 public constant VALIDATOR_SET_MERKLE_ROOT_HASH = keccak256("validatorSetMerkleRoot");

    bytes32 public constant AGGREGATED_PUBLIC_KEY_G1_HASH = keccak256("aggPublicKeyG1");

    uint256 public constant MAX_VALIDATORS = 65_536;

    struct ValidatorData {
        bytes32 keySerialized;
        uint256 votingPower;
    }

    /**
     * @inheritdoc ISigVerifier
     */
    function verifyQuorumSig(
        address settlement,
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint256 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        if (keyTag.getType() != KEY_TYPE_BLS_BN254) {
            revert SigVerifierBlsBn254Simple_UnsupportedKeyTag();
        }
        if (message.length != 32) {
            revert SigVerifierBlsBn254Simple_InvalidMessageLength();
        }

        // Proof Structure
        // 0 : 64 - G1 aggregated signature
        // 64 : 192 - G2 aggregated public key
        // 192 : 224+nonSigners.length*64 - encoded data of all active validators for a given `keyTag`
        //     192 : 224 - number of nonSigners
        //     224 : 224+nonSigners.length*64 - (bytes32 keySerialized,uint256 votingPower)[]
        // 224+nonSigners.length*64 : 224+nonSigners.length*64+proofs.length*32 - merkle proof
        // 224+nonSigners.length*64+proofs.length*32 : proof.length - flags for the merkle proof

        uint256 nonSignersLength;
        assembly ("memory-safe") {
            nonSignersLength := calldataload(add(proof.offset, 192))
        }
        unchecked {
            uint256 nonSignersVotingPower;
            BN254.G1Point memory nonSignersPublicKeyG1;
            bytes32[] memory leaves = new bytes32[](nonSignersLength);
            {
                bytes32 prevKeySerialized;
                uint256 validatorDataOffset;
                assembly ("memory-safe") {
                    validatorDataOffset := add(proof.offset, 224)
                }
                for (uint256 i; i < nonSignersLength; ++i) {
                    bytes32 currentKeySerialized;
                    assembly ("memory-safe") {
                        currentKeySerialized := calldataload(validatorDataOffset)
                    }
                    if (i > 0 && uint256(currentKeySerialized) <= uint256(prevKeySerialized)) {
                        revert SigVerifierBlsBn254Simple_InvalidNonSignersOrder();
                    }
                    nonSignersPublicKeyG1 =
                        nonSignersPublicKeyG1.plus(abi.encode(currentKeySerialized).deserialize().unwrap());
                    uint256 currentVotingPower;
                    assembly ("memory-safe") {
                        currentVotingPower := calldataload(add(validatorDataOffset, 32))
                    }
                    // assuming that the validator set, and, hence, total voting power, were properly committed,
                    // so that the sum of the non-signers' voting powers cannot be greater than the total voting power,
                    // and, hence, cannot overflow
                    nonSignersVotingPower += currentVotingPower;
                    leaves[i] = keccak256(bytes.concat(keccak256(abi.encode(currentKeySerialized, currentVotingPower))));
                    prevKeySerialized = currentKeySerialized;
                    validatorDataOffset += 64;
                }
            }
            {
                (bytes32[] memory proofs, bool[] memory flags) =
                    abi.decode(proof[224 + nonSignersLength * 64:], (bytes32[], bool[]));
                bytes32 root = ISettlement(settlement).getExtraDataAt(
                    epoch, VERIFICATION_TYPE.getKey(keyTag, VALIDATOR_SET_MERKLE_ROOT_HASH)
                );
                if (!MerkleProof.multiProofVerify(proofs, flags, root, leaves)) {
                    return false;
                }
            }
            if (
                quorumThreshold
                    > uint256(ISettlement(settlement).getTotalVotingPowerFromValSetHeaderAt(epoch)) - nonSignersVotingPower
            ) {
                return false;
            }
            {
                bytes memory aggPublicKeyG1Serialized = abi.encode(
                    ISettlement(settlement).getExtraDataAt(
                        epoch, VERIFICATION_TYPE.getKey(keyTag, AGGREGATED_PUBLIC_KEY_G1_HASH)
                    )
                );
                bytes32 messageHash;
                BN254.G1Point calldata signatureG1;
                BN254.G2Point calldata aggKeyG2;
                assembly ("memory-safe") {
                    messageHash := mload(add(message, 32))
                    signatureG1 := proof.offset
                    aggKeyG2 := add(proof.offset, 64)
                }
                return SigBlsBn254.verify(
                    aggPublicKeyG1Serialized.deserialize().unwrap().plus(nonSignersPublicKeyG1.negate()),
                    messageHash,
                    signatureG1,
                    aggKeyG2
                );
            }
        }
    }
}
