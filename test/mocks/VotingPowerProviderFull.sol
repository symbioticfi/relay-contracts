// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../../src/contracts/modules/voting-power/VotingPowerProvider.sol";
import {OzOwnable} from "../../src/contracts/modules/common/permissions/OzOwnable.sol";
import {EqualStakeVPCalc} from "../../src/contracts/modules/voting-power/extensions/EqualStakeVPCalc.sol";
import {SharedVaults} from "../../src/contracts/modules/voting-power/extensions/SharedVaults.sol";
import {SelfNetwork} from "../../src/contracts/modules/voting-power/extensions/SelfNetwork.sol";
import {OperatorsBlacklist} from "../../src/contracts/modules/voting-power/extensions/OperatorsBlacklist.sol";
import {OperatorsWhitelist} from "../../src/contracts/modules/voting-power/extensions/OperatorsWhitelist.sol";
import {NetworkManager} from "../../src/contracts/base/NetworkManager.sol";
import {OpNetVaultAutoDeploy} from "../../src/contracts/modules/voting-power/extensions/OpNetVaultAutoDeploy.sol";

contract VotingPowerProviderFull is
    OzOwnable,
    EqualStakeVPCalc,
    SharedVaults,
    SelfNetwork,
    OperatorsBlacklist,
    OperatorsWhitelist,
    OpNetVaultAutoDeploy
{
    constructor(
        address operatorRegistry,
        address vaultFactory,
        address networkRegistry,
        address networkMiddlewareService,
        address vaultConfigurator
    )
        VotingPowerProvider(operatorRegistry, vaultFactory)
        SelfNetwork(networkRegistry, networkMiddlewareService)
        OpNetVaultAutoDeploy(vaultConfigurator)
    {}

    function initialize(
        VotingPowerProviderInitParams memory votingPowerProviderInitParams,
        OzOwnableInitParams memory ozOwnableInitParams,
        OperatorsWhitelistInitParams memory operatorsWhitelistInitParams,
        OpNetVaultAutoDeployInitParams memory opNetVaultAutoDeployInitParams
    ) public virtual initializer {
        __VotingPowerProvider_init(votingPowerProviderInitParams);
        __OzOwnable_init(ozOwnableInitParams);
        __EqualStakeVPCalc_init();
        __SharedVaults_init();
        __SelfNetwork_init();
        __OperatorsBlacklist_init();
        __OperatorsWhitelist_init(operatorsWhitelistInitParams);
        __OpNetVaultAutoDeploy_init(opNetVaultAutoDeployInitParams);
    }

    function __NetworkManager_init(
        NetworkManagerInitParams memory initParams
    ) internal override(NetworkManager, SelfNetwork) {
        super.__NetworkManager_init(initParams);
    }

    function _registerOperatorImpl(
        address operator,
        address vault
    ) internal override(OperatorsBlacklist, OperatorsWhitelist, VotingPowerProvider, OpNetVaultAutoDeploy) {
        super._registerOperatorImpl(operator, vault);
    }

    function _registerOperatorVaultImpl(
        address operator,
        address vault
    ) internal override(OperatorsBlacklist, OperatorsWhitelist, VotingPowerProvider) {
        super._registerOperatorVaultImpl(operator, vault);
    }
}
