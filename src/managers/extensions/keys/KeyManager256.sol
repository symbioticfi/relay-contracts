// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../base/KeyManager.sol";
import {PauseableEnumerableSet} from "../../../libraries/PauseableEnumerableSet.sol";

/**
 * @title KeyManager256
 * @notice Manages storage and validation of operator keys using bytes32 values
 * @dev Extends KeyManager to provide key management functionality
 */
abstract contract KeyManager256 is KeyManager {
    uint64 public constant KeyManager256_VERSION = 1;

    using PauseableEnumerableSet for PauseableEnumerableSet.Bytes32Set;

    error DuplicateKey();
    error KeyAlreadyEnabled();
    error MaxDisabledKeysReached();

    bytes32 private constant ZERO_BYTES32 = bytes32(0);
    uint256 private constant MAX_DISABLED_KEYS = 1;

    struct KeyManager256Storage {
        /// @notice Mapping from operator addresses to their keys
        mapping(address => PauseableEnumerableSet.Bytes32Set) keys;
        /// @notice Mapping from keys to operator addresses
        mapping(bytes32 => address) keyToOperator;
    }

    // keccak256(abi.encode(uint256(keccak256("symbioticfi.storage.KeyManager256")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManager256StorageLocation =
        0x00c0c7c8c5c9c4c3c2c1c0c7c8c5c9c4c3c2c1c0c7c8c5c9c4c3c2c1c0c7c800;

    function _getKeyManager256Storage() internal pure returns (KeyManager256Storage storage s) {
        bytes32 location = KeyManager256StorageLocation;
        assembly {
            s.slot := location
        }
    }

    /**
     * @notice Gets the operator address associated with a key
     * @param key The key to lookup
     * @return The operator address that owns the key, or zero address if none
     */
    function operatorByKey(
        bytes memory key
    ) public view override returns (address) {
        KeyManager256Storage storage s = _getKeyManager256Storage();
        return s.keyToOperator[abi.decode(key, (bytes32))];
    }

    /**
     * @notice Gets an operator's active key at the current capture timestamp
     * @param operator The operator address to lookup
     * @return The operator's active key encoded as bytes, or encoded zero bytes if none
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {
        KeyManager256Storage storage s = _getKeyManager256Storage();
        bytes32[] memory active = s.keys[operator].getActive(getCaptureTimestamp());
        if (active.length == 0) {
            return abi.encode(ZERO_BYTES32);
        }
        return abi.encode(active[0]);
    }

    /**
     * @notice Checks if a key was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param key_ The key to check
     * @return True if the key was active at the timestamp, false otherwise
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key_) public view override returns (bool) {
        KeyManager256Storage storage s = _getKeyManager256Storage();
        bytes32 key = abi.decode(key_, (bytes32));
        return s.keys[s.keyToOperator[key]].wasActiveAt(timestamp, key);
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
        KeyManager256Storage storage s = _getKeyManager256Storage();
        bytes32 key = abi.decode(key_, (bytes32));

        if (s.keyToOperator[key] != address(0)) {
            revert DuplicateKey();
        }

        // check if we have reached the max number of disabled keys
        // this allow us to limit the number times we can change the key
        if (key != ZERO_BYTES32 && s.keys[operator].length() > MAX_DISABLED_KEYS + 1) {
            revert MaxDisabledKeysReached();
        }

        if (s.keys[operator].length() > 0) {
            // try to remove disabled keys
            bytes32 prevKey = s.keys[operator].array[0].value;
            if (s.keys[operator].checkUnregister(_now(), _SLASHING_WINDOW(), prevKey)) {
                s.keys[operator].unregister(_now(), _SLASHING_WINDOW(), prevKey);
                delete s.keyToOperator[prevKey];
            } else if (s.keys[operator].wasActiveAt(_now(), prevKey)) {
                s.keys[operator].pause(_now(), prevKey);
            }
        }

        if (key != ZERO_BYTES32) {
            // register the new key
            s.keys[operator].register(_now(), key);
            s.keyToOperator[key] = operator;
        }
    }
}
