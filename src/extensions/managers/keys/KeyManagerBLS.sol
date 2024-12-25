// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";
import {PauseableEnumerableSet} from "../../../libraries/PauseableEnumerableSet.sol";
import {BN254} from "../../../libraries/BN254.sol";
import {BLSSig} from "../sigs/BLSSig.sol";

/**
 * @title KeyManagerBLS
 * @notice Manages storage and validation of operator keys using BLS G1 points
 * @dev Extends KeyManager to provide key management functionality
 */
abstract contract KeyManagerBLS is KeyManager, BLSSig {
    using BN254 for BN254.G1Point;
    using PauseableEnumerableSet for PauseableEnumerableSet.Status;

    uint64 public constant KeyManagerBLS_VERSION = 1;

    error DuplicateKey();
    error PreviousKeySlashable();

    struct KeyManagerBLSStorage {
        mapping(address => BN254.G1Point) _key;
        mapping(address => BN254.G1Point) _prevKey;
        mapping(uint256 => uint48) _aggregatedKeyTimestamp;
        mapping(uint256 => PauseableEnumerableSet.InnerAddress) _keyData;
        BN254.G1Point _aggregatedKey;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManagerBLS")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerBLSStorageLocation =
        0x4da47716e6090d5a5545e03387f4dac112d37cd069a5573bb81de8579bd9dc00;

    function _getKeyManagerBLSStorage() internal pure returns (KeyManagerBLSStorage storage s) {
        bytes32 location = KeyManagerBLSStorageLocation;
        assembly {
            s.slot := location
        }
    }

    function verifyAggregate(
        uint48 timestamp,
        BN254.G1Point memory aggregateG1Key,
        BN254.G2Point memory aggregateG2Key,
        BN254.G1Point memory signature,
        bytes32 messageHash,
        BN254.G1Point[] memory nonSigningKeys
    ) public view returns (bool) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        if ($._aggregatedKeyTimestamp[aggregateG1Key.X] != timestamp) {
            return false;
        }
        BN254.G1Point memory aggregatedNonSigningKey = BN254.G1Point(0, 0);
        for (uint256 i = 0; i < nonSigningKeys.length; i++) {
            if (!$._keyData[nonSigningKeys[i].X].status.wasActiveAt(timestamp)) {
                return false;
            }
            if (true) {
                aggregatedNonSigningKey = aggregatedNonSigningKey.plus(nonSigningKeys[i]);
            }
        }
        aggregateG1Key = aggregateG1Key.plus(aggregatedNonSigningKey.negate());
        return BLSSig.verify(aggregateG1Key, aggregateG2Key, signature, messageHash);
    }

    /**
     * @notice Gets the operator address associated with a key
     * @param key The key to lookup
     * @return The operator address that owns the key, or zero address if none
     */
    function operatorByKey(
        bytes memory key
    ) public view override returns (address) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        BN254.G1Point memory g1Point = abi.decode(key, (BN254.G1Point));
        return $._keyData[g1Point.X].value;
    }

    /**
     * @notice Gets an operator's active key at the current capture timestamp
     * @param operator The operator address to lookup
     * @return The operator's active key encoded as bytes, or encoded zero bytes if none
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        uint48 timestamp = getCaptureTimestamp();
        BN254.G1Point memory key = $._key[operator];
        if ((key.X != 0 || key.Y != 0) && $._keyData[key.X].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        key = $._prevKey[operator];
        if ((key.X != 0 || key.Y != 0) && $._keyData[key.X].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        return abi.encode(BN254.G1Point(0, 0));
    }

    /**
     * @notice Checks if a key was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param key_ The key to check
     * @return True if the key was active at the timestamp, false otherwise
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key_) public view override returns (bool) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        BN254.G1Point memory key = abi.decode(key_, (BN254.G1Point));
        return $._keyData[key.X].status.wasActiveAt(timestamp);
    }

    /**
     * @notice Updates an operator's key
     * @dev Handles key rotation by disabling old key and registering new one
     * @param operator The operator address to update
     * @param key_ The new key to register, encoded as bytes
     */
    function _updateKey(address operator, bytes memory key_) internal override {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        BN254.G1Point memory key = abi.decode(key_, (BN254.G1Point));
        uint48 timestamp = _now();

        if ($._keyData[key.X].value != address(0)) {
            revert DuplicateKey();
        }

        BN254.G1Point memory prevKey = $._prevKey[operator];
        if (prevKey.X != 0 || prevKey.Y != 0) {
            if (!$._keyData[prevKey.X].status.checkUnregister(timestamp, _SLASHING_WINDOW())) {
                revert PreviousKeySlashable();
            }
            delete $._keyData[prevKey.X];
            $.aggregateKey = $.aggregateKey.plus(prevKey.negate());
        }

        BN254.G1Point memory currentKey = $._key[operator];
        if (currentKey.X != 0 || currentKey.Y != 0) {
            $._keyData[currentKey.X].status.disable(timestamp);
            $.aggregateKey = $.aggregateKey.plus(currentKey.negate());
        }

        $._prevKey[operator] = currentKey;
        $._key[operator] = key;

        if (key.X != 0 || key.Y != 0) {
            $._keyData[key.X].value = operator;
            $._keyData[key.X].status.set(timestamp);
            $.aggregateKey = $.aggregateKey.plus(key);
        }
    }
}
