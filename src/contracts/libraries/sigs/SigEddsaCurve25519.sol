// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyEddsaCurve25519} from "../keys/KeyEddsaCurve25519.sol";

import {SCL_EIP6565} from "@crypto-lib/lib/libSCL_EIP6565.sol";
import {SCL_sha512} from "@crypto-lib/hash/SCL_sha512.sol";
import {SqrtMod} from "@crypto-lib/modular/SCL_sqrtMod_5mod8.sol";
import {p, d, pMINUS_1} from "@crypto-lib/fields/SCL_wei25519.sol";
import {ModInv} from "@crypto-lib/modular/SCL_modular.sol";

library SigEddsaCurve25519 {
    using KeyEddsaCurve25519 for KeyEddsaCurve25519.KEY_EDDSA_CURVE25519;

    function verify(
        bytes memory keyBytes,
        bytes memory message,
        bytes memory signature,
        bytes memory /* extraData */
    ) internal returns (bool) {
        KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key = KeyEddsaCurve25519.fromBytes(keyBytes);
        if (key.equal(KeyEddsaCurve25519.zeroKey())) {
            return false;
        }

        bytes32 keyRaw = key.unwrap();

        uint256 kPubC = SCL_sha512.Swap256(uint256(keyRaw));
        (uint256 r, uint256 s) = abi.decode(signature, (uint256, uint256));

        uint256 y = kPubC & 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        uint256 y2 = mulmod(y, y, p);
        uint256 x = SqrtMod(mulmod(addmod(y2, pMINUS_1, p), ModInv(addmod(mulmod(d, y2, p), 1, p), p), p));
        if ((x & 1) != kPubC >> 255) {
            x = p - x;
        }

        // Decompress pubkey into extended coordinates
        uint256[5] memory extPubkey;
        extPubkey[4] = uint256(keyRaw); // Compressed pubkey
        (extPubkey[0], extPubkey[1]) = SCL_EIP6565.Edwards2WeierStrass(x, y);
        return SCL_EIP6565.Verify_LE(string(message), r, s, extPubkey);
    }
}
