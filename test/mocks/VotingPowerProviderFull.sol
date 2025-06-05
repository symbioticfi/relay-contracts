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
import {OperatorVaults} from "../../src/contracts/modules/voting-power/extensions/OperatorVaults.sol";
import {BaseSlasher} from "../../src/contracts/modules/voting-power/BaseSlasher.sol";
import {BaseRewarder} from "../../src/contracts/modules/voting-power/BaseRewarder.sol";

contract VotingPowerProviderFull is
    OzOwnable,
    EqualStakeVPCalc,
    OperatorVaults,
    SharedVaults,
    SelfNetwork,
    OperatorsBlacklist,
    OperatorsWhitelist,
    OpNetVaultAutoDeploy,
    BaseSlasher,
    BaseRewarder
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
        __OperatorVaults_init();
        __SharedVaults_init();
        __SelfNetwork_init();
        __OperatorsBlacklist_init();
        __OperatorsWhitelist_init(operatorsWhitelistInitParams);
        __OpNetVaultAutoDeploy_init(opNetVaultAutoDeployInitParams);
        __BaseSlasher_init();
        __BaseRewarder_init();
    }

    function __NetworkManager_init(
        NetworkManagerInitParams memory initParams
    ) internal override(NetworkManager, SelfNetwork) {
        super.__NetworkManager_init(initParams);
    }

    function _registerOperatorImpl(
        address operator
    ) internal override(OperatorsBlacklist, OperatorsWhitelist, VotingPowerProvider, OpNetVaultAutoDeploy) {
        super._registerOperatorImpl(operator);
    }

    function slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) public returns (bool success, bytes memory response) {
        return _slashVault(timestamp, vault, operator, amount, hints);
    }

    function executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) public returns (bool success, uint256 slashedAmount) {
        return _executeSlashVault(vault, slashIndex, hints);
    }
}
