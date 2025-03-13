// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

library ECDSASig {
    using ECDSA for bytes32;

    /**
     * @notice Verifies that a signature was created by the owner of a key
     * @param operator The address of the operator that owns the key
     * @param key The address derived from the public key, encoded as bytes
     * @param signature The ECDSA signature to verify
     * @dev The key is expected to be a bytes32 that can be converted to an Ethereum address
     */
    function verifyKeySignature(
        address operator,
        bytes memory key,
        bytes memory signature
    ) external pure returns (bytes32) {
        address derivedKey = abi.decode(key, (address));
        bytes32 messageHash = keccak256(abi.encodePacked(operator, derivedKey));
        address signer = recover(messageHash, signature);
        if (signer == address(0) || signer != derivedKey) {
            revert("Invalid ECDSA key signature");
        }
        return bytes32(uint256(uint160(derivedKey)));
    }

    function recover(bytes32 messageHash, bytes memory signature) internal pure returns (address) {
        return messageHash.recover(signature);
    }
}
