// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseManager} from "../BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

abstract contract BLSKeyManager is BaseManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.Inner;

    error DuplicateBLSKey();
    error BLSKeyAlreadyEnabled();

    bytes32 private constant ZERO_BYTES_HASH = keccak256(""); // Constant representing an empty hash

    mapping(address => bytes) public blsKeys; // Mapping from operator addresses to their BLS keys
    mapping(address => bytes) public prevBLSKeys; // Mapping from operator addresses to their previous BLS keys
    mapping(address => uint48) public blsKeyUpdateTimestamp; // Mapping from operator addresses to the timestamp of the last BLS key update
    mapping(bytes => PauseableEnumerableSet.Inner) internal _blsKeyData; // Mapping from BLS keys to their associated data

    /**
     * @notice Returns the operator address associated with a given BLS key
     * @param key The BLS key for which to find the associated operator
     * @return The address of the operator linked to the specified BLS key
     */
    function operatorByBLSKey(bytes memory key) public view returns (address) {
        return _blsKeyData[key].getAddress();
    }

    /**
     * @notice Returns the current or previous BLS key for a given operator
     * @dev Returns the previous key if the key was updated in the current epoch
     * @param operator The address of the operator
     * @return The BLS key associated with the specified operator
     */
    function operatorBLSKey(address operator) public view returns (bytes memory) {
        if (blsKeyUpdateTimestamp[operator] == getCaptureTimestamp()) {
            return prevBLSKeys[operator];
        }

        return blsKeys[operator];
    }

    /**
     * @notice Checks if a given BLS key was active at a specified timestamp
     * @param timestamp The timestamp to check
     * @param key The BLS key to check
     * @return A boolean indicating whether the BLS key was active at the specified timestamp
     */
    function blsKeyWasActiveAt(uint48 timestamp, bytes memory key) public view returns (bool) {
        return _blsKeyData[key].wasActiveAt(timestamp);
    }

    /**
     * @notice Updates the BLS key associated with an operator
     * @dev Reverts if the key is already enabled or if another operator is using it
     * @param operator The address of the operator whose BLS key is to be updated
     * @param key The new BLS key to associate with the operator
     */
    function _updateBLSKey(address operator, bytes memory key) internal {
        uint48 timestamp = getCaptureTimestamp();

        if (keccak256(blsKeys[operator]) == keccak256(key)) {
            revert BLSKeyAlreadyEnabled();
        }

        if (_blsKeyData[key].getAddress() != address(0) && _blsKeyData[key].getAddress() != operator) {
            revert DuplicateBLSKey();
        }

        if (keccak256(key) != ZERO_BYTES_HASH && _blsKeyData[key].getAddress() == address(0)) {
            _blsKeyData[key].set(timestamp, operator);
        }

        if (blsKeyUpdateTimestamp[operator] != timestamp) {
            prevBLSKeys[operator] = blsKeys[operator];
            blsKeyUpdateTimestamp[operator] = timestamp;
        }

        blsKeys[operator] = key;
    }
}
