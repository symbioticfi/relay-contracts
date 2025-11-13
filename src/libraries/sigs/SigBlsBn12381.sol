// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BN12381} from "../utils/BN12381.sol";
import {KeyBlsBn12381} from "../keys/KeyBlsBn12381.sol";

/**
 * @title SigBlsBn12381
 * @notice Library for verifying BLS signatures on the BN12381 curve.
 */
library SigBlsBn12381 {
    using BN12381 for BN12381.G1Point;
    using KeyBlsBn12381 for KeyBlsBn12381.KEY_BLS_BN12381;

    bytes internal constant DST_G1 = "BLS_SIG_BLS12381G1_XMD:SHA-256_SSWU_RO_NUL_";

    /**
     * @notice Reverts when the message length is invalid.
     */
    error SigBlsBn12381_InvalidMessageLength();

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
    function verify(
        bytes memory keyBytes,
        bytes memory message,
        bytes memory signature,
        bytes memory extraData
    )
        internal
        view
        returns (bool)
    {
        if (message.length != 32) {
            revert SigBlsBn12381_InvalidMessageLength();
        }

        BN12381.G1Point memory keyG1 = KeyBlsBn12381.fromBytes(keyBytes).unwrap();
        BN12381.G2Point memory keyG2 = abi.decode(extraData, (BN12381.G2Point));
        BN12381.G1Point memory signatureG1 = abi.decode(signature, (BN12381.G1Point));
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
        BN12381.G1Point memory keyG1,
        bytes32 messageHash,
        BN12381.G1Point memory signatureG1,
        BN12381.G2Point memory keyG2
    ) internal view returns (bool) {
        if (keyG1.x_a == 0 && keyG1.x_b == 0 && keyG1.y_a == 0 && keyG1.y_b == 0) {
            return false;
        }
        BN12381.G1Point memory messageG1 = BN12381.hashToG1(DST_G1, abi.encodePacked(messageHash));
        uint256 alpha = uint256(keccak256(abi.encode(signatureG1, keyG1, keyG2, messageG1))) % BN12381.FR_MODULUS;

        return BN12381.pairing(
            signatureG1.add(keyG1.scalarMulG1(alpha)),
            BN12381.negGeneratorG2(),
            messageG1.add(BN12381.generatorG1().scalarMulG1(alpha)),
            keyG2
        );
    }

}
