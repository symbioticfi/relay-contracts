// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseSig} from "./BaseSig.sol";

abstract contract ECDSASig is BaseSig {
    function _verifyKeySignature(bytes memory key_, bytes memory signature) internal view override returns (bool) {
        bytes32 key = abi.decode(key_, (bytes32));
        bytes32 hash = keccak256(abi.encodePacked(msg.sender, key));
        (uint8 v, bytes32 r, bytes32 s) = abi.decode(signature, (uint8, bytes32, bytes32));
        address signer = ecrecover(hash, v, r, s);
        address keyAddress = address(uint160(uint256(key)));
        return signer == keyAddress && signer != address(0);
    }
}
