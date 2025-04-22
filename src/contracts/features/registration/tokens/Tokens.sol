// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../base/VaultManager.sol";
import {PermissionManager} from "../../../base/PermissionManager.sol";

abstract contract SharedVaults is VaultManager, PermissionManager {
    uint64 public constant SharedVaults_VERSION = 1;

    function registerSharedVault(
        address sharedVault
    ) public checkPermission {
        _registerSharedVault(sharedVault);
    }

    function unregisterSharedVault(
        address sharedVault
    ) public checkPermission {
        _unregisterSharedVault(sharedVault);
    }
}
