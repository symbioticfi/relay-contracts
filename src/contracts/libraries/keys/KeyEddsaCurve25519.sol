// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

import {p, d, pMINUS_1} from "@crypto-lib/fields/SCL_wei25519.sol";

library KeyEddsaCurve25519 {
    using KeyEddsaCurve25519 for KEY_EDDSA_CURVE25519;
    using KeyEddsaCurve25519 for bytes32;
    using Strings for string;

    error InvalidBytes();

    struct KEY_EDDSA_CURVE25519 {
        bytes32 value;
    }

    function wrap(
        bytes32 keyRaw
    ) internal view returns (KEY_EDDSA_CURVE25519 memory key) {
        if (keyRaw == bytes32(0)) {
            return zeroKey();
        }
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
        if (!string(keyBytesDerived).equal(string(keyBytes))) {
            revert InvalidBytes();
        }
    }

    function zeroKey() internal view returns (KEY_EDDSA_CURVE25519 memory key) {
        key = KEY_EDDSA_CURVE25519(bytes32(0));
    }

    function equal(KEY_EDDSA_CURVE25519 memory key1, KEY_EDDSA_CURVE25519 memory key2) internal view returns (bool) {
        return key1.value == key2.value;
    }
}
