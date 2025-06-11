// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../../src/contracts/modules/voting-power/VotingPowerProvider.sol";
import {OzOwnable} from "../../src/contracts/modules/common/permissions/OzOwnable.sol";
import {EqualStakeVPCalc} from "../../src/contracts/modules/voting-power/extensions/EqualStakeVPCalc.sol";
import {SharedVaults} from "../../src/contracts/modules/voting-power/extensions/SharedVaults.sol";
import {MultiToken} from "../../src/contracts/modules/voting-power/extensions/MultiToken.sol";
import {OperatorsBlacklist} from "../../src/contracts/modules/voting-power/extensions/OperatorsBlacklist.sol";
import {OperatorsWhitelist} from "../../src/contracts/modules/voting-power/extensions/OperatorsWhitelist.sol";
import {NetworkManager} from "../../src/contracts/base/NetworkManager.sol";
import {OpNetVaultAutoDeploy} from "../../src/contracts/modules/voting-power/extensions/OpNetVaultAutoDeploy.sol";
import {OperatorVaults} from "../../src/contracts/modules/voting-power/extensions/OperatorVaults.sol";

contract VotingPowerProviderSemiFull is
    OzOwnable,
    EqualStakeVPCalc,
    OperatorVaults,
    SharedVaults,
    MultiToken,
    OperatorsBlacklist,
    OperatorsWhitelist
{
    constructor(address operatorRegistry, address vaultFactory) VotingPowerProvider(operatorRegistry, vaultFactory) {}

    function initialize(
        VotingPowerProviderInitParams memory votingPowerProviderInitParams,
        OzOwnableInitParams memory ozOwnableInitParams,
        OperatorsWhitelistInitParams memory operatorsWhitelistInitParams
    ) public virtual initializer {
        __VotingPowerProvider_init(votingPowerProviderInitParams);
        __OzOwnable_init(ozOwnableInitParams);
        __EqualStakeVPCalc_init();
        __OperatorVaults_init();
        __SharedVaults_init();
        __OperatorsBlacklist_init();
        __OperatorsWhitelist_init(operatorsWhitelistInitParams);
    }

    function _registerOperatorImpl(
        address operator
    ) internal override(OperatorsBlacklist, OperatorsWhitelist, VotingPowerProvider) {
        super._registerOperatorImpl(operator);
    }
}
