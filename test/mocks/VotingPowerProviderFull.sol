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

contract VotingPowerProviderFull is
    OzOwnable,
    EqualStakeVPCalc,
    SharedVaults,
    SelfNetwork,
    OperatorsBlacklist,
    OperatorsWhitelist
{
    constructor(
        address operatorRegistry,
        address vaultFactory,
        address networkRegistry,
        address networkMiddlewareService
    ) VotingPowerProvider(operatorRegistry, vaultFactory) SelfNetwork(networkRegistry, networkMiddlewareService) {}

    function initialize(
        VotingPowerProviderInitParams memory votingPowerProviderInitParams,
        OzOwnableInitParams memory ozOwnableInitParams,
        OperatorsWhitelistInitParams memory operatorsWhitelistInitParams
    ) public virtual initializer {
        __VotingPowerProvider_init(votingPowerProviderInitParams);
        __OzOwnable_init(ozOwnableInitParams);
        __EqualStakeVPCalc_init();
        __SharedVaults_init();
        __SelfNetwork_init();
        __OperatorsBlacklist_init();
        __OperatorsWhitelist_init(operatorsWhitelistInitParams);
    }

    function __NetworkManager_init(
        NetworkManagerInitParams memory initParams
    ) internal override(NetworkManager, SelfNetwork) {
        super.__NetworkManager_init(initParams);
    }

    function _registerOperatorImpl(
        address operator,
        address vault
    ) internal override(OperatorsBlacklist, OperatorsWhitelist, VotingPowerProvider) {
        super._registerOperatorImpl(operator, vault);
    }

    function _registerOperatorVaultImpl(
        address operator,
        address vault
    ) internal override(OperatorsBlacklist, OperatorsWhitelist, VotingPowerProvider) {
        super._registerOperatorVaultImpl(operator, vault);
    }
}
