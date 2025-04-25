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
        address vaultFactory
    ) VaultManager(operatorRegistry, operatorNetworkOptInService, vaultFactory) {
        _disableInitializers();
    }

    function initialize(
        NetworkManagerInitParams memory networkManagerInitParams,
        VaultManagerInitParams memory vaultManagerInitParams,
        SelfRegisterOperatorsInitParams memory selfRegisterOperatorsInitParams,
        OzOwnableInitParams memory ozOwnableInitParams
    ) public virtual initializer {
        __NetworkManager_init(networkManagerInitParams);
        __OperatorManager_init();
        __VaultManager_init(vaultManagerInitParams);
        __SelfRegisterOperators_init(selfRegisterOperatorsInitParams);
        __OzOwnable_init(ozOwnableInitParams);
    }
}
