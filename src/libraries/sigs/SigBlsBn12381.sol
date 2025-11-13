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

    uint256 internal constant FR_MODULUS = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
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
        uint256 alpha = uint256(keccak256(abi.encode(signatureG1, keyG1, keyG2, messageG1))) % FR_MODULUS;

        BN12381.G1Point memory signatureTerm = BN12381.add(signatureG1, _scalarMulG1(keyG1, alpha));
        BN12381.G1Point memory messageTerm = BN12381.add(messageG1, _scalarMulG1(_generatorG1(), alpha));

        BN12381.G1Point[] memory g1Points = new BN12381.G1Point[](2);
        g1Points[0] = signatureTerm;
        g1Points[1] = messageTerm;
        BN12381.G2Point[] memory g2Points = new BN12381.G2Point[](2);
        g2Points[0] = BN12381.negGeneratorG2();
        g2Points[1] = keyG2;
        return BN12381.pairing(g1Points, g2Points);
    }

    function _scalarMulG1(BN12381.G1Point memory point, uint256 scalar)
        private
        view
        returns (BN12381.G1Point memory result)
    {
        BN12381.G1Point[] memory points = new BN12381.G1Point[](1);
        bytes32[] memory scalars = new bytes32[](1);
        points[0] = point;
        scalars[0] = bytes32(scalar);
        result = BN12381.msm(points, scalars);
    }

    function _generatorG1() private pure returns (BN12381.G1Point memory) {
        return BN12381.negate(BN12381.negGeneratorG1());
    }
}
