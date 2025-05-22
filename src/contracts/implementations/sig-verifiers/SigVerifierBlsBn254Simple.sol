// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Verifier} from "./zk/HashVerifier.sol";
import {SigBlsBn254} from "../../libraries/sigs/SigBlsBn254.sol";
import {BN254} from "../../libraries/utils/BN254.sol";
import {KeyBlsBn254} from "../../libraries/keys/KeyBlsBn254.sol";
import {ExtraDataStorageHelper} from "./libraries/ExtraDataStorageHelper.sol";
import {BN254} from "../../libraries/utils/BN254.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {ISigVerifierBlsBn254Simple} from
    "../../../interfaces/implementations/sig-verifiers/ISigVerifierBlsBn254Simple.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract SigVerifierBlsBn254Simple is ISigVerifierBlsBn254Simple {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;
    using ExtraDataStorageHelper for uint128;

    /**
     * @inheritdoc ISigVerifierBlsBn254Simple
     */
    string public constant VALIDATOR_SET_HASH_KECCAK256 = "validatorSetHashKeccak256";

    /**
     * @inheritdoc ISigVerifierBlsBn254Simple
     */
    string public constant TOTAL_VOTING_POWER = "totalVotingPower";

    /**
     * @inheritdoc ISigVerifierBlsBn254Simple
     */
    string public constant AGGREGATED_PUBLIC_KEY_G1 = "aggPublicKeyG1";

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
        uint128 verificationType = ISettlement(settlement).getVerificationTypeFromValSetHeaderAt(epoch);

        ProofData memory proofData = abi.decode(proof, (ProofData));

        uint256 length = proofData.validatorsData.length;
        BN254.G1Point memory nonSignersPublicKeyG1;
        {
            if (
                keccak256(abi.encode(proofData.validatorsData))
                    != ISettlement(settlement).getExtraDataAt(
                        epoch, verificationType.getKey(keyTag, VALIDATOR_SET_HASH_KECCAK256)
                    )
            ) {
                revert SigVerifierBlsBn254Simple_InvalidValidatorSetHash();
            }

            uint256 nonSignersVotingPower;
            for (uint256 i; i < length; ++i) {
                if (proofData.isNonSigners[i]) {
                    nonSignersPublicKeyG1 = nonSignersPublicKeyG1.plus(proofData.validatorsData[i].publicKey);
                    nonSignersVotingPower += proofData.validatorsData[i].votingPower;
                }
            }

            if (
                quorumThreshold
                    > uint256(ISettlement(settlement).getExtraDataAt(epoch, verificationType.getKey(TOTAL_VOTING_POWER)))
                        - nonSignersVotingPower
            ) {
                return false;
            }
        }

        bytes memory aggPublicKeyG1Serialized = abi.encode(
            ISettlement(settlement).getExtraDataAt(epoch, verificationType.getKey(keyTag, AGGREGATED_PUBLIC_KEY_G1))
        );
        bytes memory signersPublicKeyG1Bytes =
            aggPublicKeyG1Serialized.deserialize().unwrap().plus(nonSignersPublicKeyG1.negate()).wrap().toBytes();
        return SigBlsBn254.verify(signersPublicKeyG1Bytes, message, proofData.signature, proofData.aggPublicKeyG2);
    }
}
