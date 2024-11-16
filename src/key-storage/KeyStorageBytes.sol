// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseManager} from "../managers/BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

abstract contract KeyStorageBytes is BaseManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.Inner;

    error DuplicateKey();
    error KeyAlreadyEnabled();

    bytes32 private constant ZERO_BYTES_HASH = keccak256(""); // Constant representing an empty hash

    mapping(address => bytes) public keys; // Mapping from operator addresses to their BLS keys
    mapping(address => bytes) public prevKeys; // Mapping from operator addresses to their previous keys
    mapping(address => uint48) public keyUpdateTimestamp; // Mapping from operator addresses to the timestamp of the last key update
    mapping(bytes => PauseableEnumerableSet.Inner) internal _keyData; // Mapping from keys to their associated data

    /**
     * @notice Returns the operator address associated with a given BLS key
     * @param key The BLS key for which to find the associated operator
     * @return The address of the operator linked to the specified BLS key
     */
    function operatorByKey(
        bytes memory key
    ) public view returns (address) {
        return _keyData[key].getAddress();
    }

    /**
     * @notice Returns the current or previous BLS key for a given operator
     * @dev Returns the previous key if the key was updated in the current epoch
     * @param operator The address of the operator
     * @return The BLS key associated with the specified operator
     */
    function operatorKey(
        address operator
    ) public view returns (bytes memory) {
        if (keyUpdateTimestamp[operator] == getCaptureTimestamp()) {
            return prevKeys[operator];
        }

        return keys[operator];
    }

    /**
     * @notice Checks if a given BLS key was active at a specified timestamp
     * @param timestamp The timestamp to check
     * @param key The BLS key to check
     * @return A boolean indicating whether the BLS key was active at the specified timestamp
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key) public view returns (bool) {
        return _keyData[key].wasActiveAt(timestamp);
    }

    /**
     * @notice Updates the BLS key associated with an operator
     * @dev Reverts if the key is already enabled or if another operator is using it
     * @param operator The address of the operator whose BLS key is to be updated
     * @param key The new BLS key to associate with the operator
     */
    function _updateKey(address operator, bytes memory key) internal {
        uint48 timestamp = getCaptureTimestamp();

        if (keccak256(keys[operator]) == keccak256(key)) {
            revert KeyAlreadyEnabled();
        }

        if (_keyData[key].getAddress() != address(0) && _keyData[key].getAddress() != operator) {
            revert DuplicateKey();
        }

        if (keccak256(key) != ZERO_BYTES_HASH && _keyData[key].getAddress() == address(0)) {
            _keyData[key].set(timestamp, operator);
        }

        if (keyUpdateTimestamp[operator] != timestamp) {
            prevKeys[operator] = keys[operator];
            keyUpdateTimestamp[operator] = timestamp;
        }

        keys[operator] = key;
    }
}
