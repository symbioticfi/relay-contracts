// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";

/**
 * @title ForcePauseSelfRegisterOperators
 * @notice Extension of SelfRegisterOperators that allows authorized addresses to forcefully pause/unpause operators
 * @dev Implements force pause/unpause functionality for both operators and operator-vault pairs
 */
abstract contract ForcePauseSelfRegisterOperators is SelfRegisterOperators {
    /**
     * @notice Forces an operator to be paused
     * @param operator The address of the operator to pause
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forcePauseOperator(
        address operator
    ) public checkAccess {
        _beforePauseOperator(operator);
        _pauseOperator(operator);
    }

    /**
     * @notice Forces an operator to be unpaused
     * @param operator The address of the operator to unpause
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forceUnpauseOperator(
        address operator
    ) public checkAccess {
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
    }

    /**
     * @notice Forces a specific operator-vault pair to be paused
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forcePauseOperatorVault(address operator, address vault) public checkAccess {
        _beforePauseOperatorVault(operator, vault);
        _pauseOperatorVault(operator, vault);
    }

    /**
     * @notice Forces a specific operator-vault pair to be unpaused
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forceUnpauseOperatorVault(address operator, address vault) public checkAccess {
        _beforeUnpauseOperatorVault(operator, vault);
        _unpauseOperatorVault(operator, vault);
    }
}
