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
        bool _isAutoDeployEnabled;
        AutoDeployConfig _config;
        bool _isSetMaxNetworkLimitHookEnabled;
    }

    struct OpNetVaultAutoDeployInitParams {
        bool isAutoDeployEnabled;
        AutoDeployConfig config;
        bool isSetMaxNetworkLimitHookEnabled;
    }

    struct AutoDeployConfig {
        uint48 epochDuration;
        address collateral;
        address burner;
        bool withSlasher;
        bool isBurnerHook;
    }

    event SetAutoDeployStatus(bool status);

    event SetAutoDeployConfig(AutoDeployConfig config);

    event SetSetMaxNetworkLimitHookStatus(bool status);

    function OpNetVaultAutoDeploy_VERSION() external view returns (uint64);

    function VAULT_CONFIGURATOR() external view returns (address);

    function isAutoDeployEnabled() external view returns (bool);

    function getAutoDeployConfig() external view returns (AutoDeployConfig memory);

    function isSetMaxNetworkLimitHookEnabled() external view returns (bool);

    function setAutoDeployStatus(
        bool status
    ) external;

    function setAutoDeployConfig(
        AutoDeployConfig memory config
    ) external;

    function setSetMaxNetworkLimitHookStatus(
        bool status
    ) external;
}
