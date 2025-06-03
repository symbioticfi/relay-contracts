// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../src/contracts/base/PermissionManager.sol";

abstract contract NoPermissionManager is PermissionManager {
    uint64 public constant NoPermissionManager_VERSION = 1;

    function __NoPermissionManager_init() internal virtual onlyInitializing {}
    function _checkPermission() internal pure virtual override {}
}
