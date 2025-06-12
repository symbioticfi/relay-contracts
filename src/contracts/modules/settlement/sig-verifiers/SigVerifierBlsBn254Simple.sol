// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SigBlsBn254} from "../../../libraries/sigs/SigBlsBn254.sol";
import {BN254} from "../../../libraries/utils/BN254.sol";
import {KeyBlsBn254} from "../../../libraries/keys/KeyBlsBn254.sol";
import {ExtraDataStorageHelper} from "./libraries/ExtraDataStorageHelper.sol";
import {KEY_TYPE_BLS_BN254} from "../../../base/KeyManager.sol";
import {KeyTags} from "../../../libraries/utils/KeyTags.sol";

import {ISigVerifier} from "../../../../interfaces/base/ISigVerifier.sol";
import {ISettlement} from "../../../../interfaces/modules/settlement/ISettlement.sol";
import {ISigVerifierBlsBn254Simple} from
    "../../../../interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254Simple.sol";

contract SigVerifierBlsBn254Simple is ISigVerifierBlsBn254Simple {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;
    using ExtraDataStorageHelper for uint32;
    using KeyTags for uint8;

    /**
     * @inheritdoc ISigVerifier
     */
    uint32 public constant VERIFICATION_TYPE = 1;

    /**
     * @inheritdoc ISigVerifierBlsBn254Simple
     */
    bytes32 public constant VALIDATOR_SET_HASH_KECCAK256_HASH = keccak256("validatorSetHashKeccak256");

    /**
     * @inheritdoc ISigVerifierBlsBn254Simple
     */
    bytes32 public constant TOTAL_VOTING_POWER_HASH = keccak256("totalVotingPower");

    /**
     * @inheritdoc ISigVerifierBlsBn254Simple
     */
    bytes32 public constant AGGREGATED_PUBLIC_KEY_G1_HASH = keccak256("aggPublicKeyG1");

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

        // proof structure
        // 0 : 64 - G1 aggregated signature
        // 64 : 192 - G2 aggregated public key
        // 192 : 256+validatorsData.length*96 - encoded data of all active validators for a given `keyTag`
        //     192 : 224 - offset
        //     224 : 256 - length
        //     256 : 256+validatorsData.length*96 - ValidatorData[]
        // 256+validatorsData.length*96 (nonSignersOffset) : 320+nonSigners.length*32 - encoded array of non-signers indices (from validatorsData)
        //     nonSignersOffset : nonSignersOffset + 32 - offset
        //     nonSignersOffset + 32 : nonSignersOffset + 64 - length
        //     nonSignersOffset + 64 : 320+nonSigners.length*32 - bool[]

        BN254.G1Point memory nonSignersPublicKeyG1;
        {
            ValidatorData[] memory validatorsData = abi.decode(proof[192:], (ValidatorData[]));
            uint256 nonSignersOffset = 256 + validatorsData.length * 96;
            if (
                keccak256(proof[192:nonSignersOffset])
                    != ISettlement(settlement).getExtraDataAt(
                        epoch, VERIFICATION_TYPE.getKey(keyTag, VALIDATOR_SET_HASH_KECCAK256_HASH)
                    )
            ) {
                return false;
            }
            uint256[] memory nonSigners = abi.decode(proof[nonSignersOffset:], (uint256[]));

            uint256 nonSignersLength = nonSigners.length;
            uint256 nonSignersVotingPower;
            for (uint256 i; i < nonSignersLength; ++i) {
                unchecked {
                    if (i > 0 && nonSigners[i - 1] >= nonSigners[i]) {
                        revert SigVerifierBlsBn254Simple_InvalidNonSignersOrder();
                    }
                }
                nonSignersPublicKeyG1 = nonSignersPublicKeyG1.plus(validatorsData[nonSigners[i]].publicKey);
                nonSignersVotingPower += validatorsData[nonSigners[i]].votingPower;
            }

            if (
                quorumThreshold
                    > uint256(
                        ISettlement(settlement).getExtraDataAt(epoch, VERIFICATION_TYPE.getKey(TOTAL_VOTING_POWER_HASH))
                    ) - nonSignersVotingPower
            ) {
                return false;
            }
        }

        bytes memory aggPublicKeyG1Serialized = abi.encode(
            ISettlement(settlement).getExtraDataAt(
                epoch, VERIFICATION_TYPE.getKey(keyTag, AGGREGATED_PUBLIC_KEY_G1_HASH)
            )
        );
        bytes memory signersPublicKeyG1Bytes =
            aggPublicKeyG1Serialized.deserialize().unwrap().plus(nonSignersPublicKeyG1.negate()).wrap().toBytes();
        bytes calldata signature = proof[0:64];
        bytes calldata aggPublicKeyG2 = proof[64:192];
        return SigBlsBn254.verify(signersPublicKeyG1Bytes, message, signature, aggPublicKeyG2);
    }
}
