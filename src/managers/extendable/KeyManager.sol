// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SlashingWindowStorage} from "../storages/SlashingWindowStorage.sol";
import {CaptureTimestampManager} from "./CaptureTimestampManager.sol";

/**
 * @title KeyManager
 * @notice Abstract contract for managing keys
 */
abstract contract KeyManager is SlashingWindowStorage, CaptureTimestampManager {
    /**
     * @notice Updates the key associated with an operator
     * @param operator The address of the operator
     * @param key The key to update, or empty bytes to delete the key
     */
    function _updateKey(address operator, bytes memory key) internal virtual;

    /**
     * @notice Returns the operator address associated with a given key
     * @param key The key for which to find the associated operator
     * @return The address of the operator linked to the specified key
     */
    function operatorByKey(
        bytes memory key
    ) public view virtual returns (address);

    /**
     * @notice Returns the current or previous key for a given operator
     * @dev Returns the previous key if the key was updated in the current epoch
     * @param operator The address of the operator
     * @return The key associated with the specified operator
     */
    function operatorKey(
        address operator
    ) public view virtual returns (bytes memory);

    /**
     * @notice Checks if a key was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param key The key to check
     * @return True if the key was active at the timestamp, false otherwise
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key) public view virtual returns (bool);
}
