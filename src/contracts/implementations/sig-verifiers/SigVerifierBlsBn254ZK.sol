// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Verifier} from "./zk/HashVerifier.sol";
import {SigBlsBn254} from "../../libraries/sigs/SigBlsBn254.sol";
import {BN254} from "../../libraries/utils/BN254.sol";
import {KeyBlsBn254} from "../../libraries/keys/KeyBlsBn254.sol";
import {ExtraDataStorageHelper} from "./libraries/ExtraDataStorageHelper.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {ISigVerifierBlsBn254ZK} from "../../../interfaces/implementations/sig-verifiers/ISigVerifierBlsBn254ZK.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract SigVerifierBlsBn254ZK is ISigVerifierBlsBn254ZK {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;
    using ExtraDataStorageHelper for uint32;

    /**
     * @inheritdoc ISigVerifierBlsBn254ZK
     */
    string public constant TOTAL_ACTIVE_VALIDATORS = "totalActiveValidators";

    /**
     * @inheritdoc ISigVerifierBlsBn254ZK
     */
    string public constant VALIDATOR_SET_HASH_MIMC = "validatorSetHashMimc";

    /**
     * @inheritdoc ISigVerifierBlsBn254ZK
     */
    address[] public verifiers;

    /**
     * @inheritdoc ISigVerifierBlsBn254ZK
     */
    uint256[] public maxValidators;

    constructor(address[] memory verifiers_, uint256[] memory maxValidators_) {
        uint256 length = verifiers.length;
        if (length != maxValidators.length) {
            revert SigVerifierBlsBn254ZK_InvalidLength();
        }
        for (uint256 i; i < length; ++i) {
            if (maxValidators[i] == 0) {
                revert SigVerifierBlsBn254ZK_InvalidMaxValidators();
            }
            if (i != 0 && maxValidators[i - 1] >= maxValidators[i]) {
                revert SigVerifierBlsBn254ZK_InvalidMaxValidators();
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

        uint32 verificationType = ISettlement(settlement).getVerificationTypeFromValSetHeaderAt(epoch);
        uint256 inputHash;
        {
            bytes32 validatorSetHash =
                ISettlement(settlement).getExtraDataAt(epoch, verificationType.getKey(keyTag, VALIDATOR_SET_HASH_MIMC));
            BN254.G1Point memory messageG1 = BN254.hashToG1(abi.decode(message, (bytes32)));

            inputHash =
                uint256(keccak256(abi.encodePacked(validatorSetHash, signersVotingPower, messageG1.X, messageG1.Y)));
            inputHash &= 0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        }

        uint256 totalActiveValidators =
            uint256(ISettlement(settlement).getExtraDataAt(epoch, verificationType.getKey(TOTAL_ACTIVE_VALIDATORS)));
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
        revert SigVerifierBlsBn254ZK_InvalidTotalActiveValidators();
    }
}
