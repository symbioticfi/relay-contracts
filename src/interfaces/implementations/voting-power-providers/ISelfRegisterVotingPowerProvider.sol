// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../../base/INetworkManager.sol";
import {IVaultManager} from "../../base/IVaultManager.sol";
import {ISelfRegisterOperators} from "../../features/registration/operators/ISelfRegisterOperators.sol";
import {IOzOwnable} from "../../features/permissions/IOzOwnable.sol";
import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

interface ISelfRegisterVotingPowerProvider {
    function initialize(
        INetworkManager.NetworkManagerInitParams memory networkManagerInitParams,
        IVaultManager.VaultManagerInitParams memory vaultManagerInitParams,
        IOzEIP712.OzEIP712InitParams memory ozEip712InitParams,
        IOzOwnable.OzOwnableInitParams memory ozOwnableInitParams
    ) external;
}
