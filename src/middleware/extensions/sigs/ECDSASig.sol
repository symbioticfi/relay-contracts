// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseSig} from "./BaseSig.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

abstract contract ECDSASig is BaseSig {
    using ECDSA for bytes32;

    function _verifyKeySignature(
        address operator,
        bytes memory key_,
        bytes memory signature
    ) internal pure override returns (bool) {
        bytes32 key = abi.decode(key_, (bytes32));
        bytes32 hash = keccak256(abi.encodePacked(operator, key));
        address signer = recover(hash, signature);
        address keyAddress = address(uint160(uint256(key)));
        return signer == keyAddress && signer != address(0);
    }

    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        return hash.recover(signature);
    }
}
