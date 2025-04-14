// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title ISelfRegisterOperators
 * @notice Interface for self-registration and management of operators with signature verification
 */
interface ISelfRegisterOperators {
    error InvalidSignature();
    error OperatorPowerBelowThreshold();
    error OperatorAbovePowerThreshold();
    /**
     * @notice Returns the nonce for an operator address
     * @param operator The operator address to check
     * @return The current nonce value
     */

    function nonces(
        address operator
    ) external view returns (uint256);

    function registerOperator(
        address vault
    ) external;

    function delegateRegisterOperator(address operator, address vault, bytes memory signature) external;

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function unregisterOperator(
        address operator
    ) external;

    /**
     * @notice Allows an operator to pause themselves
     */
    function pauseOperator() external;

    /**
     * @notice Pauses an operator with signature verification
     * @param operator The address of the operator to pause
     * @param signature EIP712 signature authorizing pause
     */
    function delegatePauseOperator(address operator, bytes memory signature) external;

    /**
     * @notice Allows an operator to unpause themselves
     */
    function unpauseOperator() external;

    /**
     * @notice Unpauses an operator with signature verification
     * @param operator The address of the operator to unpause
     * @param signature EIP712 signature authorizing unpause
     */
    function delegateUnpauseOperator(address operator, bytes memory signature) external;

    /**
     * @notice Allows an operator to register a vault association
     * @param vault The address of the vault to associate
     */
    function registerOperatorVault(
        address vault
    ) external;

    /**
     * @notice Registers a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault registration
     */
    function delegateRegisterOperatorVault(address operator, address vault, bytes memory signature) external;

    /**
     * @notice Unregisters a vault association
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function unregisterOperatorVault(address operator, address vault) external;

    /**
     * @notice Allows an operator to pause a vault association
     * @param vault The address of the vault to pause
     */
    function pauseOperatorVault(
        address vault
    ) external;

    /**
     * @notice Pauses a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault pause
     */
    function delegatePauseOperatorVault(address operator, address vault, bytes memory signature) external;

    /**
     * @notice Allows an operator to unpause a vault association
     * @param vault The address of the vault to unpause
     */
    function unpauseOperatorVault(
        address vault
    ) external;

    /**
     * @notice Unpauses a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault unpause
     */
    function delegateUnpauseOperatorVault(address operator, address vault, bytes memory signature) external;
}
