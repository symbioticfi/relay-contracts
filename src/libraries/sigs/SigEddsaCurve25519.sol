// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyEddsaCurve25519} from "../keys/KeyEddsaCurve25519.sol";
import {EdDSA} from "../utils/EdDSA.sol";

library SigEddsaCurve25519 {
    using KeyEddsaCurve25519 for KeyEddsaCurve25519.KEY_EDDSA_CURVE25519;

    function verify(
        bytes memory key,
        bytes memory message,
        bytes memory signature,
        bytes memory /* extraData */
    ) internal returns (bool) {
        return EdDSA.verify(message, signature, KeyEddsaCurve25519.fromBytes(key).unwrap());
    }
}
