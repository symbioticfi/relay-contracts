// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SharedVaults} from "../../../features/registration/vaults/SharedVaults.sol";
import {SelfRegisterOperators} from "../../../features/registration/operators/SelfRegisterOperators.sol";
import {Tokens} from "../../../features/registration/tokens/Tokens.sol";

import {OzOwnable} from "../../../features/permissions/OzOwnable.sol";
import {EqualStakeToVP} from "../../../features/stakeToVotingPower/EqualStakeToVP.sol";

import {VaultManager} from "../../../base/VaultManager.sol";

import {ISelfRegisterMiddleware} from
    "../../../../interfaces/implementations/middlewares/self-register-network/ISelfRegisterMiddleware.sol";

contract SelfRegisterMiddleware is
    SharedVaults,
    SelfRegisterOperators,
    Tokens,
    OzOwnable,
    EqualStakeToVP,
    ISelfRegisterMiddleware
{
    constructor(
        address operatorRegistry,
        address operatorNetworkOptInService,
        address vaultFactory
    ) VaultManager(operatorRegistry, operatorNetworkOptInService, vaultFactory) {
        _disableInitializers();
    }

    /**
     * @inheritdoc ISelfRegisterMiddleware
     */
    function initialize(
        NetworkManagerInitParams memory networkManagerInitParams,
        VaultManagerInitParams memory vaultManagerInitParams,
        SelfRegisterOperatorsInitParams memory selfRegisterOperatorsInitParams,
        OzOwnableInitParams memory ozOwnableInitParams
    ) public virtual initializer {
        __NetworkManager_init(networkManagerInitParams);
        __OperatorManager_init();
        __VaultManager_init(vaultManagerInitParams);
        __SharedVaults_init();
        __SelfRegisterOperators_init(selfRegisterOperatorsInitParams);
        __Tokens_init();
        __OzOwnable_init(ozOwnableInitParams);
        __EqualStakeToVP_init();
    }
}
