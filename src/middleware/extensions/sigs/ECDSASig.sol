// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {BaseSig} from "./BaseSig.sol";

abstract contract ECDSASig is BaseSig {
    using ECDSA for bytes32;

    function _verifyKeySignature(bytes memory key_, bytes memory signature) internal view override returns (bool) {
        bytes32 key = abi.decode(key_, (bytes32));
        bytes32 hash = keccak256(abi.encodePacked(msg.sender, key));
        address signer = hash.recover(signature);
        return signer == msg.sender;
    }
}
