// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyEcdsaSecp256k1} from "../keys/KeyEcdsaSecp256k1.sol";

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

library SigEcdsaSecp256k1 {
    using ECDSA for bytes32;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    function verify(
        bytes memory keyBytes,
        bytes memory message,
        bytes memory signature,
        bytes memory /* extraData */
    ) internal view returns (bool) {
        KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1 memory key = KeyEcdsaSecp256k1.fromBytes(keyBytes);
        if (key.equal(KeyEcdsaSecp256k1.zeroKey())) {
            return false;
        }

        return ECDSA.recover(abi.decode(message, (bytes32)), signature) == key.unwrap();
    }

    function verify(address key, bytes32 message, bytes memory signature) internal view returns (bool) {
        if (key == address(0)) {
            return false;
        }

        return ECDSA.recover(message, signature) == key;
    }
}
