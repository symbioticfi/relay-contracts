// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EdDSA} from "../../utils/EdDSA.sol";

/**
 * @title EdDSASig
 * @notice Contract for verifying EdDSA signatures over Ed25519 against operator keys
 * @dev Implements SigManager interface using EdDSA signature verification
 */
library EdDSASig {
    /**
     * @notice Verifies that a signature was created by the owner of a key
     * @param operator The address of the operator that owns the key
     * @param key The public key to verify against
     * @param signature The Ed25519 signature to verify
     * @dev The key must be a valid Ed25519 public key point compressed to 32 bytes
     *      The signature must be 64 bytes containing r and s components encoded as uint256
     */
    function verifyKeySignature(
        address operator,
        bytes memory key,
        bytes memory signature
    ) external returns (bytes32) {
        bytes32 pubkey = abi.decode(key, (bytes32));
        bytes memory message = abi.encode(keccak256(abi.encodePacked(operator, pubkey)));
        if (!verify(message, signature, pubkey)) {
            revert("Invalid EdDSA key signature");
        }
        return pubkey;
    }

    function verify(bytes memory message, bytes memory signature, bytes32 key) internal returns (bool) {
        return EdDSA.verify(message, signature, key);
    }
}
