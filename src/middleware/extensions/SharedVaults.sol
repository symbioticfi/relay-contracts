// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../BaseMiddleware.sol";

/**
 * @title SharedVaults
 * @notice Contract for managing shared vaults that can be used by multiple operators
 * @dev Extends BaseMiddleware to provide access control for vault management functions
 */
abstract contract SharedVaults is BaseMiddleware {
    uint64 public constant SharedVaults_VERSION = 1;

    /**
     * @notice Registers a new shared vault
     * @param sharedVault The address of the vault to register
     */
    function registerSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforeRegisterSharedVault(sharedVault);
        _registerSharedVault(sharedVault);
    }

    /**
     * @notice Pauses a shared vault
     * @param sharedVault The address of the vault to pause
     */
    function pauseSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforePauseSharedVault(sharedVault);
        _pauseSharedVault(sharedVault);
    }

    /**
     * @notice Unpauses a shared vault
     * @param sharedVault The address of the vault to unpause
     */
    function unpauseSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforeUnpauseSharedVault(sharedVault);
        _unpauseSharedVault(sharedVault);
    }

    /**
     * @notice Unregisters a shared vault
     * @param sharedVault The address of the vault to unregister
     */
    function unregisterSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforeUnregisterSharedVault(sharedVault);
        _unregisterSharedVault(sharedVault);
    }

    /**
     * @notice Hook called before registering a shared vault
     * @param sharedVault The vault address
     */
    function _beforeRegisterSharedVault(
        address sharedVault
    ) internal virtual {}

    /**
     * @notice Hook called before pausing a shared vault
     * @param sharedVault The vault address
     */
    function _beforePauseSharedVault(
        address sharedVault
    ) internal virtual {}

    /**
     * @notice Hook called before unpausing a shared vault
     * @param sharedVault The vault address
     */
    function _beforeUnpauseSharedVault(
        address sharedVault
    ) internal virtual {}

    /**
     * @notice Hook called before unregistering a shared vault
     * @param sharedVault The vault address
     */
    function _beforeUnregisterSharedVault(
        address sharedVault
    ) internal virtual {}
}
