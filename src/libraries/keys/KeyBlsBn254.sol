// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BN254} from "../utils/BN254.sol";

library KeyBlsBn254 {
    using KeyBlsBn254 for KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;

    struct KEY_BLS_BN254 {
        BN254.G1Point value;
    }

    function wrap(
        BN254.G1Point memory keyRaw
    ) internal view returns (KEY_BLS_BN254 memory key) {
        if (keyRaw.X == 0 && keyRaw.Y == 0) {
            return KEY_BLS_BN254(keyRaw);
        }
        (uint256 beta, uint256 derivedY) = BN254.findYFromX(keyRaw.X);
        if (mulmod(derivedY, derivedY, BN254.FP_MODULUS) != beta) {
            revert("Invalid key");
        }
        if (keyRaw.Y != derivedY && keyRaw.Y != BN254.FP_MODULUS - derivedY) {
            revert("Invalid key");
        }
        key = KEY_BLS_BN254(keyRaw);
    }

    function unwrap(
        KEY_BLS_BN254 memory key
    ) internal view returns (BN254.G1Point memory keyRaw) {
        keyRaw = key.value;
    }

    function serialize(
        KEY_BLS_BN254 memory key
    ) internal view returns (bytes memory keySerialized) {
        if (key.value.X == 0 && key.value.Y == 0) {
            return abi.encode(bytes32(0));
        }
        (, uint256 derivedY) = BN254.findYFromX(key.value.X);
        keySerialized = abi.encode(bytes32((key.value.X << 1) | (derivedY == key.value.Y ? 0 : 1)));
    }

    function deserialize(
        bytes memory keySerialized
    ) internal view returns (KEY_BLS_BN254 memory key) {
        bytes32 compressedKey = abi.decode(keySerialized, (bytes32));
        if (compressedKey == bytes32(0)) {
            return KEY_BLS_BN254(BN254.G1Point({X: 0, Y: 0}));
        }
        uint256 X = uint256(compressedKey) >> 1;
        (, uint256 derivedY) = BN254.findYFromX(X);
        key = KEY_BLS_BN254(
            (uint256(compressedKey) & 1) == 1
                ? BN254.negate(BN254.G1Point({X: X, Y: derivedY}))
                : BN254.G1Point({X: X, Y: derivedY})
        );
    }

    function toBytes(
        KEY_BLS_BN254 memory key
    ) internal view returns (bytes memory keyBytes) {
        keyBytes = abi.encode(key.value);
    }

    function fromBytes(
        bytes memory keyBytes
    ) internal view returns (KEY_BLS_BN254 memory key) {
        key = KEY_BLS_BN254(abi.decode(keyBytes, (BN254.G1Point)));
        bytes memory keyBytesDerived = key.unwrap().wrap().toBytes();
        if (keyBytesDerived.length != keyBytes.length || keccak256(keyBytesDerived) != keccak256(keyBytes)) {
            revert("Invalid bytes");
        }
    }
}
