// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface ISigVerifier {
    function verifyQuorumSig(
        address middleware,
        bytes32 digest,
        uint8 keyTag,
        uint104 quorumThreshold,
        bytes calldata proof
    ) external view returns (bool);
}
