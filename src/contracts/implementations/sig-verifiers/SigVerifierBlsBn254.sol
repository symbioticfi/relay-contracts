// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Verifier} from "./zk/HashVerifier.sol";
import {SigBlsBn254} from "../../libraries/sigs/SigBlsBn254.sol";
import {BN254} from "../../libraries/utils/BN254.sol";
import {KeyBlsBn254} from "../../libraries/keys/KeyBlsBn254.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {ISettlementManager} from "../../../interfaces/implementations/settlement/ISettlementManager.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SigVerifier is ISigVerifier {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;

    Verifier public verifier;

    uint256 public constant QUORUM_THRESHOLD_BASE = 1e18; // 100%

    constructor(
        address _verifier
    ) {
        verifier = Verifier(_verifier);
    }

    function verifyQuorumSig(
        address settlementManager,
        bytes memory message,
        uint8 keyTag,
        uint208 quorumThreshold,
        bytes calldata proof // size | 64 bytes are signature | 128 bytes pubkeyG2 |
    ) public view returns (bool) {
        uint256[10] calldata input;
        {
            uint256[8] calldata _proof;
            uint256[2] calldata commitments;
            uint256[2] calldata commitmentPok;

            // Extract proof components from the calldata
            // Assuming proof[192 + len:] contains the ZK proof components in the expected format

            // Parse the proof components from the calldata
            assembly {
                // Load each element of the proof array
                _proof := add(proof.offset, 224)

                // Load commitments (2 values)
                commitments := add(proof.offset, 480)

                // Load commitment proof of knowledge (2 values)
                commitmentPok := add(proof.offset, 544)

                // Load input values (10 values)
                input := add(proof.offset, 608)
            }

            try verifier.verifyProof(_proof, commitments, commitmentPok, input) {}
            catch {
                return false;
            }
        }

        uint256 totalActiveVotingPower =
            ISettlementManager(settlementManager).getTotalActiveVotingPowerFromValSetHeader();
        if (
            totalActiveVotingPower - input[9]
                < Math.mulDiv(quorumThreshold, totalActiveVotingPower, QUORUM_THRESHOLD_BASE, Math.Rounding.Ceil)
        ) {
            return false;
        }

        bytes memory aggPublicKeyG1Bytes =
            ISettlementManager(settlementManager).getActiveAggregatedKeyFromValSetHeader(keyTag);
        BN254.G1Point memory nonSignersPublicKeyG1Raw = BN254.G1Point(
            input[0] + input[1] * 2 ** 64 + input[2] * 2 ** 128 + input[3] * 2 ** 192,
            input[4] + input[5] * 2 ** 64 + input[6] * 2 ** 128 + input[7] * 2 ** 192
        );
        bytes calldata signature = proof[0:64];
        bytes calldata aggPublicKeyG2 = proof[64:192];
        return SigBlsBn254.verify(
            aggPublicKeyG1Bytes.fromBytes().unwrap().plus(nonSignersPublicKeyG1Raw.negate()).wrap().toBytes(),
            message,
            signature,
            aggPublicKeyG2
        );
    }
}
