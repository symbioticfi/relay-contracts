// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";

/**
 * @title BaseOperators
 * @notice Base contract for managing operator registration, keys, and vault relationships
 * @dev Provides core operator management functionality with hooks for customization
 */
abstract contract BaseOperators is BaseMiddleware {
    error OperatorNotRegistered();

    /**
     * @notice Internal implementation for registering an operator
     * @param operator The operator address to register
     * @param key The operator's public key
     * @param vault Optional vault address to associate with operator
     */
    function _registerOperatorImpl(address operator, bytes memory key, address vault) internal virtual {
        _beforeRegisterOperator(operator, key, vault);
        _registerOperator(operator);
        _updateKey(operator, key);
        if (vault != address(0)) {
            _beforeRegisterOperatorVault(operator, vault);
            _registerOperatorVault(operator, vault);
        }
        _afterRegisterOperator(operator, key, vault);
    }

    /**
     * @notice Internal implementation for unregistering an operator
     * @param operator The operator address to unregister
     */
    function _unregisterOperatorImpl(
        address operator
    ) internal virtual {
        _beforeUnregisterOperator(operator);
        _unregisterOperator(operator);
        _afterUnregisterOperator(operator);
    }

    /**
     * @notice Internal implementation for pausing an operator
     * @param operator The operator address to pause
     */
    function _pauseOperatorImpl(
        address operator
    ) internal virtual {
        _beforePauseOperator(operator);
        _pauseOperator(operator);
        _afterPauseOperator(operator);
    }

    /**
     * @notice Internal implementation for unpausing an operator
     * @param operator The operator address to unpause
     */
    function _unpauseOperatorImpl(
        address operator
    ) internal virtual {
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
        _afterUnpauseOperator(operator);
    }

    /**
     * @notice Internal implementation for updating an operator's key
     * @param operator The operator address
     * @param key The new public key
     */
    function _updateOperatorKeyImpl(address operator, bytes memory key) internal virtual {
        _beforeUpdateOperatorKey(operator, key);
        _updateKey(operator, key);
        _afterUpdateOperatorKey(operator, key);
    }

    /**
     * @notice Internal implementation for registering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to associate
     * @dev Reverts if operator is not registered
     */
    function _registerOperatorVaultImpl(address operator, address vault) internal virtual {
        if (!_isOperatorRegistered(operator)) {
            revert OperatorNotRegistered();
        }
        _beforeRegisterOperatorVault(operator, vault);
        _registerOperatorVault(operator, vault);
        _afterRegisterOperatorVault(operator, vault);
    }

    /**
     * @notice Internal implementation for unregistering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to unregister
     */
    function _unregisterOperatorVaultImpl(address operator, address vault) internal virtual {
        _beforeUnregisterOperatorVault(operator, vault);
        _unregisterOperatorVault(operator, vault);
        _afterUnregisterOperatorVault(operator, vault);
    }

    /**
     * @notice Internal implementation for pausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to pause
     */
    function _pauseOperatorVaultImpl(address operator, address vault) internal virtual {
        _beforePauseOperatorVault(operator, vault);
        _pauseOperatorVault(operator, vault);
        _afterPauseOperatorVault(operator, vault);
    }

    /**
     * @notice Internal implementation for unpausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to unpause
     */
    function _unpauseOperatorVaultImpl(address operator, address vault) internal virtual {
        _beforeUnpauseOperatorVault(operator, vault);
        _unpauseOperatorVault(operator, vault);
        _afterUnpauseOperatorVault(operator, vault);
    }

    /**
     * @notice Hook called before updating an operator's key
     * @param operator The operator address
     * @param key The new key
     */
    function _beforeUpdateOperatorKey(address operator, bytes memory key) internal virtual {}

    /**
     * @notice Hook called after updating an operator's key
     * @param operator The operator address
     * @param key The new key
     */
    function _afterUpdateOperatorKey(address operator, bytes memory key) internal virtual {}

    /**
     * @notice Hook called before registering an operator
     * @param operator The operator address
     * @param key The operator's key
     * @param vault Optional vault address
     */
    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual {}

    /**
     * @notice Hook called after registering an operator
     * @param operator The operator address
     * @param key The operator's key
     * @param vault Optional vault address
     */
    function _afterRegisterOperator(address operator, bytes memory key, address vault) internal virtual {}

    /**
     * @notice Hook called before unregistering an operator
     * @param operator The operator address
     */
    function _beforeUnregisterOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called after unregistering an operator
     * @param operator The operator address
     */
    function _afterUnregisterOperator(
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
     * @notice Hook called after pausing an operator
     * @param operator The operator address
     */
    function _afterPauseOperator(
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
     * @notice Hook called after unpausing an operator
     * @param operator The operator address
     */
    function _afterUnpauseOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called before registering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeRegisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called after registering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _afterRegisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before unregistering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnregisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called after unregistering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _afterUnregisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before pausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforePauseOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called after pausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _afterPauseOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before unpausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called after unpausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _afterUnpauseOperatorVault(address operator, address vault) internal virtual {}
}
