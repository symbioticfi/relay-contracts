// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {IOperators} from "../../interfaces/extensions/operators/IOperators.sol";

/**
 * @title Operators
 * @notice Base contract for managing operator registration, keys, and vault relationships
 * @dev Provides core operator management functionality with hooks for customization
 */
abstract contract Operators is BaseMiddleware, IOperators {
    uint64 public constant Operators_VERSION = 1;

    /**
     * @inheritdoc IOperators
     */
    function registerOperator(address operator, bytes memory key, address vault) external virtual checkAccess {
        _registerOperatorImpl(operator, key, vault);
    }

    function _registerOperatorImpl(address operator, bytes memory key, address vault) internal virtual {
        _beforeRegisterOperator(operator, key, vault);
        _registerOperator(operator);
        _updateKey(operator, key);
        if (vault != address(0)) {
            _beforeRegisterOperatorVault(operator, vault);
            _registerOperatorVault(operator, vault);
        }
    }

    /**
     * @inheritdoc IOperators
     */
    function unregisterOperator(
        address operator
    ) external virtual checkAccess {
        _unregisterOperatorImpl(operator);
    }

    function _unregisterOperatorImpl(
        address operator
    ) internal virtual {
        _beforeUnregisterOperator(operator);
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc IOperators
     */
    function pauseOperator(
        address operator
    ) external virtual checkAccess {
        _pauseOperatorImpl(operator);
    }

    function _pauseOperatorImpl(
        address operator
    ) internal virtual {
        _beforePauseOperator(operator);
        _pauseOperator(operator);
    }

    /**
     * @inheritdoc IOperators
     */
    function unpauseOperator(
        address operator
    ) external virtual checkAccess {
        _unpauseOperatorImpl(operator);
    }

    function _unpauseOperatorImpl(
        address operator
    ) internal virtual {
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
    }

    /**
     * @inheritdoc IOperators
     */
    function updateOperatorKey(address operator, bytes memory key) external virtual checkAccess {
        _updateOperatorKeyImpl(operator, key);
    }

    function _updateOperatorKeyImpl(address operator, bytes memory key) internal virtual {
        _beforeUpdateOperatorKey(operator, key);
        _updateKey(operator, key);
    }

    /**
     * @inheritdoc IOperators
     */
    function registerOperatorVault(address operator, address vault) external virtual checkAccess {
        _registerOperatorVaultImpl(operator, vault);
    }

    function _registerOperatorVaultImpl(address operator, address vault) internal virtual {
        if (!_isOperatorRegistered(operator)) {
            revert OperatorNotRegistered();
        }
        _beforeRegisterOperatorVault(operator, vault);
        _registerOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IOperators
     */
    function unregisterOperatorVault(address operator, address vault) external virtual checkAccess {
        _unregisterOperatorVaultImpl(operator, vault);
    }

    function _unregisterOperatorVaultImpl(address operator, address vault) internal virtual {
        _beforeUnregisterOperatorVault(operator, vault);
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IOperators
     */
    function pauseOperatorVault(address operator, address vault) external virtual checkAccess {
        _pauseOperatorVaultImpl(operator, vault);
    }

    function _pauseOperatorVaultImpl(address operator, address vault) internal virtual {
        _beforePauseOperatorVault(operator, vault);
        _pauseOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IOperators
     */
    function unpauseOperatorVault(address operator, address vault) external virtual checkAccess {
        _unpauseOperatorVaultImpl(operator, vault);
    }

    function _unpauseOperatorVaultImpl(address operator, address vault) internal virtual {
        _beforeUnpauseOperatorVault(operator, vault);
        _unpauseOperatorVault(operator, vault);
    }

    /**
     * @notice Hook called before updating an operator's key
     * @param operator The operator address
     * @param key The new key
     */
    function _beforeUpdateOperatorKey(address operator, bytes memory key) internal virtual {}

    /**
     * @notice Hook called before registering an operator
     * @param operator The operator address
     * @param key The operator's key
     * @param vault Optional vault address
     */
    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual {}

    /**
     * @notice Hook called before unregistering an operator
     * @param operator The operator address
     */
    function _beforeUnregisterOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called before pausing an operator
     * @param operator The operator address
     */
    function _beforePauseOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called before unpausing an operator
     * @param operator The operator address
     */
    function _beforeUnpauseOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called before registering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeRegisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before unregistering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnregisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before pausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforePauseOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before unpausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual {}
}
