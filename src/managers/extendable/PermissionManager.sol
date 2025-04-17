// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {IPermissionManager} from "../../interfaces/managers/extendable/IPermissionManager.sol";

/**
 * @title PermissionManager
 * @notice Abstract contract for managing access control
 * @dev Provides a modifier and internal function for checking access permissions
 */
abstract contract PermissionManager is Initializable, IPermissionManager {
    /**
     * @notice Modifier that checks access before executing a function
     * @dev Calls internal _checkAccess function and continues if allowed
     */
    modifier checkAccess() {
        _checkAccess();
        _;
    }

    /**
     * @notice Internal function to check if caller has required access
     * @dev Must be implemented by inheriting contracts
     */
    function _checkAccess() internal virtual;
}
