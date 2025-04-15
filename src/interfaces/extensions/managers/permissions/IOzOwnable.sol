// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IPermissionManager} from "../../../managers/extendable/IPermissionManager.sol";

/**
 * @title IOzOwnable
 * @notice Interface for a middleware extension that restricts access to a single owner address
 */
interface IOzOwnable {
    function OzOwnable_VERSION() external view returns (uint64);
}
