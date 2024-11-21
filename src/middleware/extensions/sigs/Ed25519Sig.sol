// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Ed25519} from "../../../libraries/Ed25519.sol";
import {BaseSig} from "./BaseSig.sol";

/**
 * @title Ed25519Sig
 * @notice Contract for verifying Ed25519 signatures against operator keys
 * @dev Implements BaseSig interface using Ed25519 signature verification
 */
abstract contract Ed25519Sig is BaseSig {
    /**
     * @notice Verifies that a signature was created by the owner of a key
     * @param operator The address of the operator that owns the key
     * @param key_ The public key to verify against, encoded as bytes
     * @param signature The Ed25519 signature to verify, containing r and s components
     * @return True if the signature was created by the key owner, false otherwise
     * @dev The key is expected to be a bytes32 that represents an Ed25519 public key
     *      The signature is expected to be 64 bytes containing r (32 bytes) and s (32 bytes)
     */
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
