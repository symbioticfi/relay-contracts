// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISigVerifier {
    function VERIFICATION_TYPE() external view returns (uint32);

    function verifyQuorumSig(
        address settlement,
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint256 quorumThreshold,
        bytes calldata proof
    ) external view returns (bool);
}
