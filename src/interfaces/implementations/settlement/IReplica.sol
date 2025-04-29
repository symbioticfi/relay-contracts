// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlementManager} from "../../../interfaces/implementations/settlement/ISettlementManager.sol";
import {IOzAccessControl} from "src/interfaces/features/permissions/IOzAccessControl.sol";

interface IReplica {
    function initialize(
        ISettlementManager.SettlementManagerInitParams memory settlementManagerInitParams,
        address defaultAdmin
    ) external;
}
