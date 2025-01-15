// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";
import {PauseableEnumerableSet} from "../../../libraries/PauseableEnumerableSet.sol";

/**
 * @title KeyManagerAddress
 * @notice Manages storage and validation of operator keys using address values
 * @dev Extends KeyManager to provide key management functionality
 */
abstract contract KeyManagerAddress is KeyManager {
    uint64 public constant KeyManagerAddress_VERSION = 1;

    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;

    error DuplicateKey();
    error MaxDisabledKeysReached();

    uint256 private constant MAX_DISABLED_KEYS = 1;

    struct KeyManagerAddressStorage {
        /// @notice Mapping from operator addresses to their keys
        mapping(address => PauseableEnumerableSet.AddressSet) _keys;
        /// @notice Mapping from keys to operator addresses
        mapping(address => address) _keyToOperator;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManagerAddress")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerAddressStorageLocation =
        0xb864e827a56afd83aa8f7940e556fe526831aa2e6001c2c692580b8e7a7d1d00;

    function _getKeyManagerAddressStorage() internal pure returns (KeyManagerAddressStorage storage s) {
        bytes32 location = KeyManagerAddressStorageLocation;
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
        KeyManagerAddressStorage storage $ = _getKeyManagerAddressStorage();
        return $._keyToOperator[abi.decode(key, (address))];
    }

    /**
     * @notice Gets an operator's active key at the current capture timestamp
     * @param operator The operator address to lookup
     * @return The operator's active key encoded as bytes, or encoded zero bytes if none
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {
        KeyManagerAddressStorage storage $ = _getKeyManagerAddressStorage();
        address[] memory active = $._keys[operator].getActive(getCaptureTimestamp());
        if (active.length == 0) {
            return abi.encode(address(0));
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
        KeyManagerAddressStorage storage $ = _getKeyManagerAddressStorage();
        address key = abi.decode(key_, (address));
        return $._keys[$._keyToOperator[key]].wasActiveAt(timestamp, key);
    }

    /**
     * @notice Updates an operator's key
     * @dev Handles key rotation by disabling old key and registering new one
     * @param operator The operator address to update
     * @param key_ The new key to register, encoded as bytes
     */
    function _updateKey(address operator, bytes memory key_) internal override {
        KeyManagerAddressStorage storage $ = _getKeyManagerAddressStorage();
        address key = abi.decode(key_, (address));
        uint48 timestamp = _now();

        if ($._keyToOperator[key] != address(0)) {
            revert DuplicateKey();
        }

        // check if we have reached the max number of disabled keys
        // this allow us to limit the number times we can change the key
        if (key != address(0) && $._keys[operator].length() > MAX_DISABLED_KEYS + 1) {
            revert MaxDisabledKeysReached();
        }

        if ($._keys[operator].length() > 0) {
            // try to remove disabled keys
            address prevKey = address($._keys[operator].set.array[0].value);
            if ($._keys[operator].checkUnregister(timestamp, _SLASHING_WINDOW(), prevKey)) {
                $._keys[operator].unregister(timestamp, _SLASHING_WINDOW(), prevKey);
                delete $._keyToOperator[prevKey];
            } else if ($._keys[operator].wasActiveAt(timestamp, prevKey)) {
                $._keys[operator].pause(timestamp, prevKey);
            }
        }

        if (key != address(0)) {
            // register the new key
            $._keys[operator].register(timestamp, key);
            $._keyToOperator[key] = operator;
        }
    }
}
