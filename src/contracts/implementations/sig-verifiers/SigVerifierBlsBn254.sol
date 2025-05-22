// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Verifier} from "./zk/HashVerifier.sol";
import {SigBlsBn254} from "../../libraries/sigs/SigBlsBn254.sol";
import {BN254} from "../../libraries/utils/BN254.sol";
import {KeyBlsBn254} from "../../libraries/keys/KeyBlsBn254.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {ISigVerifierBlsBn254} from "../../../interfaces/implementations/sig-verifiers/ISigVerifierBlsBn254.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract SigVerifierBlsBn254 is ISigVerifierBlsBn254 {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;

    /**
     * @inheritdoc ISigVerifierBlsBn254
     */
    bytes32 public constant TOTAL_ACTIVE_VALIDATORS_KEY =
        keccak256(abi.encode("symbiotic.SigVerifierBlsBn254.totalActiveValidators"));

    /**
     * @inheritdoc ISigVerifierBlsBn254
     */
    string public constant KEY_TAG_EXTRA_DATA_KEY_PREFIX = "symbiotic.SigVerifierBlsBn254.keyTag.extraData.";

    /**
     * @inheritdoc ISigVerifierBlsBn254
     */
    address[] public verifiers;

    /**
     * @inheritdoc ISigVerifierBlsBn254
     */
    uint256[] public maxValidators;

    constructor(address[] memory verifiers_, uint256[] memory maxValidators_) {
        uint256 length = verifiers.length;
        if (length != maxValidators.length) {
            revert SigVerifierBlsBn254_InvalidLength();
        }
        for (uint256 i; i < length; ++i) {
            if (maxValidators[i] == 0) {
                revert SigVerifierBlsBn254_InvalidMaxValidators();
            }
            if (i != 0 && maxValidators[i - 1] >= maxValidators[i]) {
                revert SigVerifierBlsBn254_InvalidMaxValidators();
            }
        }

        verifiers = verifiers_;
        maxValidators = maxValidators_;
    }

    /**
     * @inheritdoc ISigVerifier
     * @dev proof is 64 bytes zkProof | 64 bytes commitments | 64 bytes commitmentPok | 32 nonSignersVotingPower
     */
    function verifyQuorumSig(
        address settlement,
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint256 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        uint256 signersVotingPower;
        assembly {
            signersVotingPower := calldataload(add(proof.offset, 384))
        }
        if (signersVotingPower < quorumThreshold) {
            return false;
        }

        uint256[8] calldata zkProof;
        uint256[2] calldata commitments;
        uint256[2] calldata commitmentPok;
        assembly {
            zkProof := add(proof.offset, 0)
            commitments := add(proof.offset, 256)
            commitmentPok := add(proof.offset, 320)
        }

        uint256 inputHash;
        {
            bytes32 validatorSetHash = ISettlement(settlement).getExtraDataAt(
                epoch, keccak256(abi.encode(string.concat(KEY_TAG_EXTRA_DATA_KEY_PREFIX, Strings.toString(keyTag))))
            );
            BN254.G1Point memory messageG1 = BN254.hashToG1(abi.decode(message, (bytes32)));

            inputHash =
                uint256(keccak256(abi.encodePacked(validatorSetHash, signersVotingPower, messageG1.X, messageG1.Y)));
            inputHash &= 0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        }

        uint256 totalActiveValidators =
            uint256(ISettlement(settlement).getExtraDataAt(epoch, TOTAL_ACTIVE_VALIDATORS_KEY));
        try Verifier(_getVerifier(totalActiveValidators)).verifyProof(zkProof, commitments, commitmentPok, [inputHash])
        {
            return true;
        } catch {
            return false;
        }
    }

    function _getVerifier(
        uint256 totalActiveValidators
    ) internal view returns (address) {
        for (uint256 i; i < maxValidators.length; ++i) {
            if (totalActiveValidators <= maxValidators[i]) {
                return verifiers[i];
            }
        }
        revert SigVerifierBlsBn254_InvalidTotalActiveValidators();
    }
}
