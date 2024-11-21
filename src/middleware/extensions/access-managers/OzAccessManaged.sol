// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManagedUpgradeable} from "@openzeppelin/contracts-upgradeable/access/manager/AccessManagedUpgradeable.sol";

import {BaseMiddleware} from "../../BaseMiddleware.sol";

/**
 * @title OzAccessManaged
 * @notice A middleware extension that integrates OpenZeppelin's AccessManager for access control
 * @dev Implements BaseMiddleware with OpenZeppelin's AccessManagedUpgradeable functionality
 */
abstract contract OzAccessManaged is BaseMiddleware, AccessManagedUpgradeable {
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
     * @notice Checks if the caller has access through the OpenZeppelin AccessManager
     * @dev Delegates access check to OpenZeppelin's _checkCanCall function
     */
    function _checkAccess() internal override {
        _checkCanCall(msg.sender, msg.data);
    }
}
