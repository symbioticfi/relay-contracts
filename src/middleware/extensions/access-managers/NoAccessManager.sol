// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../BaseMiddleware.sol";

/**
 * @title NoAccessManager
 * @notice A middleware extension that denies all access by default
 * @dev Implements BaseMiddleware and always reverts on access checks
 */
abstract contract NoAccessManager is BaseMiddleware {
    uint64 public constant NoAccessManager_VERSION = 1;

    /**
     * @notice Error thrown when access is denied
     */
    error NoAccess();

    /**
     * @notice Checks access and always reverts
     * @dev This function is called internally to enforce access control
     */
    function _checkAccess() internal pure override {
        revert NoAccess();
    }
}
