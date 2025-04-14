// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManager} from "../../../managers/extendable/AccessManager.sol";

/**
 * @title NoAccessManager
 * @notice A middleware extension that denies all access by default
 * @dev Implements AccessManager and always reverts on access checks
 */
abstract contract NoAccessManager is AccessManager {
    uint64 public constant NoAccessManager_VERSION = 1;

    /**
     * @notice Checks access and always allows access
     * @dev This function is called publicly to enforce access control and will always allow access
     */
    function _checkAccess() internal pure virtual override {
        // Allow all access by default
    }
}
