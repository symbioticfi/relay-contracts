// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../../base/VaultManager.sol";
import {PermissionManager} from "../../../../base/PermissionManager.sol";

import {IBaseOperators} from
    "../../../../../interfaces/features/registration/operators/permissioned-operators/IBaseOperators.sol";

abstract contract BaseOperators is VaultManager, PermissionManager, IBaseOperators {
    function __BaseOperators_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc IBaseOperators
     */
    function unregisterOperatorWithPermission(
        address operator
    ) public virtual checkPermission {
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc IBaseOperators
     */
    function registerOperatorVaultWithPermission(address operator, address vault) public virtual checkPermission {
        _registerOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IBaseOperators
     */
    function unregisterOperatorVaultWithPermission(address operator, address vault) public virtual checkPermission {
        _unregisterOperatorVault(operator, vault);
    }
}
