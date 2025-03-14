// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IForceVerifier {
    function verifyForceCommit(
        address middleware,
        bytes32 valSetHeader,
        bytes calldata proof
    ) external view returns (bool);
}
