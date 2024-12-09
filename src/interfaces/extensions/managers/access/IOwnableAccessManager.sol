// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IOwnableAccessManager
 * @notice Interface for a middleware extension that restricts access to a single owner address
 */
interface IOwnableAccessManager {
    /**
     * @notice Error thrown when a non-owner address attempts to call a restricted function
     * @param sender The address that attempted the call
     */
    error OnlyOwnerCanCall(address sender);

    /**
     * @notice Error thrown when trying to set an invalid owner address
     * @param owner The invalid owner address
     */
    error InvalidOwner(address owner);

    /**
     * @notice Gets the current owner address
     * @return The owner address
     */
    function owner() external view returns (address);

    /**
     * @notice Updates the owner address
     * @param owner_ The new owner address
     * @dev Can only be called by the current owner
     */
    function setOwner(
        address owner_
    ) external;

    /**
     * @notice Renounces the ownership of the contract
     * @dev Can only be called by the current owner
     */
    function renounceOwnership() external;
}
