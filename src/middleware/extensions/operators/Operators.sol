// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../BaseMiddleware.sol";

/**
 * @title Operators
 * @notice Base contract for managing operator registration, keys, and vault relationships
 * @dev Provides core operator management functionality with hooks for customization
 */
abstract contract Operators is BaseMiddleware {
    uint64 public constant Operators_VERSION = 1;

    /**
     * @notice Registers a new operator with an optional vault association
     * @param operator The address of the operator to register
     * @param key The operator's public key
     * @param vault Optional vault address to associate with the operator
     */
    function registerOperator(address operator, bytes memory key, address vault) public checkAccess {
        _beforeRegisterOperator(operator, key, vault);
        _registerOperator(operator);
        _updateKey(operator, key);
        if (vault != address(0)) {
            _beforeRegisterOperatorVault(operator, vault);
            _registerOperatorVault(operator, vault);
        }
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function unregisterOperator(
        address operator
    ) public checkAccess {
        _beforeUnregisterOperator(operator);
        _unregisterOperator(operator);
    }

    /**
     * @notice Pauses an operator
     * @param operator The address of the operator to pause
     */
    function pauseOperator(
        address operator
    ) public checkAccess {
        _beforePauseOperator(operator);
        _pauseOperator(operator);
    }

    /**
     * @notice Unpauses an operator
     * @param operator The address of the operator to unpause
     */
    function unpauseOperator(
        address operator
    ) public checkAccess {
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
    }

    /**
     * @notice Updates an operator's public key
     * @param operator The address of the operator
     * @param key The new public key
     */
    function updateOperatorKey(address operator, bytes memory key) public checkAccess {
        _beforeUpdateOperatorKey(operator, key);
        _updateKey(operator, key);
    }

    /**
     * @notice Associates an operator with a vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function registerOperatorVault(address operator, address vault) public checkAccess {
        require(_isOperatorRegistered(operator), "Operator not registered");
        _beforeRegisterOperatorVault(operator, vault);
        _registerOperatorVault(operator, vault);
    }

    /**
     * @notice Removes an operator's association with a vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function unregisterOperatorVault(address operator, address vault) public checkAccess {
        _beforeUnregisterOperatorVault(operator, vault);
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @notice Pauses an operator's association with a specific vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function pauseOperatorVault(address operator, address vault) public checkAccess {
        _beforePauseOperatorVault(operator, vault);
        _pauseOperatorVault(operator, vault);
    }

    /**
     * @notice Unpauses an operator's association with a specific vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function unpauseOperatorVault(address operator, address vault) public checkAccess {
        _beforeUnpauseOperatorVault(operator, vault);
        _unpauseOperatorVault(operator, vault);
    }

    /**
     * @notice Hook called before updating an operator's key
     * @param operator The operator address
     * @param key The new key
     */
    function _beforeUpdateOperatorKey(address operator, bytes memory key) public virtual {}

    /**
     * @notice Hook called before registering an operator
     * @param operator The operator address
     * @param key The operator's key
     * @param vault Optional vault address
     */
    function _beforeRegisterOperator(address operator, bytes memory key, address vault) public virtual {}

    /**
     * @notice Hook called before unregistering an operator
     * @param operator The operator address
     */
    function _beforeUnregisterOperator(
        address operator
    ) public virtual {}

    /**
     * @notice Hook called before pausing an operator
     * @param operator The operator address
     */
    function _beforePauseOperator(
        address operator
    ) public virtual {}

    /**
     * @notice Hook called before unpausing an operator
     * @param operator The operator address
     */
    function _beforeUnpauseOperator(
        address operator
    ) public virtual {}

    /**
     * @notice Hook called before registering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeRegisterOperatorVault(address operator, address vault) public virtual {}

    /**
     * @notice Hook called before unregistering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnregisterOperatorVault(address operator, address vault) public virtual {}

    /**
     * @notice Hook called before pausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforePauseOperatorVault(address operator, address vault) public virtual {}

    /**
     * @notice Hook called before unpausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnpauseOperatorVault(address operator, address vault) public virtual {}
}
