// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseSig} from "./BaseSig.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

/**
 * @title ECDSASig
 * @notice Contract for verifying ECDSA signatures against operator keys
 * @dev Implements BaseSig interface using OpenZeppelin's ECDSA library
 */
abstract contract ECDSASig is BaseSig {
    using ECDSA for bytes32;

    /**
     * @notice Verifies that a signature was created by the owner of a key
     * @param operator The address of the operator that owns the key
     * @param key_ The public key to verify against, encoded as bytes
     * @param signature The ECDSA signature to verify
     * @return True if the signature was created by the key owner, false otherwise
     * @dev The key is expected to be a bytes32 that can be converted to an Ethereum address
     */
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

    /**
     * @notice Recovers the signer address from a hash and signature
     * @param hash The message hash that was signed
     * @param signature The ECDSA signature
     * @return The address that created the signature
     * @dev Wrapper around OpenZeppelin's ECDSA.recover
     */
    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        return hash.recover(signature);
    }
}
