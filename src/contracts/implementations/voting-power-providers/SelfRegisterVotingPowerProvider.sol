// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SharedVaults} from "../../features/registration/vaults/SharedVaults.sol";
import {SelfRegisterOperators} from "../../features/registration/operators/SelfRegisterOperators.sol";
import {Tokens} from "../../features/registration/tokens/Tokens.sol";

import {OzOwnable} from "../../features/permissions/OzOwnable.sol";
import {EqualStakeToVP} from "../../features/stakeToVotingPower/EqualStakeToVP.sol";

import {VaultManager} from "../../base/VaultManager.sol";

import {ISelfRegisterVotingPowerProvider} from
    "../../../interfaces/implementations/voting-power-providers/ISelfRegisterVotingPowerProvider.sol";

contract SelfRegisterVotingPowerProvider is
    SharedVaults,
    SelfRegisterOperators,
    Tokens,
    OzOwnable,
    EqualStakeToVP,
    ISelfRegisterVotingPowerProvider
{
    constructor(
        address operatorRegistry,
        address operatorNetworkOptInService,
        address vaultFactory
    ) VaultManager(operatorRegistry, operatorNetworkOptInService, vaultFactory) {
        _disableInitializers();
    }

    /**
     * @inheritdoc ISelfRegisterVotingPowerProvider
     */
    function initialize(
        NetworkManagerInitParams memory networkManagerInitParams,
        VaultManagerInitParams memory vaultManagerInitParams,
        OzEIP712InitParams memory ozEip712InitParams,
        SelfRegisterOperatorsInitParams memory selfRegisterOperatorsInitParams,
        OzOwnableInitParams memory ozOwnableInitParams
    ) public virtual initializer {
        __NetworkManager_init(networkManagerInitParams);
        __OperatorManager_init();
        __VaultManager_init(vaultManagerInitParams);
        __SharedVaults_init();
        __OzEIP712_init(ozEip712InitParams);
        __SelfRegisterOperators_init(selfRegisterOperatorsInitParams);
        __Tokens_init();
        __OzOwnable_init(ozOwnableInitParams);
        __EqualStakeToVP_init();
    }
}
