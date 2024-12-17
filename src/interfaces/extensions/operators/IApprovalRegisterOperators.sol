// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IApprovalRegisterOperators
 * @notice Interface for approval-based operator registration
 */
interface IApprovalRegisterOperators {
    struct RegistrationRequest {
        address operator;
        address vault;
        bytes key;
    }

    error DirectRegistrationNotAllowed();

    /**
     * @notice Get the total number of pending registration requests
     * @return The number of requests
     */
    function getRegistrationRequestCount() external view returns (uint256);

    /**
     * @notice Get a specific registration request by index
     * @param index The index of the request to retrieve
     * @return The registration request details
     */
    function getRegistrationRequest(
        uint256 index
    ) external view returns (RegistrationRequest memory);

    /**
     * @notice Register an operator based on a pending request
     * @param requestIndex The index of the request to register
     */
    function registerOperator(
        uint256 requestIndex
    ) external;

    /**
     * @notice Request registration as an operator
     * @param key The operator's public key
     * @param vault Optional vault address to associate
     * @param signature Signature proving ownership of the key
     */
    function requestRegisterOperator(bytes memory key, address vault, bytes memory signature) external;

    /**
     * @notice Request registration on behalf of another operator
     * @param operator The address of the operator to register
     * @param key The operator's public key
     * @param vault Optional vault address to associate
     * @param signature EIP712 signature authorizing registration
     * @param keySignature Signature proving ownership of the key
     */
    function requestRegisterOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) external;
}
