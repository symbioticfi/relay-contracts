// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../../../base/INetworkManager.sol";
import {IVaultManager} from "../../../base/IVaultManager.sol";
import {ISelfRegisterOperators} from "../../../features/registration/operators/ISelfRegisterOperators.sol";
import {IOzOwnable} from "../../../features/permissions/IOzOwnable.sol";

interface ISelfRegisterMiddleware {
    function initialize(
        INetworkManager.NetworkManagerInitParams memory networkManagerInitParams,
        IVaultManager.VaultManagerInitParams memory vaultManagerInitParams,
        ISelfRegisterOperators.SelfRegisterOperatorsInitParams memory selfRegisterOperatorsInitParams,
        IOzOwnable.OzOwnableInitParams memory ozOwnableInitParams
    ) external;
}
