// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManagedUpgradeable} from "@openzeppelin/contracts-upgradeable/access/manager/AccessManagedUpgradeable.sol";

import {AccessManager} from "../../../managers/extendable/AccessManager.sol";

/**
 * @title OzAccessManaged
 * @notice A middleware extension that integrates OpenZeppelin's AccessManaged for access control
 * @dev Implements AccessManager with OpenZeppelin's AccessManagedUpgradeable functionality
 */
abstract contract OzAccessManaged is AccessManager, AccessManagedUpgradeable {
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
     * @notice Checks if the caller has access through the OpenZeppelin AccessManaged
     * @dev Delegates access check to OpenZeppelin's _checkCanCall function
     */
    function _checkAccess() internal virtual override {
        _checkCanCall(msg.sender, msg.data);
    }
}
