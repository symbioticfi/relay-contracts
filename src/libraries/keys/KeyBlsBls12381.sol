// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BLS12381} from "../utils/BLS12381.sol";

/**
 * @title KeyBlsBls12381
 * @notice Library for interacting with BLS public keys on the BLS12381 curve, including validation, serialization, and compression.
 * @dev The keys are represented as G1 points on the BLS12381 curve.
 */
library KeyBlsBls12381 {
    using KeyBlsBls12381 for BLS12381.G1Point;
    using KeyBlsBls12381 for KEY_BLS_BLS12381;
    using BLS12381 for BLS12381.G1Point;
    using BLS12381 for uint256[2];

    /**
     * @notice Reverts when the key bytes are invalid.
     */
    error KeyBlsBls12381_InvalidBytes();

    /**
     * @notice Reverts when the key is invalid.
     */
    error KeyBlsBls12381_InvalidKey();

    /**
     * @notice The key wrapper.
     * @param value The G1 public key.
     */
    struct KEY_BLS_BLS12381 {
        BLS12381.G1Point value;
    }

    /**
     * @notice Wraps a G1 public key.
     * @param keyRaw The G1 public key.
     * @return key The wrapped key.
     * @dev Allows to wrap zero G1 point.
     */
    function wrap(BLS12381.G1Point memory keyRaw) internal view returns (KEY_BLS_BLS12381 memory key) {
        if (keyRaw.x_a == 0 && keyRaw.x_b == 0 && keyRaw.y_a == 0 && keyRaw.y_b == 0) {
            return zeroKey();
        }
        if (
            uint256(keyRaw.x_a) > BLS12381.P_A
                || (uint256(keyRaw.x_a) == BLS12381.P_A && uint256(keyRaw.x_b) > BLS12381.P_B)
                || uint256(keyRaw.y_a) > BLS12381.P_A
                || (uint256(keyRaw.y_a) == BLS12381.P_A && uint256(keyRaw.y_b) > BLS12381.P_B)
        ) {
            revert KeyBlsBls12381_InvalidKey();
        }
        if (!BLS12381.isOnCurve(keyRaw)) {
            revert KeyBlsBls12381_InvalidKey();
        }
        if (!BLS12381.isInSubgroup(keyRaw)) {
            revert KeyBlsBls12381_InvalidKey();
        }
        key = KEY_BLS_BLS12381(keyRaw);
    }

    /**
     * @notice Unwraps a key.
     * @param key The key.
     * @return keyRaw The G1 public key.
     */
    function unwrap(KEY_BLS_BLS12381 memory key) internal view returns (BLS12381.G1Point memory keyRaw) {
        keyRaw = key.value;
    }

    /**
     * @notice Serializes a key.
     * @param key The key.
     * @return keySerialized The serialized key.
     * @dev Compresses G1 point to 48 bytes (two 32 bytes words).
     */
    function serialize(KEY_BLS_BLS12381 memory key) internal view returns (bytes memory keySerialized) {
        if (key.value.x_a == 0 && key.value.x_b == 0 && key.value.y_a == 0 && key.value.y_b == 0) {
            return abi.encode([0, 0]);
        }
        (uint256 derivedY_a, uint256 derivedY_b) = BLS12381.findYFromX(uint256(key.value.x_a), uint256(key.value.x_b));
        keySerialized = abi.encode(
            [
                (uint256(key.value.x_a) << 1)
                    | (derivedY_a == uint256(key.value.y_a) && derivedY_b == uint256(key.value.y_b) ? 0 : 1),
                uint256(key.value.x_b)
            ]
        );
    }

    /**
     * @notice Deserializes a serialized key.
     * @param keySerialized The serialized key.
     * @return key The key.
     */
    function deserialize(bytes memory keySerialized) internal view returns (KEY_BLS_BLS12381 memory key) {
        uint256[2] memory compressedKey = abi.decode(keySerialized, (uint256[2]));
        if (compressedKey[0] == 0 && compressedKey[1] == 0) {
            return KEY_BLS_BLS12381(BLS12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0}));
        }
        uint256 x_a = compressedKey[0] >> 1;
        (uint256 derivedY_a, uint256 derivedY_b) = BLS12381.findYFromX(uint256(x_a), uint256(compressedKey[1]));
        key.value = BLS12381.G1Point({
            x_a: bytes32(x_a), x_b: bytes32(compressedKey[1]), y_a: bytes32(derivedY_a), y_b: bytes32(derivedY_b)
        });
        if (compressedKey[0] & 1 > 0) {
            key.value = BLS12381.negate(key.value);
        }
    }

    /**
     * @notice Converts a key to bytes.
     * @param key The key.
     * @return keyBytes The bytes representation of the key.
     * @dev It is a bytes representation of the underlying key itself.
     */
    function toBytes(KEY_BLS_BLS12381 memory key) internal view returns (bytes memory keyBytes) {
        keyBytes = abi.encode(key.value);
    }

    /**
     * @notice Converts bytes to a key.
     * @param keyBytes The bytes representation of the key.
     * @return key The key.
     */
    function fromBytes(bytes memory keyBytes) internal view returns (KEY_BLS_BLS12381 memory key) {
        key.value = abi.decode(keyBytes, (BLS12381.G1Point));
        if (keccak256(key.unwrap().wrap().toBytes()) != keccak256(keyBytes)) {
            revert KeyBlsBls12381_InvalidBytes();
        }
    }

    /**
     * @notice Returns a zero key.
     * @return key The zero key.
     */
    function zeroKey() internal view returns (KEY_BLS_BLS12381 memory key) {
        key = KEY_BLS_BLS12381(BLS12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0}));
    }

    /**
     * @notice Checks if two keys are equal.
     * @param key1 The first key.
     * @param key2 The second key.
     * @return If the keys are equal.
     */
    function equal(KEY_BLS_BLS12381 memory key1, KEY_BLS_BLS12381 memory key2) internal view returns (bool) {
        return key1.value.x_a == key2.value.x_a && key1.value.x_b == key2.value.x_b && key1.value.y_a == key2.value.y_a
            && key1.value.y_b == key2.value.y_b;
    }
}
