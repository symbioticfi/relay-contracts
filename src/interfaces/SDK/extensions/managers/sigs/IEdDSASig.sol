// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IEdDSASig
 * @notice Interface for verifying EdDSA signatures over Ed25519 against operator keys
 * @dev Extends ISigManager interface for EdDSA signature verification
 */
interface IEdDSASig {
    /**
     * @notice Verifies an Ed25519 signature against a message and public key
     * @param message The message that was signed
     * @param signature The Ed25519 signature to verify
     * @param key The Ed25519 public key compressed to 32 bytes
     * @return True if the signature is valid, false otherwise
     * @dev Wrapper around Ed25519.verify which handles decompression and curve operations
     */
    function verify(bytes memory message, bytes memory signature, bytes32 key) external returns (bool);
}
