// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlement} from "../../../interfaces/modules/settlement/ISettlement.sol";
import {IOzAccessControl} from "src/interfaces/modules/common/permissions/IOzAccessControl.sol";

interface IReplicaSettlement {
    function initialize(ISettlement.SettlementInitParams memory settlementInitParams, address defaultAdmin) external;
}
