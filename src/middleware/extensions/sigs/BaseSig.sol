// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

abstract contract BaseSig {
    /**
     * @notice Verifies the signature of a key
     * @param key_ The key to verify
     * @param signature The signature to verify
     * @return True if the signature is valid, false otherwise
     */
    function _verifyKeySignature(bytes memory key_, bytes memory signature) internal view virtual returns (bool);
}
