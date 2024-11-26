// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../BaseMiddleware.sol";

/**
 * @title NoKeyStorage
 * @notice A middleware extension that provides no key storage functionality
 * @dev Implements BaseMiddleware and always reverts on key operations
 */
abstract contract NoKeyStorage is BaseMiddleware {
    bool public constant NoKeyStorageEnabled = true;

    error KeyStorageDisabled();

    /**
     * @notice Gets the operator address associated with a key
     * @param key The key to lookup (unused)
     * @return The operator address (always reverts)
     */
    function operatorByKey(bytes memory key) public pure override returns (address) {
        revert KeyStorageDisabled();
    }

    /**
     * @notice Gets an operator's active key
     * @param operator The operator address to lookup (unused)
     * @return The operator's key (always reverts)
     */
    function operatorKey(address operator) public pure override returns (bytes memory) {
        revert KeyStorageDisabled();
    }

    /**
     * @notice Checks if a key was active at a specific timestamp
     * @param timestamp The timestamp to check (unused)
     * @param key The key to check (unused)
     * @return Whether key was active (always reverts)
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key) public pure override returns (bool) {
        revert KeyStorageDisabled();
    }

    /**
     * @notice Updates an operator's key
     * @param operator The operator address (unused)
     * @param key The new key (unused)
     */
    function _updateKey(address operator, bytes memory key) internal virtual override {
        revert KeyStorageDisabled();
    }
}
