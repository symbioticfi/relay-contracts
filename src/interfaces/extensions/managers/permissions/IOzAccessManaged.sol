// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IPermissionManager} from "../../../managers/extendable/IPermissionManager.sol";

import {IAccessManaged} from "@openzeppelin/contracts/access/manager/IAccessManaged.sol";

/**
 * @title IOzAccessManaged
 */
interface IOzAccessManaged {
    function OzAccessManaged_VERSION() external view returns (uint64);
}
