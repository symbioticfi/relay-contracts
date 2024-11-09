// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {BaseManager} from "../BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

abstract contract BaseKeyManager is BaseManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.Inner;

    error DuplicateKey();
    error KeyAlreadyEnabled();

    bytes32 private constant ZERO_BYTES32 = bytes32(0);

    mapping(address => bytes32) public keys; // Mapping from operator addresses to their current keys
    mapping(address => bytes32) public prevKeys; // Mapping from operator addresses to their previous keys
    mapping(address => uint48) public keyUpdateTimestamp; // Mapping from operator addresses to the epoch of the last key update
    mapping(bytes32 => PauseableEnumerableSet.Inner) internal _keyData; // Mapping from keys to their associated data

    /**
     * @notice Returns the operator address associated with a given key
     * @param key The key for which to find the associated operator
     * @return The address of the operator linked to the specified key
     */
    function operatorByKey(bytes32 key) public view returns (address) {
        return _keyData[key].getAddress();
    }

    /**
     * @notice Returns the current or previous key for a given operator
     * @dev Returns the previous key if the key was updated in the current epoch
     * @param operator The address of the operator
     * @return The key associated with the specified operator
     */
    function operatorKey(address operator) public view returns (bytes32) {
        if (keyUpdateTimestamp[operator] == getCaptureTimestamp()) {
            return prevKeys[operator];
        }

        return keys[operator];
    }

    /**
     * @notice Checks if a given key was active at a specified timestamp
     * @param timestamp The timestamp to check
     * @param key The key to check
     * @return A boolean indicating whether the key was active at the specified timestamp
     */
    function keyWasActiveAt(uint48 timestamp, bytes32 key) public view returns (bool) {
        return _keyData[key].wasActiveAt(timestamp);
    }

    /**
     * @notice Updates the key associated with an operator
     * @dev Reverts if the key is already enabled or if another operator is using it
     * @param operator The address of the operator whose key is to be updated
     * @param key The new key to associate with the operator
     */
    function _updateKey(address operator, bytes32 key) internal {
        uint48 timestamp = getCaptureTimestamp();

        if (keys[operator] == key) {
            revert KeyAlreadyEnabled();
        }

        if (_keyData[key].getAddress() != address(0) && _keyData[key].getAddress() != operator) {
            revert DuplicateKey();
        }

        if (key != ZERO_BYTES32 && _keyData[key].getAddress() == address(0)) {
            _keyData[key].set(timestamp, operator);
        }

        if (keyUpdateEpoch[operator] != timestamp) {
            prevKeys[operator] = keys[operator];
            keyUpdateTimestamp[operator] = timestamp;
        }

        keys[operator] = key;
    }
}
