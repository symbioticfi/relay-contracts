// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";
import {PauseableEnumerableSet} from "../../../libraries/PauseableEnumerableSet.sol";

import {IKeyManagerAddress} from "../../../interfaces/extensions/managers/keys/IKeyManagerAddress.sol";
import {IKeyManager} from "../../../interfaces/managers/extendable/IKeyManager.sol";

/**
 * @title KeyManagerAddress
 * @notice Manages storage and validation of operator keys using address values
 * @dev Extends KeyManager to provide key management functionality
 */
abstract contract KeyManagerAddress is KeyManager, IKeyManagerAddress {
    using PauseableEnumerableSet for PauseableEnumerableSet.Status;

    /**
     * @inheritdoc IKeyManagerAddress
     */
    uint64 public constant KeyManagerAddress_VERSION = 1;

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
     * @inheritdoc IKeyManager
     */
    function operatorByKey(
        bytes memory key
    ) public view override returns (address) {
        KeyManagerAddressStorage storage $ = _getKeyManagerAddressStorage();
        return $._keyData[abi.decode(key, (address))].value;
    }

    /**
     * @inheritdoc IKeyManager
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
     * @inheritdoc IKeyManager
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key_) public view override returns (bool) {
        KeyManagerAddressStorage storage $ = _getKeyManagerAddressStorage();
        address key = abi.decode(key_, (address));
        return $._keyData[key].status.wasActiveAt(timestamp);
    }

    /**
     * @inheritdoc KeyManager
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

        emit UpdateKey(operator, key_);
    }
}
