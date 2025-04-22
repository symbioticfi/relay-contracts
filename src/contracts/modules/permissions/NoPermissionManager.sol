// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/abstracts/PermissionManager.sol";

import {INoPermissionManager} from "../../../interfaces/modules/permissions/INoPermissionManager.sol";

/**
 * @title NoPermissionManager
 * @notice A middleware extension that denies all access by default
 * @dev Implements PermissionManager and always reverts on access checks
 */
abstract contract NoPermissionManager is PermissionManager, INoPermissionManager {
    /**
     * @inheritdoc INoPermissionManager
     */
    uint64 public constant NoPermissionManager_VERSION = 1;

    /**
     * @inheritdoc PermissionManager
     */
    function _checkPermission() internal pure virtual override {
        // Allow all access by default
    }
}
