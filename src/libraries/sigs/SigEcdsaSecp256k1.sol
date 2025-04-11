// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyEcdsaSecp256k1} from "../keys/KeyEcdsaSecp256k1.sol";

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

library SigEcdsaSecp256k1 {
    using ECDSA for bytes32;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    function verify(
        bytes memory key,
        bytes memory message,
        bytes memory signature,
        bytes memory /* extraData */
    ) internal returns (bool) {
        address signer = ECDSA.recover(abi.decode(message, (bytes32)), signature);
        return signer != address(0) && signer == KeyEcdsaSecp256k1.fromBytes(key).unwrap();
    }
}
