// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {IOzAccessManaged} from "../../../interfaces/features/permissions/IOzAccessManaged.sol";

import {AccessManagedUpgradeable} from "@openzeppelin/contracts-upgradeable/access/manager/AccessManagedUpgradeable.sol";

/**
 * @title OzAccessManaged
 * @notice A middleware extension that integrates OpenZeppelin's AccessManaged for access control
 * @dev Implements PermissionManager with OpenZeppelin's AccessManagedUpgradeable functionality
 */
abstract contract OzAccessManaged is PermissionManager, AccessManagedUpgradeable, IOzAccessManaged {
    /**
     * @inheritdoc IOzAccessManaged
     */
    uint64 public constant OzAccessManaged_VERSION = 1;

    /**
     * @notice Initializes the contract with an authority address
     * @param authority The address to set as the access manager authority
     * @dev Can only be called during initialization
     */
    function __OzAccessManaged_init(
        address authority
    ) internal onlyInitializing {
        __AccessManaged_init(authority);
    }

    /**
     * @inheritdoc PermissionManager
     */
    function _checkPermission() internal virtual override {
        _checkCanCall(msg.sender, msg.data);
    }
}
