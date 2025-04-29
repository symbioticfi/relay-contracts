// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISelfRegisterOperators {
    error SelfRegisterOperators_InvalidSignature();
    error SelfRegisterOperators_OperatorPowerBelowThreshold();
    error SelfRegisterOperators_OperatorPowerAboveThreshold();
    error SelfRegisterOperators_OperatorVaultPowerBelowThreshold();
    error SelfRegisterOperators_OperatorVaultPowerAboveThreshold();

    /// @custom:storage-location erc7201:symbiotic.storage.SelfRegisterOperators
    struct SelfRegisterOperatorsStorage {
        uint256 minVotingPowerThreshold;
    }

    function SelfRegisterOperators_VERSION() external view returns (uint64);

    function registerOperator(
        address vault
    ) external;

    function registerOperatorWithSignature(address operator, address vault, bytes memory signature) external;

    function unregisterOperator() external;

    function unregisterOperatorWithSignature(address operator, bytes memory signature) external;

    function registerOperatorVault(
        address vault
    ) external;

    function registerOperatorVaultWithSignature(address operator, address vault, bytes memory signature) external;

    function unregisterOperatorVault(
        address vault
    ) external;

    function unregisterOperatorVaultWithSignature(address operator, address vault, bytes memory signature) external;

    function increaseNonce() external;
}
