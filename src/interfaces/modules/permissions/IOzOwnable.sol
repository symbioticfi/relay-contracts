// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../base/abstracts/IPermissionManager.sol";

/**
 * @title IOzOwnable
 * @notice Interface for a middleware extension that restricts access to a single owner address
 */
interface IOzOwnable {
    function OzOwnable_VERSION() external view returns (uint64);
}
