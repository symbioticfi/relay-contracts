// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IECDSASig
 * @notice Interface for verifying ECDSA signatures against operator keys
 * @dev Extends ISigManager interface for ECDSA signature verification
 */
interface IECDSASig {
    /**
     * @notice Recovers the signer address from a hash and signature
     * @param hash The message hash that was signed
     * @param signature The ECDSA signature
     * @return The address that created the signature
     * @dev Wrapper around OpenZeppelin's ECDSA.recover
     */
    function recover(bytes32 hash, bytes memory signature) external pure returns (address);
}
