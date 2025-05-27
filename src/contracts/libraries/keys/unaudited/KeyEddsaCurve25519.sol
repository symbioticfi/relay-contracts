// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

import {SCL_sha512} from "@crypto-lib/hash/SCL_sha512.sol";
import {SqrtMod} from "../../utils/unaudited/SCL_sqrtMod_5mod8.sol";
import {p, d, pMINUS_1} from "@crypto-lib/fields/SCL_wei25519.sol";
import {ModInv} from "@crypto-lib/modular/SCL_modular.sol";

library KeyEddsaCurve25519 {
    using KeyEddsaCurve25519 for KEY_EDDSA_CURVE25519;
    using KeyEddsaCurve25519 for bytes32;
    using Strings for string;

    error InvalidBytes();
    error InvalidKey();

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

        (uint256 x, uint256 y) = key.decompress();
        uint256 y2 = mulmod(y, y, p);
        uint256 x2 = mulmod(x, x, p);
        if (addmod(y2, p - x2, p) != addmod(1, mulmod(d, mulmod(x2, y2, p), p), p)) {
            revert InvalidKey();
        }
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
        key = abi.decode(keyBytes, (KEY_EDDSA_CURVE25519));
        bytes memory keyBytesDerived = key.unwrap().wrap().toBytes();
        if (keccak256(keyBytesDerived) != keccak256(keyBytes)) {
            revert InvalidBytes();
        }
    }

    function zeroKey() internal view returns (KEY_EDDSA_CURVE25519 memory key) {
        key = KEY_EDDSA_CURVE25519(bytes32(0));
    }

    function equal(KEY_EDDSA_CURVE25519 memory key1, KEY_EDDSA_CURVE25519 memory key2) internal view returns (bool) {
        return key1.value == key2.value;
    }

    function decompress(
        KEY_EDDSA_CURVE25519 memory key
    ) internal view returns (uint256 x, uint256 y) {
        uint256 kPubC = SCL_sha512.Swap256(uint256(key.value));
        y = kPubC & 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        uint256 y2 = mulmod(y, y, p);
        x = SqrtMod(mulmod(addmod(y2, pMINUS_1, p), ModInv(addmod(mulmod(d, y2, p), 1, p), p), p));
        if ((x & 1) != kPubC >> 255) {
            x = p - x;
        }
    }
}
