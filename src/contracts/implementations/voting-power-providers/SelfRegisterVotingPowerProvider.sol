// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SharedVaults} from "../../features/registration/vaults/SharedVaults.sol";
import {SelfRegisterOperators} from "../../features/registration/operators/SelfRegisterOperators.sol";
import {Tokens} from "../../features/registration/tokens/Tokens.sol";

import {OzOwnable} from "../../features/permissions/OzOwnable.sol";
import {EqualStakeToVP} from "../../features/stakeToVotingPower/EqualStakeToVP.sol";

import {VaultManager} from "../../base/VaultManager.sol";

contract SelfRegisterVotingPowerProvider is SharedVaults, SelfRegisterOperators, Tokens, OzOwnable, EqualStakeToVP {
    constructor(
        address operatorRegistry,
        address operatorNetworkOptInService,
        address vaultFactory,
        address network,
        uint96 subnetworkID,
        uint48 slashingWindow,
        address owner_
    ) VaultManager(operatorRegistry, operatorNetworkOptInService, vaultFactory) {
        initialize(network, subnetworkID, slashingWindow, owner_);
    }

    function initialize(
        address network,
        uint96 subnetworkID,
        uint48 slashingWindow,
        address owner_
    ) internal initializer {
        __NetworkManager_init(network, subnetworkID);
        __OperatorManager_init();
        __VaultManager_init(slashingWindow);
        __SelfRegisterOperators_init("SelfRegisterVotingPowerProvider", 0);
        __OzOwnable_init(owner_);
    }
}
