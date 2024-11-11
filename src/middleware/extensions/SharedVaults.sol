// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {BaseMiddleware} from "../BaseMiddleware.sol";

abstract contract SharedVaults is BaseMiddleware {
    function registerSharedVault(address sharedVault, bytes memory udata) public checkAccess {
        _beforeRegisterSharedVault(sharedVault, udata);
        _registerSharedVault(sharedVault);
    }

    function pauseSharedVault(address sharedVault, bytes memory udata) public checkAccess {
        _beforePauseSharedVault(sharedVault, udata);
        _pauseSharedVault(sharedVault);
    }

    function unpauseSharedVault(address sharedVault, bytes memory udata) public checkAccess {
        _beforeUnpauseSharedVault(sharedVault, udata);
        _unpauseSharedVault(sharedVault);
    }

    function unregisterSharedVault(address sharedVault, bytes memory udata) public checkAccess {
        _beforeUnregisterSharedVault(sharedVault, udata);
        _unregisterSharedVault(sharedVault);
    }

    function _beforeRegisterSharedVault(address sharedVault, bytes memory udata) internal virtual {}
    function _beforePauseSharedVault(address sharedVault, bytes memory udata) internal virtual {}
    function _beforeUnpauseSharedVault(address sharedVault, bytes memory udata) internal virtual {}
    function _beforeUnregisterSharedVault(address sharedVault, bytes memory udata) internal virtual {}
}
