// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../base/VaultManager.sol";
import {PermissionManager} from "../../base/abstracts/PermissionManager.sol";

import {IOperators} from "../../../interfaces/modules/operators/IOperators.sol";

/**
 * @title Operators
 * @notice Base contract for managing operator registration, and vault relationships
 * @dev Provides core operator management functionality with hooks for customization
 */
abstract contract Operators is VaultManager, PermissionManager, IOperators {
    uint64 public constant Operators_VERSION = 1;

    function registerOperator(address operator, address vault) public virtual checkPermission {
        _registerOperator(operator);
        if (vault != address(0)) {
            _registerOperatorVault(operator, vault);
        }
    }

    function unregisterOperator(
        address operator
    ) public virtual checkPermission {
        _unregisterOperator(operator);
    }

    function registerOperatorVault(address operator, address vault) public virtual checkPermission {
        _registerOperatorVault(operator, vault);
    }

    function unregisterOperatorVault(address operator, address vault) public virtual checkPermission {
        _unregisterOperatorVault(operator, vault);
    }
}
