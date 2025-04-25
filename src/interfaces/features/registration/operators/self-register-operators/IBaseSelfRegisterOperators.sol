// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBaseSelfRegisterOperators {
    error BaseSelfRegisterOperators_InvalidSignature();
    error BaseSelfRegisterOperators_OperatorPowerBelowThreshold();
    error BaseSelfRegisterOperators_OperatorPowerAboveThreshold();
    error BaseSelfRegisterOperators_OperatorVaultPowerBelowThreshold();
    error BaseSelfRegisterOperators_OperatorVaultPowerAboveThreshold();

    /// @custom:storage-location erc7201:symbiotic.storage.BaseSelfRegisterOperators
    struct BaseSelfRegisterOperatorsStorage {
        uint256 minVotingPowerThreshold;
    }

    function getMinVotingPowerThreshold() external view returns (uint256);

    function isOperatorBelowPowerThreshold(address operator, bytes memory extraData) external view returns (bool);

    function isOperatorBelowPowerThreshold(
        address operator,
        address vault,
        bytes memory extraData
    ) external view returns (bool);

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
