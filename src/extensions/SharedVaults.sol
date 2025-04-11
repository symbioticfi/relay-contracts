// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../middleware/BaseMiddleware.sol";
import {ISharedVaults} from "../interfaces/extensions/ISharedVaults.sol";

/**
 * @title SharedVaults
 * @notice Contract for managing shared vaults that can be used by multiple operators
 * @dev Extends BaseMiddleware to provide access control for vault management functions
 */
abstract contract SharedVaults is BaseMiddleware, ISharedVaults {
    uint64 public constant SharedVaults_VERSION = 1;

    /**
     * @inheritdoc ISharedVaults
     */
    function registerSharedVault(
        address sharedVault
    ) public checkAccess {
        _registerSharedVault(sharedVault);
    }

    /**
     * @inheritdoc ISharedVaults
     */
    function pauseSharedVault(
        address sharedVault
    ) public checkAccess {
        _pauseVault(sharedVault);
    }

    /**
     * @inheritdoc ISharedVaults
     */
    function unpauseSharedVault(
        address sharedVault
    ) public checkAccess {
        _unpauseVault(sharedVault);
    }

    /**
     * @inheritdoc ISharedVaults
     */
    function unregisterSharedVault(
        address sharedVault
    ) public checkAccess {
        _unregisterSharedVault(sharedVault);
    }
}
