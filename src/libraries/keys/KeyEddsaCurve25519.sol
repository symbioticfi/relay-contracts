// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library KeyEddsaCurve25519 {
    using KeyEddsaCurve25519 for KEY_EDDSA_CURVE25519;
    using KeyEddsaCurve25519 for bytes32;

    struct KEY_EDDSA_CURVE25519 {
        bytes32 value;
    }

    function wrap(
        bytes32 keyRaw
    ) internal view returns (KEY_EDDSA_CURVE25519 memory key) {
        key = KEY_EDDSA_CURVE25519(keyRaw);
    }

    function unwrap(
        KEY_EDDSA_CURVE25519 memory key
    ) internal view returns (bytes32 keyRaw) {
        keyRaw = key.value;
    }

    function serialize(
        KEY_EDDSA_CURVE25519 memory key
    ) internal view returns (bytes memory keySerialized) {
        keySerialized = abi.encode(key.value);
    }

    function deserialize(
        bytes memory keySerialized
    ) internal view returns (KEY_EDDSA_CURVE25519 memory key) {
        key = KEY_EDDSA_CURVE25519(abi.decode(keySerialized, (bytes32)));
    }

    function toBytes(
        KEY_EDDSA_CURVE25519 memory key
    ) internal view returns (bytes memory keyBytes) {
        keyBytes = abi.encode(key.value);
    }

    function fromBytes(
        bytes memory keyBytes
    ) internal view returns (KEY_EDDSA_CURVE25519 memory key) {
        key = KEY_EDDSA_CURVE25519(abi.decode(keyBytes, (bytes32)));
        bytes memory keyBytesDerived = key.unwrap().wrap().toBytes();
        if (keyBytesDerived.length != keyBytes.length || keccak256(keyBytesDerived) != keccak256(keyBytes)) {
            revert("Invalid bytes");
        }
    }
}
