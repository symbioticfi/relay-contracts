// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../VotingPowerProvider.sol";

import {IOpNetVaultAutoDeploy} from "../../../../interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol";

import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {ISelfNetwork} from "../../../../interfaces/modules/voting-power/extensions/ISelfNetwork.sol";

import {OpNetVaultAutoDeployLogic} from "./logic/OpNetVaultAutoDeployLogic.sol";

abstract contract OpNetVaultAutoDeploy is VotingPowerProvider, IOpNetVaultAutoDeploy {
    /**
     * @inheritdoc IOpNetVaultAutoDeploy
     */
    function OpNetVaultAutoDeploy_VERSION() public pure returns (uint64) {
        return OpNetVaultAutoDeployLogic.OpNetVaultAutoDeploy_VERSION;
    }

    /**
     * @inheritdoc IOpNetVaultAutoDeploy
     */
    address public immutable VAULT_CONFIGURATOR;

    constructor(
        address vaultConfigurator
    ) {
        VAULT_CONFIGURATOR = vaultConfigurator;
    }

    /**
     * @dev Must be called after __VotingPowerProvider_init().
     */
    function __OpNetVaultAutoDeploy_init(
        OpNetVaultAutoDeployInitParams memory initParams
    ) internal virtual onlyInitializing {
        OpNetVaultAutoDeployLogic.initialize(initParams);
    }

    /**
     * @inheritdoc IOpNetVaultAutoDeploy
     */
    function getAutoDeployConfig() public view virtual returns (AutoDeployConfig memory) {
        return OpNetVaultAutoDeployLogic.getAutoDeployConfig();
    }

    /**
     * @inheritdoc IOpNetVaultAutoDeploy
     */
    function setAutoDeployConfig(
        AutoDeployConfig memory config
    ) public virtual checkPermission {
        OpNetVaultAutoDeployLogic.setAutoDeployConfig(config);
    }

    function _registerOperatorImpl(
        address operator
    ) internal virtual override {
        super._registerOperatorImpl(operator);
        (address vault,,) = OpNetVaultAutoDeployLogic.createVault(operator);
        _registerOperatorVault(operator, vault);
        (bool isSelfNetworkSupported,) = address(this).call(abi.encodeCall(ISelfNetwork.SelfNetwork_VERSION, ()));
        if (isSelfNetworkSupported) {
            ISelfNetwork(address(this)).setMaxNetworkLimitVault(vault, type(uint256).max);
        }
    }
}
