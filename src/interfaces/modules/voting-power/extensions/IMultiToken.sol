// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IMultiToken
 * @notice Interface for the MultiToken contract.
 */
interface IMultiToken {
    /**
     * @notice Registers the token.
     * @param token The address of the token.
     * @dev The caller must have the needed permission.
     */
    function registerToken(address token) external;

    /**
     * @notice Unregisters the token.
     * @param token The address of the token.
     * @dev The caller must have the needed permission.
     */
    function unregisterToken(address token) external;
}
