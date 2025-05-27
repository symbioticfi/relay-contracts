// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyEddsaCurve25519} from "../../src/contracts/libraries/keys/unaudited/KeyEddsaCurve25519.sol";

contract KeyEddsaCurve25519Mock {
    function wrap(
        bytes32 keyRaw
    ) public view returns (KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key) {
        return KeyEddsaCurve25519.wrap(keyRaw);
    }

    function unwrap(
        KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key
    ) public view returns (bytes32 keyRaw) {
        return KeyEddsaCurve25519.unwrap(key);
    }

    function serialize(
        KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key
    ) public view returns (bytes memory keySerialized) {
        return KeyEddsaCurve25519.serialize(key);
    }

    function deserialize(
        bytes memory keySerialized
    ) public view returns (KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key) {
        return KeyEddsaCurve25519.deserialize(keySerialized);
    }

    function toBytes(
        KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key
    ) public view returns (bytes memory keyBytes) {
        return KeyEddsaCurve25519.toBytes(key);
    }

    function fromBytes(
        bytes memory keyBytes
    ) public view returns (KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key) {
        return KeyEddsaCurve25519.fromBytes(keyBytes);
    }

    function zeroKey() public view returns (KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key) {
        return KeyEddsaCurve25519.zeroKey();
    }

    function equal(
        KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key1,
        KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key2
    ) public view returns (bool) {
        return KeyEddsaCurve25519.equal(key1, key2);
    }
}
