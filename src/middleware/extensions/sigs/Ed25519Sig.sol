// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Ed25519} from "../../../libraries/Ed25519.sol";
import {BaseSig} from "./BaseSig.sol";

abstract contract Ed25519Sig is BaseSig {
    function _verifyKeySignature(
        address operator,
        bytes memory key_,
        bytes memory signature
    ) internal pure override returns (bool) {
        bytes32 key = abi.decode(key_, (bytes32));
        bytes32 r;
        bytes32 s;
        assembly {
            r := mload(add(signature, 32))
            s := mload(add(signature, 64))
        }
        bytes32 message = keccak256(abi.encodePacked(operator, key));
        return Ed25519.check(key, r, s, message, bytes9(0));
    }
}
