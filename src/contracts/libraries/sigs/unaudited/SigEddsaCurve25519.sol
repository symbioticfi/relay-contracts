// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyEddsaCurve25519} from "../../keys/unaudited/KeyEddsaCurve25519.sol";

import {SCL_EIP6565} from "@crypto-lib/lib/libSCL_EIP6565.sol";

library SigEddsaCurve25519 {
    using KeyEddsaCurve25519 for KeyEddsaCurve25519.KEY_EDDSA_CURVE25519;

    function verify(
        bytes memory keyBytes,
        bytes memory message,
        bytes memory signature,
        bytes memory /* extraData */
    ) internal view returns (bool) {
        KeyEddsaCurve25519.KEY_EDDSA_CURVE25519 memory key = KeyEddsaCurve25519.fromBytes(keyBytes);
        if (key.equal(KeyEddsaCurve25519.zeroKey())) {
            return false;
        }

        bytes32 keyRaw = key.unwrap();
        (uint256 r, uint256 s) = abi.decode(signature, (uint256, uint256));

        (uint256 x, uint256 y) = key.decompress();

        uint256[5] memory extPubkey;
        extPubkey[4] = uint256(keyRaw);
        (extPubkey[0], extPubkey[1]) = SCL_EIP6565.Edwards2WeierStrass(x, y);
        return SCL_EIP6565.Verify_LE(string(message), r, s, extPubkey);
    }
}
