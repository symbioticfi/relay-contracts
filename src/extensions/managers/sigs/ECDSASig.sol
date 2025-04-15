// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SigManager} from "../../../managers/extendable/SigManager.sol";

import {IECDSASig} from "../../../interfaces/extensions/managers/sigs/IECDSASig.sol";

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

/**
 * @title ECDSASig
 * @notice Contract for verifying ECDSA signatures against operator keys
 * @dev Implements SigManager interface using OpenZeppelin's ECDSA library. Instead of using public keys directly,
 *      this implementation uses Ethereum addresses derived from the public keys as operator keys.
 */
abstract contract ECDSASig is SigManager, IECDSASig {
    using ECDSA for bytes32;

    /**
     * @inheritdoc IECDSASig
     */
    uint64 public constant ECDSASig_VERSION = 1;

    /**
     * @inheritdoc SigManager
     */
    function _verifyKeySignature(
        address operator,
        bytes memory key_,
        bytes memory signature
    ) internal pure override returns (bool) {
        address key = abi.decode(key_, (address));
        bytes32 messageHash = keccak256(abi.encode(operator, key));
        address signer = recover(messageHash, signature);
        return signer == key && signer != address(0);
    }

    /**
     * @inheritdoc IECDSASig
     */
    function recover(bytes32 messageHash, bytes memory signature) public pure returns (address) {
        return messageHash.recover(signature);
    }
}
