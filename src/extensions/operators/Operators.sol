// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseOperators} from "./BaseOperators.sol";
import {IOperators} from "../../interfaces/extensions/operators/IOperators.sol";

/**
 * @title Operators
 * @notice Base contract for managing operator registration, keys, and vault relationships
 * @dev Provides core operator management functionality with hooks for customization
 */
abstract contract Operators is BaseOperators, IOperators {
    uint64 public constant Operators_VERSION = 1;

    /**
     * @inheritdoc IOperators
     */
    function registerOperator(address operator, bytes memory key, address vault) external checkAccess {
        _registerOperatorImpl(operator, key, vault);
    }

    /**
     * @inheritdoc IOperators
     */
    function unregisterOperator(
        address operator
    ) external checkAccess {
        _unregisterOperatorImpl(operator);
    }

    /**
     * @inheritdoc IOperators
     */
    function pauseOperator(
        address operator
    ) external virtual checkAccess {
        _pauseOperatorImpl(operator);
    }

    /**
     * @inheritdoc IOperators
     */
    function unpauseOperator(
        address operator
    ) external virtual checkAccess {
        _unpauseOperatorImpl(operator);
    }

    /**
     * @inheritdoc IOperators
     */
    function updateOperatorKey(address operator, bytes memory key) external virtual checkAccess {
        _updateOperatorKeyImpl(operator, key);
    }
    /**
     * @inheritdoc IOperators
     */

    function registerOperatorVault(address operator, address vault) external virtual checkAccess {
        _registerOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc IOperators
     */
    function unregisterOperatorVault(address operator, address vault) external virtual checkAccess {
        _unregisterOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc IOperators
     */
    function pauseOperatorVault(address operator, address vault) external virtual checkAccess {
        _pauseOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc IOperators
     */
    function unpauseOperatorVault(address operator, address vault) external virtual checkAccess {
        _unpauseOperatorVaultImpl(operator, vault);
    }
}
