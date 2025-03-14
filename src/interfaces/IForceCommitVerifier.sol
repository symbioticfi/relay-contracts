// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ValSetManager} from "../contracts/ValSetManager.sol";

interface IForceCommitVerifier {
    function verifyForceCommit(
        address middleware,
        ValSetManager.ValidatorSetHeader memory header,
        bytes calldata proof
    ) external view returns (bool);
}
