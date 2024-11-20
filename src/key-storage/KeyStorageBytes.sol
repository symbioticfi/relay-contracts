// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseManager} from "../managers/BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

abstract contract KeyStorageBytes is BaseManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.BytesSet;
    using PauseableEnumerableSet for PauseableEnumerableSet.Status;

    error DuplicateKey();
    error MaxDisabledKeysReached();

    uint256 private constant MAX_DISABLED_KEYS = 1;
    bytes private constant ZERO_BYTES = "";
    bytes32 private constant ZERO_BYTES_HASH = keccak256("");

    mapping(address => PauseableEnumerableSet.BytesSet) internal _keys;
    mapping(bytes => address) internal _keyToOperator;

    /**
     * @notice Returns the operator address associated with a given key
     * @param key The key for which to find the associated operator
     * @return The address of the operator linked to the specified key
     */
    function operatorByKey(
        bytes memory key
    ) public view returns (address) {
        return _keyToOperator[key];
    }

    /**
     * @notice Returns the current or previous key for a given operator
     * @dev Returns the previous key if the key was updated in the current epoch
     * @param operator The address of the operator
     * @return The key associated with the specified operator
     */
    function operatorKey(
        address operator
    ) public view returns (bytes memory) {
        bytes[] memory active = _keys[operator].getActive(getCaptureTimestamp());
        if (active.length == 0) {
            return ZERO_BYTES;
        }
        return active[0];
    }

    /**
     * @notice Checks if a given key was active at a specified timestamp
     * @param timestamp The timestamp to check
     * @param key The key to check
     * @return A boolean indicating whether the key was active at the specified timestamp
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key) public view returns (bool) {
        return _keys[_keyToOperator[key]].wasActiveAt(timestamp, key);
    }

    /**
     * @notice Updates the key associated with an operator
     * @dev Reverts if the key is already enabled or if another operator is using it
     * @param operator The address of the operator whose key is to be updated
     * @param key The new key to associate with the operator
     */
    function _updateKey(address operator, bytes memory key) internal {
        bytes32 keyHash = keccak256(key);

        if (_keyToOperator[key] != address(0)) {
            revert DuplicateKey();
        }

        // check if we have reached the max number of disabled keys
        // this allow us to limit the number times we can change the key
        if (keyHash != ZERO_BYTES_HASH && _keys[operator].length() > MAX_DISABLED_KEYS + 1) {
            revert MaxDisabledKeysReached();
        }

        if (_keys[operator].length() > 0) {
            // try to remove disabled keys
            bytes memory prevKey = _keys[operator].array[0].value;
            if (_keys[operator].checkUnregister(Time.timestamp(), SLASHING_WINDOW, prevKey)) {
                _keys[operator].unregister(Time.timestamp(), SLASHING_WINDOW, prevKey);
                delete _keyToOperator[prevKey];
            } else if (_keys[operator].wasActiveAt(getCaptureTimestamp(), prevKey)) {
                _keys[operator].pause(Time.timestamp(), prevKey);
            }
        }

        if (keyHash != ZERO_BYTES_HASH) {
            // register the new key
            _keys[operator].register(Time.timestamp(), key);
            _keyToOperator[key] = operator;
        }
    }
}
