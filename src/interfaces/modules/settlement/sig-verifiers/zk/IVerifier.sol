// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVerifier {
    /**
     * @notice Verifies a ZK proof for the given input.
     * @param proof The ZK proof.
     * @param commitments The commitments.
     * @param commitmentPok The commitment proof of knowledge.
     * @param input The circuit public input.
     * @dev Reverts if the proof is invalid.
     */
    function verifyProof(
        uint256[8] calldata proof,
        uint256[2] calldata commitments,
        uint256[2] calldata commitmentPok,
        uint256[1] calldata input
    ) external view;
}
