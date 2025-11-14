// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BLS12381} from "../utils/BLS12381.sol";
import {KeyBlsBls12381} from "../keys/KeyBlsBls12381.sol";

/**
 * @title SigBlsBls12381
 * @notice Library for verifying BLS signatures on the BLS12381 curve.
 */
library SigBlsBls12381 {
    using BLS12381 for BLS12381.G1Point;
    using KeyBlsBls12381 for KeyBlsBls12381.KEY_BLS_BLS12381;

    bytes internal constant DST_G1 = "BLS_SIG_BLS12381G1_XMD:SHA-256_SSWU_RO_NUL_";

    /**
     * @notice Reverts when the message length is invalid.
     */
    error SigBlsBls12381_InvalidMessageLength();

    /**
     * @notice Verify a BLS signature.
     * @param keyBytes The encoded G1 public key.
     * @param message The encoded message hash to verify.
     * @param signature The encoded G1 signature.
     * @param extraData The encoded G2 public key.
     * @return If the signature is valid.
     * @dev Burns the whole gas if pairing precompile fails.
     *      Returns false if the key is zero G1 point.
     */
    function verify(bytes memory keyBytes, bytes memory message, bytes memory signature, bytes memory extraData)
        internal
        view
        returns (bool)
    {
        if (message.length != 32) {
            revert SigBlsBls12381_InvalidMessageLength();
        }

        BLS12381.G1Point memory keyG1 = KeyBlsBls12381.fromBytes(keyBytes).unwrap();
        BLS12381.G2Point memory keyG2 = abi.decode(extraData, (BLS12381.G2Point));
        BLS12381.G1Point memory signatureG1 = abi.decode(signature, (BLS12381.G1Point));
        bytes32 messageHash = abi.decode(message, (bytes32));

        return verify(keyG1, messageHash, signatureG1, keyG2);
    }

    /**
     * @notice Verify a BLS signature.
     * @param keyG1 The G1 public key.
     * @param messageHash The message hash to verify.
     * @param signatureG1 The G1 signature.
     * @param keyG2 The G2 public key.
     * @return If the signature is valid.
     * @dev Burns the whole gas if pairing precompile fails.
     *      Returns false if the key is zero G1 point.
     */
    function verify(
        BLS12381.G1Point memory keyG1,
        bytes32 messageHash,
        BLS12381.G1Point memory signatureG1,
        BLS12381.G2Point memory keyG2
    ) internal view returns (bool) {
        if (keyG1.x_a == 0 && keyG1.x_b == 0 && keyG1.y_a == 0 && keyG1.y_b == 0) {
            return false;
        }
        BLS12381.G1Point memory messageG1 = BLS12381.hashToG1(DST_G1, abi.encodePacked(messageHash));
        uint256 alpha = uint256(keccak256(abi.encode(signatureG1, keyG1, keyG2, messageG1))) % BLS12381.FR_MODULUS;

        return BLS12381.pairing(
            signatureG1.add(keyG1.scalarMulG1(alpha)),
            BLS12381.negGeneratorG2(),
            messageG1.add(BLS12381.generatorG1().scalarMulG1(alpha)),
            keyG2
        );
    }
}
