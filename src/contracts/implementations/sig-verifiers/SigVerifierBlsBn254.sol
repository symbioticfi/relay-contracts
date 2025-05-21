// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Verifier} from "./zk/HashVerifier.sol";
import {SigBlsBn254} from "../../libraries/sigs/SigBlsBn254.sol";
import {BN254} from "../../libraries/utils/BN254.sol";
import {KeyBlsBn254} from "../../libraries/keys/KeyBlsBn254.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {ISettlementManager} from "../../../interfaces/implementations/settlement/ISettlementManager.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {console2} from "forge-std/console2.sol";

contract SigVerifier is ISigVerifier {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;

    Verifier public verifier;

    uint256 public constant QUORUM_THRESHOLD_BASE = 1e18;

    constructor(
        address _verifier
    ) {
        verifier = Verifier(_verifier);
    }

    /**
     * @inheritdoc ISigVerifier
     * @dev proof is 64 bytes zkProof | 64 bytes commitments | 64 bytes commitmentPok | 32 nonSignersVotingPower
     */
    function verifyQuorumSig(
        address settlementManager,
        bytes memory message,
        uint8, /* keyTag */
        uint208 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        uint256 nonSignersVotingPower;
        {
            uint256[8] calldata zkProof;
            uint256[2] calldata commitments;
            uint256[2] calldata commitmentPok;
            uint256[1] calldata input;
            assembly {
                zkProof := add(proof.offset, 0)
                commitments := add(proof.offset, 256)
                commitmentPok := add(proof.offset, 320)
                input := add(proof.offset, 384)
            }
            nonSignersVotingPower = input[0];

            bytes memory extraData = ISettlementManager(settlementManager).getExtraDataFromValSetHeader();
            BN254.G1Point memory messageG1 = BN254.hashToG1(abi.decode(message, (bytes32)));
            uint256 inputHash =
                uint256(keccak256(abi.encodePacked(extraData, nonSignersVotingPower, messageG1.X, messageG1.Y)));
            inputHash &= 0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

            try verifier.verifyProof(zkProof, commitments, commitmentPok, [inputHash]) {}
            catch {
                return false;
            }
        }

        uint256 totalActiveVotingPower =
            ISettlementManager(settlementManager).getTotalActiveVotingPowerFromValSetHeader();
        return totalActiveVotingPower - nonSignersVotingPower
            >= Math.mulDiv(quorumThreshold, totalActiveVotingPower, QUORUM_THRESHOLD_BASE, Math.Rounding.Ceil);
    }
}
