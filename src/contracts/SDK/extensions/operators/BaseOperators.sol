// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../managers/VaultManager.sol";
/**
 * @title BaseOperators
 * @notice Base contract for managing operator registration, and vault relationships
 * @dev Provides core operator management functionality with hooks for customization
 */

abstract contract BaseOperators is VaultManager {
    /**
     * @notice Internal implementation for registering an operator
     * @param operator The operator address to register
     */
    function _registerOperatorImpl(address operator, address vault) internal virtual {
        _registerOperator(operator);
        if (operator != address(0)) {
            _registerOperatorVault(operator, vault);
        }
    }

    /**
     * @notice Internal implementation for unregistering an operator
     * @param operator The operator address to unregister
     */
    function _unregisterOperatorImpl(
        address operator
    ) internal virtual {
        _unregisterOperator(operator);
    }

    /**
     * @notice Internal implementation for pausing an operator
     * @param operator The operator address to pause
     */
    function _pauseOperatorImpl(
        address operator
    ) internal virtual {
        _pauseOperator(operator);
    }

    /**
     * @notice Internal implementation for unpausing an operator
     * @param operator The operator address to unpause
     */
    function _unpauseOperatorImpl(
        address operator
    ) internal virtual {
        _unpauseOperator(operator);
    }

    /**
     * @notice Internal implementation for registering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to associate
     * @dev Reverts if operator is not registered
     */
    function _registerOperatorVaultImpl(address operator, address vault) internal virtual {
        _registerOperatorVault(operator, vault);
    }

    /**
     * @notice Internal implementation for unregistering an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to unregister
     */
    function _unregisterOperatorVaultImpl(address operator, address vault) internal virtual {
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @notice Internal implementation for pausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to pause
     */
    function _pauseOperatorVaultImpl(address operator, address vault) internal virtual {
        _pauseVault(vault);
    }

    /**
     * @notice Internal implementation for unpausing an operator-vault pair
     * @param operator The operator address
     * @param vault The vault address to unpause
     */
    function _unpauseOperatorVaultImpl(address operator, address vault) internal virtual {
        _unpauseVault(vault);
    }
}
