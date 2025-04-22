// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {IOzOwnable} from "../../../interfaces/features/permissions/IOzOwnable.sol";

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

/**
 * @title OzOwnable
 * @notice A middleware extension that restricts access to a single owner address
 * @dev Implements PermissionManager with owner-based access control
 */
abstract contract OzOwnable is PermissionManager, OwnableUpgradeable, IOzOwnable {
    /**
     * @inheritdoc IOzOwnable
     */
    uint64 public constant OzOwnable_VERSION = 1;

    /**
     * @notice Initializes the contract with an owner address
     * @param owner_ The address to set as the owner
     */
    function __OzOwnable_init(
        address owner_
    ) internal onlyInitializing {
        __Ownable_init(owner_);
    }

    /**
     * @inheritdoc PermissionManager
     */
    function _checkPermission() internal view virtual override {
        _checkOwner();
    }
}
