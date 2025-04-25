// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseOperators} from "./BaseOperators.sol";

import {IOperators} from
    "../../../../../interfaces/features/registration/operators/permissioned-operators/IOperators.sol";

abstract contract Operators is BaseOperators, IOperators {
    /**
     * @inheritdoc IOperators
     */
    uint64 public constant Operators_VERSION = 1;

    function __Operators_init() internal virtual onlyInitializing {
        __BaseOperators_init();
    }

    /**
     * @inheritdoc IOperators
     */
    function registerOperatorWithPermission(address operator, address vault) public virtual checkPermission {
        _registerOperator(operator);
        if (vault != address(0)) {
            _registerOperatorVault(operator, vault);
        }
    }
}
