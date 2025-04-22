// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../base/VaultManager.sol";
import {PermissionManager} from "../../../base/PermissionManager.sol";

abstract contract Tokens is VaultManager, PermissionManager {
    uint64 public constant Tokens_VERSION = 1;

    function registerToken(
        address token
    ) public checkPermission {
        _registerToken(token);
    }

    function unregisterToken(
        address token
    ) public checkPermission {
        _unregisterToken(token);
    }
}
