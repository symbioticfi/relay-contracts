// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BLS12381} from "../../src/libraries/utils/BLS12381.sol";
import {KeyBlsBls12381} from "../../src/libraries/keys/KeyBlsBls12381.sol";

contract KeyBlsBls12381Mock {
    function wrap(BLS12381.G1Point memory keyRaw) public view returns (KeyBlsBls12381.KEY_BLS_BLS12381 memory key) {
        return KeyBlsBls12381.wrap(keyRaw);
    }

    function unwrap(KeyBlsBls12381.KEY_BLS_BLS12381 memory key) public view returns (BLS12381.G1Point memory keyRaw) {
        return KeyBlsBls12381.unwrap(key);
    }

    function serialize(KeyBlsBls12381.KEY_BLS_BLS12381 memory key) public view returns (bytes memory keySerialized) {
        return KeyBlsBls12381.serialize(key);
    }

    function deserialize(bytes memory keySerialized) public view returns (KeyBlsBls12381.KEY_BLS_BLS12381 memory key) {
        return KeyBlsBls12381.deserialize(keySerialized);
    }

    function toBytes(KeyBlsBls12381.KEY_BLS_BLS12381 memory key) public view returns (bytes memory keyBytes) {
        return KeyBlsBls12381.toBytes(key);
    }

    function fromBytes(bytes memory keyBytes) public view returns (KeyBlsBls12381.KEY_BLS_BLS12381 memory key) {
        return KeyBlsBls12381.fromBytes(keyBytes);
    }

    function zeroKey() public view returns (KeyBlsBls12381.KEY_BLS_BLS12381 memory key) {
        return KeyBlsBls12381.zeroKey();
    }

    function equal(KeyBlsBls12381.KEY_BLS_BLS12381 memory key1, KeyBlsBls12381.KEY_BLS_BLS12381 memory key2)
        public
        view
        returns (bool)
    {
        return KeyBlsBls12381.equal(key1, key2);
    }
}
