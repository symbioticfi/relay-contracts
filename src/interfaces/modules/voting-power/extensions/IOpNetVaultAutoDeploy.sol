// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVotingPowerProvider} from "../IVotingPowerProvider.sol";

interface IOpNetVaultAutoDeploy {
    error OpNetVaultAutoDeploy_InvalidVersion();
    error OpNetVaultAutoDeploy_InvalidEpochDuration();
    error OpNetVaultAutoDeploy_InvalidCollateral();
    error OpNetVaultAutoDeploy_InvalidBurnerHook();
    error OpNetVaultAutoDeploy_InvalidWithSlasher();

    /// @custom:storage-location erc7201:symbiotic.storage.OpNetVaultAutoDeploy
    struct OpNetVaultAutoDeployStorage {
        AutoDeployConfig _config;
    }

    struct OpNetVaultAutoDeployInitParams {
        AutoDeployConfig config;
    }

    struct AutoDeployConfig {
        uint48 epochDuration;
        address collateral;
        address burner;
        bool withSlasher;
        bool isBurnerHook;
    }

    event SetAutoDeployConfig(AutoDeployConfig config);

    function OpNetVaultAutoDeploy_VERSION() external view returns (uint64);

    function VAULT_CONFIGURATOR() external view returns (address);

    function getAutoDeployConfig() external view returns (AutoDeployConfig memory);

    function setAutoDeployConfig(
        AutoDeployConfig memory config
    ) external;
}
