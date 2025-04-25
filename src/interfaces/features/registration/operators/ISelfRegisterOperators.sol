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

    struct SelfRegisterOperatorsInitParams {
        uint256 minVotingPowerThreshold;
    }

    function SelfRegisterOperators_VERSION() external view returns (uint64);

    function getMinVotingPowerThreshold() external view returns (uint256);

    function isOperatorBelowPowerThreshold(address operator, bytes memory extraData) external view returns (bool);

    function isOperatorBelowPowerThreshold(
        address operator,
        address vault,
        bytes memory extraData
    ) external view returns (bool);

    function registerOperator(address vault, bytes memory extraData) external;

    function registerOperatorWithSignature(
        address operator,
        address vault,
        bytes memory signature,
        bytes memory extraData
    ) external;

    function unregisterOperator() external;

    function unregisterOperator(address operator, bytes memory extraData) external;

    function unregisterOperatorWithSignature(address operator, bytes memory signature) external;

    function registerOperatorVault(address vault, bytes memory extraData) external;

    function registerOperatorVaultWithSignature(
        address operator,
        address vault,
        bytes memory signature,
        bytes memory extraData
    ) external;

    function unregisterOperatorVault(
        address vault
    ) external;

    function unregisterOperatorVaultWithSignature(address operator, address vault, bytes memory signature) external;

    function unregisterOperatorVault(address operator, address vault, bytes memory extraData) external;

    function updatePowerThreshold(
        uint256 minVotingPowerThreshold_
    ) external;

    function increaseNonce() external;
}
