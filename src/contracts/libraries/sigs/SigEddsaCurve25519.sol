// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyEddsaCurve25519} from "../keys/KeyEddsaCurve25519.sol";
import {EdDSA} from "../utils/EdDSA.sol";

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

        return EdDSA.verify(message, signature, key.unwrap());
    }
}
