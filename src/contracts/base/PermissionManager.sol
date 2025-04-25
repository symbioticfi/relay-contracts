// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IPermissionManager} from "../../interfaces/base/IPermissionManager.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract PermissionManager is Initializable, IPermissionManager {
    uint64 public constant PermissionManager_VERSION = 1;

    modifier checkPermission() {
        _checkPermission();
        _;
    }

    function _checkPermission() internal virtual;
}
