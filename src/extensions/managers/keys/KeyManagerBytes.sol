// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";
import {PauseableEnumerableSet} from "../../../libraries/PauseableEnumerableSet.sol";

/**
 * @title KeyManagerBytes
 * @notice Manages storage and validation of operator keys using bytes values
 * @dev Extends KeyManager to provide key management functionality
 */
abstract contract KeyManagerBytes is KeyManager {
    uint64 public constant KeyManagerBytes_VERSION = 1;

    using PauseableEnumerableSet for PauseableEnumerableSet.Status;

    error DuplicateKey();
    error PreviousKeySlashable();

    struct KeyManagerBytesStorage {
        mapping(address => bytes) _key;
        mapping(address => bytes) _prevKey;
        mapping(bytes => PauseableEnumerableSet.InnerAddress) _keyData;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManagerBytes")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerBytesStorageLocation =
        0x40e4e6d672540d8bc06612820fe8dc1fcfe7e420a91aaea066d48e4af34ab000;

    function _getKeyManagerBytesStorage() internal pure returns (KeyManagerBytesStorage storage s) {
        bytes32 location = KeyManagerBytesStorageLocation;
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
        KeyManagerBytesStorage storage $ = _getKeyManagerBytesStorage();
        return $._keyData[key].value;
    }

    /**
     * @notice Gets an operator's active key at the current capture timestamp
     * @param operator The operator address to lookup
     * @return The operator's active key encoded as bytes, or empty bytes if none
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {
        KeyManagerBytesStorage storage $ = _getKeyManagerBytesStorage();
        uint48 timestamp = getCaptureTimestamp();
        bytes memory key = $._key[operator];
        if (keccak256(key) != keccak256("") && $._keyData[key].status.wasActiveAt(timestamp)) {
            return key;
        }
        key = $._prevKey[operator];
        if (keccak256(key) != keccak256("") && $._keyData[key].status.wasActiveAt(timestamp)) {
            return key;
        }
        return "";
    }

    /**
     * @notice Checks if a key was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param key_ The key to check
     * @return True if the key was active at the timestamp, false otherwise
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key_) public view override returns (bool) {
        KeyManagerBytesStorage storage $ = _getKeyManagerBytesStorage();
        return $._keyData[key_].status.wasActiveAt(timestamp);
    }

    /**
     * @notice Updates an operator's key
     * @dev Handles key rotation by disabling old key and registering new one
     * @param operator The operator address to update
     * @param key_ The new key to register, encoded as bytes
     */
    function _updateKey(address operator, bytes memory key_) internal override {
        KeyManagerBytesStorage storage $ = _getKeyManagerBytesStorage();
        uint48 timestamp = _now();

        if ($._keyData[key_].value != address(0)) {
            revert DuplicateKey();
        }

        bytes memory prevKey = $._prevKey[operator];
        if (keccak256(prevKey) != keccak256("")) {
            if (!$._keyData[prevKey].status.checkUnregister(timestamp, _SLASHING_WINDOW())) {
                revert PreviousKeySlashable();
            }
            delete $._keyData[prevKey];
        }

        bytes memory currentKey = $._key[operator];
        if (keccak256(currentKey) != keccak256("")) {
            $._keyData[currentKey].status.disable(timestamp);
        }

        $._prevKey[operator] = currentKey;
        $._key[operator] = key_;

        if (keccak256(key_) != keccak256("")) {
            $._keyData[key_].value = operator;
            $._keyData[key_].status.set(timestamp);
        }
    }
}
