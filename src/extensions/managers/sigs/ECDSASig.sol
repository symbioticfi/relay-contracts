// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SigManager} from "../../../managers/extendable/SigManager.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {IECDSASig} from "../../../interfaces/extensions/managers/sigs/IECDSASig.sol";

/**
 * @title ECDSASig
 * @notice Contract for verifying ECDSA signatures against operator keys
 * @dev Implements SigManager interface using OpenZeppelin's ECDSA library. Instead of using public keys directly,
 *      this implementation uses Ethereum addresses derived from the public keys as operator keys.
 */
abstract contract ECDSASig is SigManager, IECDSASig {
    uint64 public constant ECDSASig_VERSION = 1;

    using ECDSA for bytes32;

    /**
     * @notice Verifies that a signature was created by the owner of a key
     * @param operator The address of the operator that owns the key
     * @param key_ The address derived from the public key, encoded as bytes
     * @param signature The ECDSA signature to verify
     * @return True if the signature was created by the key owner, false otherwise
     * @dev The key is expected to be a bytes32 that can be converted to an Ethereum address
     */
    function _verifyKeySignature(
        address operator,
        bytes memory key_,
        bytes memory signature
    ) internal pure override returns (bool) {
        address key = abi.decode(key_, (address));
        bytes32 hash = keccak256(abi.encodePacked(operator, key));
        address signer = recover(hash, signature);
        return signer == key && signer != address(0);
    }

    /**
     * @inheritdoc IECDSASig
     */
    function recover(bytes32 hash, bytes memory signature) public pure returns (address) {
        return hash.recover(signature);
    }
}
