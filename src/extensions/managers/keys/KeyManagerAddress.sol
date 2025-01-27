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

    using PauseableEnumerableSet for PauseableEnumerableSet.Status;

    error DuplicateKey();
    error PreviousKeySlashable();

    struct KeyManagerAddressStorage {
        mapping(address => address) _key;
        mapping(address => address) _prevKey;
        mapping(address => PauseableEnumerableSet.InnerAddress) _keyData;
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
        return $._keyData[abi.decode(key, (address))].value;
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
        uint48 timestamp = getCaptureTimestamp();
        address key = $._key[operator];
        if (key != address(0) && $._keyData[key].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        key = $._prevKey[operator];
        if (key != address(0) && $._keyData[key].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        return abi.encode(address(0));
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
        return $._keyData[key].status.wasActiveAt(timestamp);
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

        if ($._keyData[key].value != address(0)) {
            revert DuplicateKey();
        }

        address prevKey = $._prevKey[operator];
        if (prevKey != address(0)) {
            if (!$._keyData[prevKey].status.checkUnregister(timestamp, _SLASHING_WINDOW())) {
                revert PreviousKeySlashable();
            }
            delete $._keyData[prevKey];
        }

        address currentKey = $._key[operator];
        if (currentKey != address(0)) {
            $._keyData[currentKey].status.disable(timestamp);
        }

        $._prevKey[operator] = currentKey;
        $._key[operator] = key;

        if (key != address(0)) {
            $._keyData[key].value = operator;
            $._keyData[key].status.set(timestamp);
        }
    }
}
