// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SigManager} from "../../../managers/extendable/SigManager.sol";
import {BN254} from "../../../libraries/BN254.sol";

/**
 * @title BLSSig
 * @notice Manages BLS public keys and signature verification
 */
contract BLSSig is SigManager {
    using BN254 for BN254.G1Point;

    uint64 public constant BLSSig_VERSION = 1;

    /**
     * @notice Verifies that a signature was created by the owner of a key
     * @param operator The address of the operator that owns the key
     * @param key_ The BLS public key encoded as bytes
     * @param signature The BLS signature to verify
     * @return True if the signature was created by the key owner, false otherwise
     * @dev The key is expected to be ABI encoded (G1Point, G2Point) tuple
     */
    function _verifyKeySignature(
        address operator,
        bytes memory key_,
        bytes memory signature
    ) internal view override returns (bool) {
        (BN254.G1Point memory pubkeyG1, BN254.G2Point memory pubkeyG2) =
            abi.decode(key_, (BN254.G1Point, BN254.G2Point));

        BN254.G1Point memory sig = abi.decode(signature, (BN254.G1Point));
        bytes memory message = abi.encode(operator, pubkeyG1, pubkeyG2);
        bytes32 messageHash = keccak256(message);

        return verify(pubkeyG1, pubkeyG2, sig, messageHash);
    }

    /**
     * @notice Verifies a BLS signature
     * @param pubkeyG1 The G1 public key to verify against
     * @param pubkeyG2 The G2 public key to verify against
     * @param signature The signature to verify
     * @param messageHash The message hash that was signed
     * @return True if signature is valid, false otherwise
     */
    function verify(
        BN254.G1Point memory pubkeyG1,
        BN254.G2Point memory pubkeyG2,
        BN254.G1Point memory signature,
        bytes32 messageHash
    ) public view returns (bool) {
        BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash);
        uint256 alpha = uint256(
            keccak256(
                abi.encodePacked(
                    signature.X, signature.Y, pubkeyG1.X, pubkeyG1.Y, pubkeyG2.X, pubkeyG2.Y, messageG1.X, messageG1.Y
                )
            )
        ) % BN254.FR_MODULUS;

        BN254.G1Point memory a1 = signature.plus(pubkeyG1.scalar_mul(alpha));
        BN254.G1Point memory b1 = messageG1.plus(BN254.generatorG1().scalar_mul(alpha));

        return BN254.pairing(a1, BN254.negGeneratorG2(), b1, pubkeyG2);
    }
}
