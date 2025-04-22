// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IPermissionManager} from "../../../interfaces/base/abstracts/IPermissionManager.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title PermissionManager
 * @notice Abstract contract for managing access control
 * @dev Provides a modifier and internal function for checking access permissions
 */
abstract contract PermissionManager is Initializable, IPermissionManager {
    /**
     * @notice Modifier that checks access before executing a function
     * @dev Calls internal _checkPermission function and continues if allowed
     */
    modifier checkPermission() {
        _checkPermission();
        _;
    }

    /**
     * @notice Internal function to check if caller has required access
     * @dev Must be implemented by inheriting contracts
     */
    function _checkPermission() internal virtual;
}
