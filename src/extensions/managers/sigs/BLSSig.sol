// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SigManager} from "../../../managers/extendable/SigManager.sol";
import {BN254} from "../../../libraries/BN254.sol";

import {IBLSSig} from "../../../interfaces/extensions/managers/sigs/IBLSSig.sol";

/**
 * @title BLSSig
 * @notice Manages BLS public keys and signature verification
 */
abstract contract BLSSig is SigManager, IBLSSig {
    using BN254 for BN254.G1Point;

    /**
     * @inheritdoc IBLSSig
     */
    uint64 public constant BLSSig_VERSION = 1;

    /**
     * @inheritdoc SigManager
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
     * @inheritdoc IBLSSig
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
