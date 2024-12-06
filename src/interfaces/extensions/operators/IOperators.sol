// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IOperators
 * @notice Interface for managing operator registration, keys, and vault relationships
 */
interface IOperators {
    /**
     * @notice Registers a new operator with an optional vault association
     * @param operator The address of the operator to register
     * @param key The operator's public key
     * @param vault Optional vault address to associate with the operator
     */
    function registerOperator(address operator, bytes memory key, address vault) external;

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function unregisterOperator(
        address operator
    ) external;

    /**
     * @notice Pauses an operator
     * @param operator The address of the operator to pause
     */
    function pauseOperator(
        address operator
    ) external;

    /**
     * @notice Unpauses an operator
     * @param operator The address of the operator to unpause
     */
    function unpauseOperator(
        address operator
    ) external;

    /**
     * @notice Updates an operator's public key
     * @param operator The address of the operator
     * @param key The new public key
     */
    function updateOperatorKey(address operator, bytes memory key) external;

    /**
     * @notice Associates an operator with a vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function registerOperatorVault(address operator, address vault) external;

    /**
     * @notice Removes an operator's association with a vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function unregisterOperatorVault(address operator, address vault) external;

    /**
     * @notice Pauses an operator's association with a specific vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function pauseOperatorVault(address operator, address vault) external;

    /**
     * @notice Unpauses an operator's association with a specific vault
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function unpauseOperatorVault(address operator, address vault) external;
}
