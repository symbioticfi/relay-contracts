// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {IOzAccessControl} from "src/interfaces/features/permissions/IOzAccessControl.sol";

interface IReplica {
    function initialize(ISettlement.SettlementInitParams memory settlementInitParams, address defaultAdmin) external;
}
