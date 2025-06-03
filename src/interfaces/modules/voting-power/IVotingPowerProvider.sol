// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../../base/INetworkManager.sol";
import {IVaultManager} from "../../base/IVaultManager.sol";
import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

interface IVotingPowerProvider {
    error VotingPowerProvider_InvalidSignature();
    error VotingPowerProvider_OperatorPowerBelowThreshold();
    error VotingPowerProvider_OperatorPowerAboveThreshold();
    error VotingPowerProvider_OperatorVaultPowerBelowThreshold();
    error VotingPowerProvider_OperatorVaultPowerAboveThreshold();

    /// @custom:storage-location erc7201:symbiotic.storage.VotingPowerProvider
    struct VotingPowerProviderStorage {
        uint256 minVotingPowerThreshold;
    }

    struct VotingPowerProviderInitParams {
        INetworkManager.NetworkManagerInitParams networkManagerInitParams;
        IVaultManager.VaultManagerInitParams vaultManagerInitParams;
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
    }

    function VotingPowerProvider_VERSION() external view returns (uint64);

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
