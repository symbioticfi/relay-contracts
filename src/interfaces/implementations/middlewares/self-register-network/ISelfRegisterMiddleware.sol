// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../../../base/INetworkManager.sol";
import {IVaultManager} from "../../../base/IVaultManager.sol";
import {ISelfRegisterOperatorsWithKeys} from
    "../../../features/registration/operators/self-register-operators/ISelfRegisterOperatorsWithKeys.sol";
import {IOzOwnable} from "../../../features/permissions/IOzOwnable.sol";
import {IOzEIP712} from "../../../base/common/IOzEIP712.sol";
import {IEpochManager} from "../../../base/IEpochManager.sol";
import {IKeyManager} from "../../../base/IKeyManager.sol";

interface ISelfRegisterMiddleware {
    function initialize(
        INetworkManager.NetworkManagerInitParams memory networkManagerInitParams,
        IVaultManager.VaultManagerInitParams memory vaultManagerInitParams,
        IEpochManager.EpochManagerInitParams memory epochManagerInitParams,
        IOzEIP712.OzEIP712InitParams memory ozEip712InitParams,
        ISelfRegisterOperatorsWithKeys.SelfRegisterOperatorsWithKeysInitParams memory
            selfRegisterOperatorsWithKeysInitParams,
        IOzOwnable.OzOwnableInitParams memory ozOwnableInitParams,
        IKeyManager.KeyManagerInitParams memory keyManagerInitParams
    ) external;
}
