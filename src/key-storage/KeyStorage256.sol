// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../middleware/BaseMiddleware.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

/**
 * @title KeyStorage256
 * @notice Manages storage and validation of operator keys using bytes32 values
 * @dev Extends BaseMiddleware to provide key management functionality
 */
abstract contract KeyStorage256 is BaseMiddleware {
    using PauseableEnumerableSet for PauseableEnumerableSet.Bytes32Set;
    using PauseableEnumerableSet for PauseableEnumerableSet.Status;

    error DuplicateKey();
    error KeyAlreadyEnabled();
    error MaxDisabledKeysReached();

    bytes32 private constant ZERO_BYTES32 = bytes32(0);
    uint256 private constant MAX_DISABLED_KEYS = 1;

    /// @notice Mapping from operator addresses to their keys
    mapping(address => PauseableEnumerableSet.Bytes32Set) internal _keys;
    /// @notice Mapping from keys to operator addresses
    mapping(bytes32 => address) internal _keyToOperator;

    /**
     * @notice Gets the operator address associated with a key
     * @param key The key to lookup
     * @return The operator address that owns the key, or zero address if none
     */
    function operatorByKey(
        bytes memory key
    ) public view override returns (address) {
        return _keyToOperator[abi.decode(key, (bytes32))];
    }

    /**
     * @notice Gets an operator's active key at the current capture timestamp
     * @param operator The operator address to lookup
     * @return The operator's active key encoded as bytes, or encoded zero bytes if none
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {
        bytes32[] memory active = _keys[operator].getActive(getCaptureTimestamp());
        if (active.length == 0) {
            return abi.encode(ZERO_BYTES32);
        }
        return abi.encode(active[0]);
    }

    /**
     * @notice Checks if a key was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param key The key to check
     * @return True if the key was active at the timestamp, false otherwise
     */
    function keyWasActiveAt(uint48 timestamp, bytes32 key) public view returns (bool) {
        return _keys[_keyToOperator[key]].wasActiveAt(timestamp, key);
    }

    /**
     * @notice Updates an operator's key
     * @dev Handles key rotation by disabling old key and registering new one
     * @param operator The operator address to update
     * @param key_ The new key to register, encoded as bytes
     * @custom:throws DuplicateKey if key is already registered to another operator
     * @custom:throws MaxDisabledKeysReached if operator has too many disabled keys
     */
    function _updateKey(address operator, bytes memory key_) internal override {
        bytes32 key = abi.decode(key_, (bytes32));

        if (_keyToOperator[key] != address(0)) {
            revert DuplicateKey();
        }

        // check if we have reached the max number of disabled keys
        // this allow us to limit the number times we can change the key
        if (key != ZERO_BYTES32 && _keys[operator].length() > MAX_DISABLED_KEYS + 1) {
            revert MaxDisabledKeysReached();
        }

        if (_keys[operator].length() > 0) {
            // try to remove disabled keys
            bytes32 prevKey = _keys[operator].array[0].value;
            if (_keys[operator].checkUnregister(Time.timestamp(), SLASHING_WINDOW, prevKey)) {
                _keys[operator].unregister(Time.timestamp(), SLASHING_WINDOW, prevKey);
                delete _keyToOperator[prevKey];
            } else if (_keys[operator].wasActiveAt(getCaptureTimestamp(), prevKey)) {
                _keys[operator].pause(Time.timestamp(), prevKey);
            }
        }

        if (key != ZERO_BYTES32) {
            // register the new key
            _keys[operator].register(Time.timestamp(), key);
            _keyToOperator[key] = operator;
        }
    }
}
