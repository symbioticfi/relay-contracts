// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../base/VaultManager.sol";
import {PermissionManager} from "../../../base/PermissionManager.sol";
import {ISharedVaults} from "../../../../interfaces/features/registration/vaults/ISharedVaults.sol";

abstract contract SharedVaults is VaultManager, PermissionManager, ISharedVaults {
    /**
     * @inheritdoc ISharedVaults
     */
    uint64 public constant SharedVaults_VERSION = 1;

    function __SharedVaults_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc ISharedVaults
     */
    function registerSharedVault(
        address sharedVault
    ) public virtual checkPermission {
        _registerSharedVault(sharedVault);
    }

    /**
     * @inheritdoc ISharedVaults
     */
    function unregisterSharedVault(
        address sharedVault
    ) public virtual checkPermission {
        _unregisterSharedVault(sharedVault);
    }
}
