// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyBlsBn254} from "../keys/KeyBlsBn254.sol";
import {BN254} from "../utils/BN254.sol";

library SigBlsBn254 {
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;

    function verify(
        bytes memory key,
        bytes memory message,
        bytes memory signature,
        bytes memory extraData
    ) internal returns (bool) {
        BN254.G1Point memory keyG1 = KeyBlsBn254.fromBytes(key).unwrap();
        BN254.G2Point memory keyG2 = abi.decode(extraData, (BN254.G2Point));
        BN254.G1Point memory signatureG1 = abi.decode(signature, (BN254.G1Point));

        BN254.G1Point memory messageG1 = BN254.hashToG1(abi.decode(message, (bytes32)));
        uint256 alpha = uint256(
            keccak256(
                abi.encodePacked(
                    signatureG1.X, signatureG1.Y, keyG1.X, keyG1.Y, keyG2.X, keyG2.Y, messageG1.X, messageG1.Y
                )
            )
        ) % BN254.FR_MODULUS;

        BN254.G1Point memory a1 = signatureG1.plus(keyG1.scalar_mul(alpha));
        BN254.G1Point memory b1 = messageG1.plus(BN254.generatorG1().scalar_mul(alpha));

        return BN254.pairing(a1, BN254.negGeneratorG2(), b1, keyG2);
    }
}
