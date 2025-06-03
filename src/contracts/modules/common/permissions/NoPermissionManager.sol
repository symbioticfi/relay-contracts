// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../../base/PermissionManager.sol";

import {INoPermissionManager} from "../../../../interfaces/modules/common/permissions/INoPermissionManager.sol";

abstract contract NoPermissionManager is PermissionManager, INoPermissionManager {
    /**
     * @inheritdoc INoPermissionManager
     */
    uint64 public constant NoPermissionManager_VERSION = 1;

    function __NoPermissionManager_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc PermissionManager
     */
    function _checkPermission() internal pure virtual override {}
}
