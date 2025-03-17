// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IValSetManager} from "./IValSetManager.sol";

interface IForceCommitVerifier {
    function verifyForceCommit(
        address middleware,
        IValSetManager.ValidatorSetHeader memory header,
        bytes calldata proof
    ) external view returns (bool);
}
