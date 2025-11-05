// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BN12381} from "../../src/libraries/utils/BN12381.sol";
import {KeyBlsBn12381} from "../../src/libraries/keys/KeyBlsBn12381.sol";

contract KeyBlsBn12381Mock {
    function wrap(BN12381.G1Point memory keyRaw) public view returns (KeyBlsBn12381.KEY_BLS_BN12381 memory key) {
        return KeyBlsBn12381.wrap(keyRaw);
    }

    function unwrap(KeyBlsBn12381.KEY_BLS_BN12381 memory key) public view returns (BN12381.G1Point memory keyRaw) {
        return KeyBlsBn12381.unwrap(key);
    }

    function serialize(KeyBlsBn12381.KEY_BLS_BN12381 memory key) public view returns (bytes memory keySerialized) {
        return KeyBlsBn12381.serialize(key);
    }

    function deserialize(bytes memory keySerialized) public view returns (KeyBlsBn12381.KEY_BLS_BN12381 memory key) {
        return KeyBlsBn12381.deserialize(keySerialized);
    }

    function toBytes(KeyBlsBn12381.KEY_BLS_BN12381 memory key) public view returns (bytes memory keyBytes) {
        return KeyBlsBn12381.toBytes(key);
    }

    function fromBytes(bytes memory keyBytes) public view returns (KeyBlsBn12381.KEY_BLS_BN12381 memory key) {
        return KeyBlsBn12381.fromBytes(keyBytes);
    }

    function zeroKey() public view returns (KeyBlsBn12381.KEY_BLS_BN12381 memory key) {
        return KeyBlsBn12381.zeroKey();
    }

    function equal(KeyBlsBn12381.KEY_BLS_BN12381 memory key1, KeyBlsBn12381.KEY_BLS_BN12381 memory key2)
        public
        view
        returns (bool)
    {
        return KeyBlsBn12381.equal(key1, key2);
    }
}
