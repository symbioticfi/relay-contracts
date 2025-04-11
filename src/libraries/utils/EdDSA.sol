// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SCL_EIP6565} from "@crypto-lib/lib/libSCL_EIP6565.sol";
import {SCL_sha512} from "@crypto-lib/hash/SCL_sha512.sol";
import {SqrtMod} from "@crypto-lib/modular/SCL_sqrtMod_5mod8.sol";
import {p, d, pMINUS_1} from "@crypto-lib/fields/SCL_wei25519.sol";
import {ModInv} from "@crypto-lib/modular/SCL_modular.sol";

/**
 * @title EdDSA
 * @notice Library for verifying EdDSA signatures on the Ed25519 curve
 * @dev Implements signature verification and point decompression for EdDSA
 */
library EdDSA {
    /**
     * @notice Verifies an EdDSA signature against a message and public key
     * @param message The message that was signed
     * @param signature The signature to verify, encoded as (r,s) coordinates
     * @param pubkey The compressed public key to verify against
     * @return bool True if the signature is valid, false otherwise
     * @dev Decompresses the public key, converts to Weierstrass form, and verifies using EIP-6565
     */
    function verify(bytes memory message, bytes memory signature, bytes32 pubkey) public returns (bool) {
        (uint256 r, uint256 s) = abi.decode(signature, (uint256, uint256));
        // Decompress pubkey into extended coordinates
        uint256[5] memory extPubkey;
        extPubkey[4] = uint256(pubkey); // Compressed pubkey
        (extPubkey[0], extPubkey[1]) = edDecompress(SCL_sha512.Swap256(extPubkey[4]));
        (extPubkey[0], extPubkey[1]) = SCL_EIP6565.Edwards2WeierStrass(extPubkey[0], extPubkey[1]);
        return SCL_EIP6565.Verify_LE(string(message), r, s, extPubkey);
    }

    /**
     * @notice Decompresses an Ed25519 public key from its compressed form
     * from here https://github.com/get-smooth/crypto-lib/blob/f2c00ecced1df96fe81894d19a6b8ec754beedb9/test/libSCL_eip6565.t.sol#L44
     * @param KPubC The compressed public key point in Edwards form, with sign bit in MSB
     * @return x The x-coordinate of the decompressed point on Edwards curve
     * @return y The y-coordinate of the decompressed point on Edwards curve
     * @dev Recovers x-coordinate using the curve equation: -x^2 + y^2 = 1 + d*x^2*y^2
     * @dev The compressed form stores the y-coordinate in the lower 255 bits and sign of x in bit 255
     * @dev If computed x doesn't match the sign bit, negates x mod p
     */
    function edDecompress(
        uint256 KPubC
    ) public returns (uint256 x, uint256 y) {
        uint256 sign = (KPubC >> 255) & 1; //parity bit is the highest bit of compressed point
        y = KPubC & 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        uint256 x2;
        uint256 y2 = mulmod(y, y, p);

        x2 = mulmod(addmod(y2, pMINUS_1, p), ModInv(addmod(mulmod(d, y2, p), 1, p), p), p);
        x = SqrtMod(x2);
        if ((x & 1) != sign) {
            x = p - x;
        }
    }
}
