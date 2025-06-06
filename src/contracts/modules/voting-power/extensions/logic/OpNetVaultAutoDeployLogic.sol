// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVaultConfigurator} from "@symbioticfi/core/src/interfaces/IVaultConfigurator.sol";
import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IVaultTokenized} from "@symbioticfi/core/src/interfaces/vault/IVaultTokenized.sol";
import {IOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";
import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {IBaseSlasher} from "@symbioticfi/core/src/interfaces/slasher/IBaseSlasher.sol";
import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";

import {IOpNetVaultAutoDeploy} from
    "../../../../../interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol";
import {INetworkManager} from "../../../../../interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../../interfaces/base/IVaultManager.sol";

uint64 constant BASE_VAULT_VERSION = 1;
uint64 constant TOKENIZED_VAULT_VERSION = 2;

library OpNetVaultAutoDeployLogic {
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

    function getVaultParams(
        IVault.InitParams memory params
    ) public view returns (uint64, bytes memory) {
        return (BASE_VAULT_VERSION, abi.encode(params));
    }

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

    function getOperatorNetworkSpecificDelegatorParams(
        address operator,
        address defaultAdminRoleHolder,
        address hook,
        address hookSetRoleHolder
    ) public view returns (uint64, bytes memory) {
        return (
            uint64(IVaultManager.DelegatorType.OPERATOR_NETWORK_SPECIFIC),
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

    function getSlasherParams(
        bool isBurnerHook
    ) public view returns (uint64, bytes memory) {
        return (
            uint64(IVaultManager.SlasherType.INSTANT),
            abi.encode(ISlasher.InitParams({baseParams: IBaseSlasher.BaseParams({isBurnerHook: isBurnerHook})}))
        );
    }

    function getVetoSlasherParams(
        bool isBurnerHook,
        uint48 vetoDuration,
        uint256 resolverSetEpochsDelay
    ) public view returns (uint64, bytes memory) {
        return (
            uint64(IVaultManager.SlasherType.VETO),
            abi.encode(
                IVetoSlasher.InitParams({
                    baseParams: IBaseSlasher.BaseParams({isBurnerHook: isBurnerHook}),
                    vetoDuration: vetoDuration,
                    resolverSetEpochsDelay: resolverSetEpochsDelay
                })
            )
        );
    }
}
