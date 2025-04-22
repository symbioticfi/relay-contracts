// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../base/IPermissionManager.sol";

import {IAccessControl} from "@openzeppelin/contracts/access/IAccessControl.sol";

/**
 * @title IOzAccessControl
 * @notice Interface for a middleware extension that implements role-based access control
 */
interface IOzAccessControl {
    /**
     * @notice Returns the role required for a function selector
     * @param selector The function selector
     * @return bytes32 The required role
     */
    function getRole(
        bytes4 selector
    ) external view returns (bytes32);
}
