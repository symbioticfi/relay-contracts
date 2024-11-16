// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../BaseMiddleware.sol";

abstract contract SharedVaults is BaseMiddleware {
    function registerSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforeRegisterSharedVault(sharedVault);
        _registerSharedVault(sharedVault);
    }

    function pauseSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforePauseSharedVault(sharedVault);
        _pauseSharedVault(sharedVault);
    }

    function unpauseSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforeUnpauseSharedVault(sharedVault);
        _unpauseSharedVault(sharedVault);
    }

    function unregisterSharedVault(
        address sharedVault
    ) public checkAccess {
        _beforeUnregisterSharedVault(sharedVault);
        _unregisterSharedVault(sharedVault);
    }

    function _beforeRegisterSharedVault(
        address sharedVault
    ) internal virtual {}
    function _beforePauseSharedVault(
        address sharedVault
    ) internal virtual {}
    function _beforeUnpauseSharedVault(
        address sharedVault
    ) internal virtual {}
    function _beforeUnregisterSharedVault(
        address sharedVault
    ) internal virtual {}
}
