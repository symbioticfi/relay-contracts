// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IForcePauseSelfRegisterOperators
 * @notice Interface for force pausing operators and operator-vault pairs
 */
interface IForcePauseSelfRegisterOperators {
    error OperatorNotRegistered();
    error OperatorNotForcePaused();
    error OperatorForcePaused();
    error OperatorVaultNotForcePaused();
    error OperatorVaultForcePaused();

    /**
     * @notice Forces an operator to be unregistered
     * @param operator The address of the operator to unregister
     */
    function forceUnregisterOperator(
        address operator
    ) external;

    /**
     * @notice Forces a specific operator-vault pair to be unregistered
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function forceUnregisterOperatorVault(address operator, address vault) external;
}
