// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IVerifier
 * @notice Interface for the gnark verifier contracts.
 */
interface IVerifier {
    /**
     * @notice Verifies a ZK proof for the given input.
     * @param proof The serialized ZK proof: Groth16 points (A, B, C) in EIP-197 format,
     * followed by the Pedersen commitments and their proof of knowledge (384 bytes).
     * @param input The circuit public input.
     * @dev Reverts if the proof is invalid.
     */
    function verifyProof(bytes calldata proof, uint256[1] calldata input) external view;
}
