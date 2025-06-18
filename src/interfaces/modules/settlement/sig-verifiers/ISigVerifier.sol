// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISigVerifier {
    /**
     * @notice Returns the type of the signature verification.
     * @return The type of the signature verification.
     */
    function VERIFICATION_TYPE() external view returns (uint32);

    /**
     * @notice Returns the result of the quorum signature verification.
     * @param settlement The address of the Settlement contract.
     * @param epoch The epoch from which the validator set is to use.
     * @param message The message to verify.
     * @param keyTag The tag of the key.
     * @param quorumThreshold The quorum threshold (in absolute terms).
     * @param proof The proof (depends on the verification type).
     * @return The result of the quorum signature verification.
     */
    function verifyQuorumSig(
        address settlement,
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint256 quorumThreshold,
        bytes calldata proof
    ) external view returns (bool);
}
