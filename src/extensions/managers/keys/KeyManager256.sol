// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";
import {PauseableEnumerableSet} from "../../../libraries/PauseableEnumerableSet.sol";

import {IKeyManager256} from "../../../interfaces/extensions/managers/keys/IKeyManager256.sol";
import {IKeyManager} from "../../../interfaces/managers/extendable/IKeyManager.sol";

/**
 * @title KeyManager256
 * @notice Manages storage and validation of operator keys using bytes32 values
 * @dev Extends KeyManager to provide key management functionality
 */
abstract contract KeyManager256 is KeyManager, IKeyManager256 {
    using PauseableEnumerableSet for PauseableEnumerableSet.Status;

    /**
     * @inheritdoc IKeyManager256
     */
    uint64 public constant KeyManager256_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManager256")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManager256StorageLocation =
        0x3da47716e6090d5a5545e03387f4dac112d37cd069a5573bb81de8579bd9dc00;

    function _getKeyManager256Storage() internal pure returns (KeyManager256Storage storage s) {
        bytes32 location = KeyManager256StorageLocation;
        assembly {
            s.slot := location
        }
    }

    /**
     * @inheritdoc IKeyManager
     */
    function operatorByKey(
        bytes memory key
    ) public view override returns (address) {
        KeyManager256Storage storage $ = _getKeyManager256Storage();
        return $._keyData[abi.decode(key, (bytes32))].value;
    }

    /**
     * @inheritdoc IKeyManager
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {
        KeyManager256Storage storage $ = _getKeyManager256Storage();
        uint48 timestamp = getCaptureTimestamp();
        bytes32 key = $._key[operator];
        if (key != bytes32(0) && $._keyData[key].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        key = $._prevKey[operator];
        if (key != bytes32(0) && $._keyData[key].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        return abi.encode(bytes32(0));
    }

    /**
     * @inheritdoc IKeyManager
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key_) public view override returns (bool) {
        KeyManager256Storage storage $ = _getKeyManager256Storage();
        bytes32 key = abi.decode(key_, (bytes32));
        return $._keyData[key].status.wasActiveAt(timestamp);
    }

    /**
     * @inheritdoc KeyManager
     */
    function _updateKey(address operator, bytes memory key_) internal override {
        KeyManager256Storage storage $ = _getKeyManager256Storage();
        bytes32 key = abi.decode(key_, (bytes32));
        uint48 timestamp = _now();

        if ($._keyData[key].value != address(0)) {
            revert DuplicateKey();
        }

        bytes32 prevKey = $._prevKey[operator];
        if (prevKey != bytes32(0)) {
            if (!$._keyData[prevKey].status.checkUnregister(timestamp, _SLASHING_WINDOW())) {
                revert PreviousKeySlashable();
            }
            delete $._keyData[prevKey];
        }

        bytes32 currentKey = $._key[operator];
        if (currentKey != bytes32(0)) {
            $._keyData[currentKey].status.disable(timestamp);
        }

        $._prevKey[operator] = currentKey;
        $._key[operator] = key;

        if (key != bytes32(0)) {
            $._keyData[key].value = operator;
            $._keyData[key].status.set(timestamp);
        }

        emit UpdateKey(operator, key_);
    }
}
