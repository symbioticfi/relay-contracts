// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";

/**
 * @title NoKeyManager
 * @notice A middleware extension that provides no key storage functionality
 * @dev This contract implements the KeyManager interface but does not provide any key storage functionality.
 */
abstract contract NoKeyManager is KeyManager {
    uint64 public constant NoKeyManager_VERSION = 1;

    /**
     * @notice Gets the operator address associated with a key
     * @param key The key to lookup (unused)
     * @return The operator address (always reverts)
     */
    function operatorByKey(
        bytes memory key
    ) public pure override returns (address) {}

    /**
     * @notice Gets an operator's active key
     * @param operator The operator address to lookup (unused)
     * @return The operator's key (always reverts)
     */
    function operatorKey(
        address operator
    ) public pure override returns (bytes memory) {}

    /**
     * @notice Checks if a key was active at a specific timestamp
     * @param timestamp The timestamp to check (unused)
     * @param key The key to check (unused)
     * @return Whether key was active (always reverts)
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key) public pure override returns (bool) {}

    /**
     * @notice Updates an operator's key
     * @param operator The operator address (unused)
     * @param key The new key (unused)
     */
    function _updateKey(address operator, bytes memory key) internal virtual override {}
}
