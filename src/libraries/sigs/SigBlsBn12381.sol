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

    /**
     * @notice Reverts when the message length is invalid.
     */
    error SigBlsBn12381_InvalidMessageLength();

    /**
     * @notice Verify a BLS signature.
     * @param keyBytes The encoded G1 public key.
     * @param message The encoded message hash to verify.
     * @param signature The encoded G2 signature.
     * @return If the signature is valid.
     * @dev Burns the whole gas if pairing precompile fails.
     *      Returns false if the key is zero G1 point.
     */
    function verify(
        bytes memory keyBytes,
        bytes memory message,
        bytes memory signature,
        bytes memory /* extraData */
    )
        internal
        view
        returns (bool)
    {
        if (message.length != 32) {
            revert SigBlsBn12381_InvalidMessageLength();
        }

        BN12381.G1Point memory keyG1 = KeyBlsBn12381.fromBytes(keyBytes).unwrap();
        BN12381.G2Point memory signatureG2 = abi.decode(signature, (BN12381.G2Point));
        bytes32 messageHash = abi.decode(message, (bytes32));

        return verify(keyG1, messageHash, signatureG2);
    }

    /**
     * @notice Verify a BLS signature.
     * @param keyG1 The G1 public key.
     * @param messageHash The message hash to verify.
     * @param signatureG2 The G2 signature.
     * @return If the signature is valid.
     * @dev Burns the whole gas if pairing precompile fails.
     *      Returns false if the key is zero G1 point.
     */
    function verify(BN12381.G1Point memory keyG1, bytes32 messageHash, BN12381.G2Point memory signatureG2)
        internal
        view
        returns (bool)
    {
        if (keyG1.x_a == 0 && keyG1.x_b == 0 && keyG1.y_a == 0 && keyG1.y_b == 0) {
            return false;
        }
        BN12381.G2Point memory messageG2 = BN12381.hashToG2(abi.encodePacked(messageHash));
        BN12381.G1Point[] memory g1Points = new BN12381.G1Point[](2);
        g1Points[0] = keyG1;
        g1Points[1] = BN12381.negGeneratorG1();
        BN12381.G2Point[] memory g2Points = new BN12381.G2Point[](2);
        g2Points[0] = messageG2;
        g2Points[1] = signatureG2;
        return BN12381.pairing(g1Points, g2Points);
    }
}
