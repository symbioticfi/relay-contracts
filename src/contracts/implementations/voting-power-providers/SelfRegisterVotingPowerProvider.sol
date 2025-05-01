// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SharedVaults} from "../../features/registration/vaults/SharedVaults.sol";
import {ForcePauseSelfRegisterOperators} from
    "../../features/registration/operators/extensions/ForcePauseSelfRegisterOperators.sol";
import {Tokens} from "../../features/registration/tokens/Tokens.sol";

import {OzOwnable} from "../../features/permissions/OzOwnable.sol";
import {EqualStakeToVP} from "../../features/stakeToVotingPower/EqualStakeToVP.sol";

import {VaultManager} from "../../base/VaultManager.sol";

import {ISelfRegisterVotingPowerProvider} from
    "../../../interfaces/implementations/voting-power-providers/ISelfRegisterVotingPowerProvider.sol";

contract SelfRegisterVotingPowerProvider is
    SharedVaults,
    ForcePauseSelfRegisterOperators,
    Tokens,
    OzOwnable,
    EqualStakeToVP,
    ISelfRegisterVotingPowerProvider
{
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {
        // _disableInitializers();
    }

    /**
     * @inheritdoc ISelfRegisterVotingPowerProvider
     */
    function initialize(
        NetworkManagerInitParams memory networkManagerInitParams,
        VaultManagerInitParams memory vaultManagerInitParams,
        OzEIP712InitParams memory ozEip712InitParams,
        OzOwnableInitParams memory ozOwnableInitParams
    ) public virtual initializer {
        __NetworkManager_init(networkManagerInitParams);
        __OperatorManager_init();
        __VaultManager_init(vaultManagerInitParams);
        __SharedVaults_init();
        __OzEIP712_init(ozEip712InitParams);
        __SelfRegisterOperators_init();
        __ForcePauseSelfRegisterOperators_init();
        __Tokens_init();
        __OzOwnable_init(ozOwnableInitParams);
        __EqualStakeToVP_init();
    }
}
