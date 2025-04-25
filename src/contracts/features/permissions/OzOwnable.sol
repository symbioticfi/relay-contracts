// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {IOzOwnable} from "../../../interfaces/features/permissions/IOzOwnable.sol";

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

abstract contract OzOwnable is PermissionManager, OwnableUpgradeable, IOzOwnable {
    /**
     * @inheritdoc IOzOwnable
     */
    uint64 public constant OzOwnable_VERSION = 1;

    function __OzOwnable_init(
        OzOwnableInitParams memory initParams
    ) internal virtual onlyInitializing {
        __Ownable_init(initParams.owner);
    }

    /**
     * @inheritdoc PermissionManager
     */
    function _checkPermission() internal view virtual override {
        _checkOwner();
    }
}
