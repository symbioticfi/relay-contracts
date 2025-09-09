// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {INetworkManager} from "../../../../interfaces/modules/base/INetworkManager.sol";
import {IOpNetVaultAutoDeploy} from "../../../../interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol";
import {IVotingPowerProvider} from "../../../../interfaces/modules/voting-power/IVotingPowerProvider.sol";

import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {IBaseSlasher} from "@symbioticfi/core/src/interfaces/slasher/IBaseSlasher.sol";
import {IOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";
import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IVaultConfigurator} from "@symbioticfi/core/src/interfaces/IVaultConfigurator.sol";
import {IVaultTokenized} from "@symbioticfi/core/src/interfaces/vault/IVaultTokenized.sol";
import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";

uint64 constant BASE_VAULT_VERSION = 1;
uint64 constant TOKENIZED_VAULT_VERSION = 2;

/**
 * @title OpNetVaultAutoDeployLogic
 * @notice Library for auto-deploying vaults.
 */
library OpNetVaultAutoDeployLogic {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OpNetVaultAutoDeploy")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OpNetVaultAutoDeployStorageLocation =
        0x85a64baaaf23c04aec63d80adaee49297f70e3944d69ec004fa7cee8ee6e8b00;

    function _getOpNetVaultAutoDeployStorage()
        internal
        pure
        returns (IOpNetVaultAutoDeploy.OpNetVaultAutoDeployStorage storage $)
    {
        bytes32 location = OpNetVaultAutoDeployStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function initialize(
        IOpNetVaultAutoDeploy.OpNetVaultAutoDeployInitParams memory initParams
    ) public {
        setAutoDeployStatus(initParams.isAutoDeployEnabled);
        setAutoDeployConfig(initParams.config);
        setSetMaxNetworkLimitHookStatus(initParams.isSetMaxNetworkLimitHookEnabled);
    }

    function isAutoDeployEnabled() public view returns (bool) {
        return _getOpNetVaultAutoDeployStorage()._isAutoDeployEnabled;
    }

    function getAutoDeployedVault(
        address operator
    ) public view returns (address) {
        return _getOpNetVaultAutoDeployStorage()._autoDeployedVault[operator];
    }

    function getAutoDeployConfig() public view returns (IOpNetVaultAutoDeploy.AutoDeployConfig memory) {
        return _getOpNetVaultAutoDeployStorage()._config;
    }

    function isSetMaxNetworkLimitHookEnabled() public view returns (bool) {
        return _getOpNetVaultAutoDeployStorage()._isSetMaxNetworkLimitHookEnabled;
    }

    function setAutoDeployStatus(
        bool status
    ) public {
        _getOpNetVaultAutoDeployStorage()._isAutoDeployEnabled = status;
        emit IOpNetVaultAutoDeploy.SetAutoDeployStatus(status);
    }

    function setAutoDeployConfig(
        IOpNetVaultAutoDeploy.AutoDeployConfig memory config
    ) public {
        _validateConfig(config);
        _getOpNetVaultAutoDeployStorage()._config = config;
        emit IOpNetVaultAutoDeploy.SetAutoDeployConfig(config);
    }

    function setSetMaxNetworkLimitHookStatus(
        bool status
    ) public {
        _getOpNetVaultAutoDeployStorage()._isSetMaxNetworkLimitHookEnabled = status;
        emit IOpNetVaultAutoDeploy.SetSetMaxNetworkLimitHookStatus(status);
    }

    function createVault(
        address operator
    ) public returns (address vault, address delegator, address slasher) {
        IOpNetVaultAutoDeploy.AutoDeployConfig memory config = getAutoDeployConfig();
        (uint64 version, bytes memory vaultParams) = getVaultParams(config);
        (uint64 delegatorIndex, bytes memory delegatorParams) = getDelegatorParams(config, operator);
        (bool withSlasher, uint64 slasherIndex, bytes memory slasherParams) = getSlasherParams(config);

        (vault, delegator, slasher) = createVault(
            version, address(0), vaultParams, delegatorIndex, delegatorParams, withSlasher, slasherIndex, slasherParams
        );
        setAutoDeployedVault(operator, vault);
    }

    function setAutoDeployedVault(address operator, address vault) public {
        _getOpNetVaultAutoDeployStorage()._autoDeployedVault[operator] = vault;
    }

    function getVaultParams(
        IOpNetVaultAutoDeploy.AutoDeployConfig memory config
    ) public view returns (uint64, bytes memory) {
        return getVaultParams(
            IVault.InitParams({
                collateral: config.collateral,
                burner: config.burner,
                epochDuration: config.epochDuration,
                depositWhitelist: false,
                isDepositLimit: false,
                depositLimit: 0,
                defaultAdminRoleHolder: address(0),
                depositWhitelistSetRoleHolder: address(0),
                depositorWhitelistRoleHolder: address(0),
                isDepositLimitSetRoleHolder: address(0),
                depositLimitSetRoleHolder: address(0)
            })
        );
    }

    function getDelegatorParams(
        IOpNetVaultAutoDeploy.AutoDeployConfig memory, /* config */
        address operator
    ) public view returns (uint64, bytes memory) {
        return getOperatorNetworkSpecificDelegatorParams(operator, address(0), address(0), address(0));
    }

    function getSlasherParams(
        IOpNetVaultAutoDeploy.AutoDeployConfig memory config
    ) public view returns (bool, uint64, bytes memory) {
        if (!config.withSlasher) {
            return (false, 0, new bytes(0));
        }
        (uint64 slasherIndex, bytes memory slasherParams) = getSlasherParams(config.isBurnerHook);
        return (true, slasherIndex, slasherParams);
    }

    function _validateConfig(
        IOpNetVaultAutoDeploy.AutoDeployConfig memory config
    ) public view {
        if (config.collateral == address(0)) {
            revert IOpNetVaultAutoDeploy.OpNetVaultAutoDeploy_InvalidCollateral();
        }
        if (config.epochDuration == 0) {
            revert IOpNetVaultAutoDeploy.OpNetVaultAutoDeploy_InvalidEpochDuration();
        }
        (bool requireSlasher, uint48 minVaultEpochDuration) = IVotingPowerProvider(address(this)).getSlashingData();
        if (config.epochDuration < minVaultEpochDuration) {
            revert IOpNetVaultAutoDeploy.OpNetVaultAutoDeploy_InvalidEpochDuration();
        }
        if (config.withSlasher) {
            if (config.isBurnerHook && config.burner == address(0)) {
                revert IOpNetVaultAutoDeploy.OpNetVaultAutoDeploy_InvalidBurnerHook();
            }
        } else {
            if (requireSlasher) {
                revert IOpNetVaultAutoDeploy.OpNetVaultAutoDeploy_InvalidWithSlasher();
            }
            if (config.isBurnerHook) {
                revert IOpNetVaultAutoDeploy.OpNetVaultAutoDeploy_InvalidBurnerHook();
            }
        }
    }

    // ------------------------------------ HELPER FUNCTIONS ------------------------------------

    /**
     * @notice Gets the encoded base vault params.
     * @param params The vault params.
     * @return version The version of the vault.
     * @return params The encoded base vault params.
     */
    function getVaultParams(
        IVault.InitParams memory params
    ) public view returns (uint64, bytes memory) {
        return (BASE_VAULT_VERSION, abi.encode(params));
    }

    /**
     * @notice Gets the encoded tokenized vault params.
     * @param baseParams The base vault params.
     * @param name The name of the tokenized vault.
     * @param symbol The symbol of the tokenized vault.
     * @return version The version of the vault.
     * @return params The encoded tokenized vault params.
     */
    function getVaultTokenizedParams(
        IVault.InitParams memory baseParams,
        string memory name,
        string memory symbol
    ) public view returns (uint64, bytes memory) {
        return (
            TOKENIZED_VAULT_VERSION,
            abi.encode(IVaultTokenized.InitParamsTokenized({baseParams: baseParams, name: name, symbol: symbol}))
        );
    }

    /**
     * @notice Gets the encoded operator-network-specific delegator params.
     * @param operator The operator.
     * @param defaultAdminRoleHolder The default admin role holder.
     * @param hook The hook.
     * @param hookSetRoleHolder The hook set role holder.
     * @return version The version of the delegator.
     * @return params The encoded operator-network-specific delegator params.
     */
    function getOperatorNetworkSpecificDelegatorParams(
        address operator,
        address defaultAdminRoleHolder,
        address hook,
        address hookSetRoleHolder
    ) public view returns (uint64, bytes memory) {
        return (
            uint64(IVotingPowerProvider.DelegatorType.OPERATOR_NETWORK_SPECIFIC),
            abi.encode(
                IOperatorNetworkSpecificDelegator.InitParams({
                    baseParams: IBaseDelegator.BaseParams({
                        defaultAdminRoleHolder: defaultAdminRoleHolder,
                        hook: hook,
                        hookSetRoleHolder: hookSetRoleHolder
                    }),
                    network: INetworkManager(address(this)).NETWORK(),
                    operator: operator
                })
            )
        );
    }

    /**
     * @notice Gets the encoded instant slasher params.
     * @param isBurnerHook If the burner needs a hook call.
     * @return version The version of the slasher.
     * @return params The encoded instant slasher params.
     */
    function getSlasherParams(
        bool isBurnerHook
    ) public view returns (uint64, bytes memory) {
        return (
            uint64(IVotingPowerProvider.SlasherType.INSTANT),
            abi.encode(ISlasher.InitParams({baseParams: IBaseSlasher.BaseParams({isBurnerHook: isBurnerHook})}))
        );
    }

    /**
     * @notice Gets the encoded veto slasher params.
     * @param isBurnerHook If the burner needs a hook call.
     * @param vetoDuration The veto duration.
     * @param resolverSetEpochsDelay The delay in epochs for a resolver to be set.
     * @return version The version of the slasher.
     * @return params The encoded veto slasher params.
     */
    function getVetoSlasherParams(
        bool isBurnerHook,
        uint48 vetoDuration,
        uint256 resolverSetEpochsDelay
    ) public view returns (uint64, bytes memory) {
        return (
            uint64(IVotingPowerProvider.SlasherType.VETO),
            abi.encode(
                IVetoSlasher.InitParams({
                    baseParams: IBaseSlasher.BaseParams({isBurnerHook: isBurnerHook}),
                    vetoDuration: vetoDuration,
                    resolverSetEpochsDelay: resolverSetEpochsDelay
                })
            )
        );
    }

    /**
     * @notice Creates a vault.
     * @param version The version of the vault.
     * @param owner The owner of the vault.
     * @param vaultParams The vault params.
     * @param delegatorIndex The index of the delegator.
     * @param delegatorParams The delegator params.
     * @param withSlasher If the vault should have a slasher.
     * @param slasherIndex The index of the slasher.
     * @param slasherParams The slasher params.
     * @return vault The address of the vault.
     * @return delegator The address of the delegator.
     * @return slasher The address of the slasher.
     */
    function createVault(
        uint64 version,
        address owner,
        bytes memory vaultParams,
        uint64 delegatorIndex,
        bytes memory delegatorParams,
        bool withSlasher,
        uint64 slasherIndex,
        bytes memory slasherParams
    ) public returns (address, address, address) {
        return IVaultConfigurator(IOpNetVaultAutoDeploy(address(this)).VAULT_CONFIGURATOR()).create(
            IVaultConfigurator.InitParams({
                version: version,
                owner: owner,
                vaultParams: vaultParams,
                delegatorIndex: delegatorIndex,
                delegatorParams: delegatorParams,
                withSlasher: withSlasher,
                slasherIndex: slasherIndex,
                slasherParams: slasherParams
            })
        );
    }
}
