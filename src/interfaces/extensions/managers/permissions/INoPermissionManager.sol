// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../../managers/extendable/IPermissionManager.sol";

interface INoPermissionManager {
    function NoPermissionManager_VERSION() external view returns (uint64);
}
