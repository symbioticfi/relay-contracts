// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SharedVaults} from "../../../features/registration/vaults/SharedVaults.sol";
import {SelfRegisterOperators} from "../../../features/registration/operators/SelfRegisterOperators.sol";

import {OzOwnable} from "../../../features/permissions/OzOwnable.sol";
import {EqualStakePower} from "../../../features/stake-powers/EqualStakePower.sol";

import {VaultManager} from "../../../base/VaultManager.sol";

contract SelfRegisterStakeProvider is SharedVaults, SelfRegisterOperators, OzOwnable, EqualStakePower {
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
        __SelfRegisterOperators_init("SelfRegisterStakeProvider", 0);
        __OzOwnable_init(owner_);
    }
}
