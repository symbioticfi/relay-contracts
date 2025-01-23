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

    /**
     * @notice Allows an operator to self-register with a key and optional vault
     * @param key The operator's public key
     * @param vault Optional vault address to associate with the operator
     * @param signature Signature proving ownership of the key
     */
    function registerOperator(bytes memory key, address vault, bytes memory signature) external;

    /**
     * @notice Registers an operator on behalf of another address with signature verification
     * @param operator The address of the operator to register
     * @param key The operator's public key
     * @param vault Optional vault address to associate
     * @param signature EIP712 signature authorizing registration
     * @param keySignature Signature proving ownership of the key
     */
    function registerOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) external;

    /**
     * @notice Allows an operator to unregister themselves
     */
    function unregisterOperator() external;

    /**
     * @notice Unregisters an operator with signature verification
     * @param operator The address of the operator to unregister
     * @param signature EIP712 signature authorizing unregistration
     */
    function unregisterOperator(address operator, bytes memory signature) external;

    /**
     * @notice Allows an operator to pause themselves
     */
    function pauseOperator() external;

    /**
     * @notice Pauses an operator with signature verification
     * @param operator The address of the operator to pause
     * @param signature EIP712 signature authorizing pause
     */
    function pauseOperator(address operator, bytes memory signature) external;

    /**
     * @notice Allows an operator to unpause themselves
     */
    function unpauseOperator() external;

    /**
     * @notice Unpauses an operator with signature verification
     * @param operator The address of the operator to unpause
     * @param signature EIP712 signature authorizing unpause
     */
    function unpauseOperator(address operator, bytes memory signature) external;

    /**
     * @notice Allows an operator to update their own key
     * @param key The new public key
     * @param signature Signature proving ownership of the key
     */
    function updateOperatorKey(bytes memory key, bytes memory signature) external;

    /**
     * @notice Updates an operator's key with signature verification
     * @param operator The address of the operator
     * @param key The new public key
     * @param signature EIP712 signature authorizing key update
     * @param keySignature Signature proving ownership of the new key
     */
    function updateOperatorKey(
        address operator,
        bytes memory key,
        bytes memory signature,
        bytes memory keySignature
    ) external;

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
    function registerOperatorVault(address operator, address vault, bytes memory signature) external;

    /**
     * @notice Allows an operator to unregister a vault association
     * @param vault The address of the vault to unregister
     */
    function unregisterOperatorVault(
        address vault
    ) external;

    /**
     * @notice Unregisters a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault unregistration
     */
    function unregisterOperatorVault(address operator, address vault, bytes memory signature) external;

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
    function pauseOperatorVault(address operator, address vault, bytes memory signature) external;

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
    function unpauseOperatorVault(address operator, address vault, bytes memory signature) external;
}
