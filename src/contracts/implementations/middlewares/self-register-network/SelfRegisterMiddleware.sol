// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SharedVaults} from "../../../features/registration/vaults/SharedVaults.sol";
import {ForcePauseSelfRegisterOperatorsWithKeys} from
    "../../../features/registration/operators/self-register-operators/extensions/force-pause/ForcePauseSelfRegisterOperatorsWithKeys.sol";
import {Tokens} from "../../../features/registration/tokens/Tokens.sol";

import {OzOwnable} from "../../../features/permissions/OzOwnable.sol";
import {EqualStakeToVP} from "../../../features/stakeToVotingPower/EqualStakeToVP.sol";

import {VaultManager} from "../../../base/VaultManager.sol";
import {EpochManager} from "../../../base/EpochManager.sol";

import {ISelfRegisterMiddleware} from
    "../../../../interfaces/implementations/middlewares/self-register-network/ISelfRegisterMiddleware.sol";

contract SelfRegisterMiddleware is
    EpochManager,
    SharedVaults,
    ForcePauseSelfRegisterOperatorsWithKeys,
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
        EpochManagerInitParams memory epochManagerInitParams,
        OzEIP712InitParams memory ozEip712InitParams,
        SelfRegisterOperatorsWithKeysInitParams memory selfRegisterOperatorsWithKeysInitParams,
        OzOwnableInitParams memory ozOwnableInitParams,
        KeyManagerInitParams memory keyManagerInitParams
    ) public virtual initializer {
        __NetworkManager_init(networkManagerInitParams);
        __OperatorManager_init();
        __VaultManager_init(vaultManagerInitParams);
        __EpochManager_init(epochManagerInitParams);
        __SharedVaults_init();
        __OzEIP712_init(ozEip712InitParams);
        __SelfRegisterOperatorsWithKeys_init(selfRegisterOperatorsWithKeysInitParams);
        __ForcePauseSelfRegisterOperatorsWithKeys_init();
        __Tokens_init();
        __OzOwnable_init(ozOwnableInitParams);
        __EqualStakeToVP_init();
        __KeyManager_init(keyManagerInitParams);
    }
}
