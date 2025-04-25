// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlementManager} from "../../../interfaces/implementations/settlement/ISettlementManager.sol";
import {IOzOwnable} from "../../../interfaces/features/permissions/IOzOwnable.sol";

interface IReplica {
    function initialize(
        ISettlementManager.SettlementManagerInitParams memory settlementManagerInitParams,
        IOzOwnable.OzOwnableInitParams memory ozOwnableInitParams
    ) external;
}
