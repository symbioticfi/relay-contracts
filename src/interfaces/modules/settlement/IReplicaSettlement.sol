// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlement} from "../../../interfaces/modules/settlement/ISettlement.sol";

interface IReplicaSettlement {
    struct ReplicaSettlementInitParams {
        ISettlement.SettlementInitParams settlementInitParams;
    }

    function ReplicaSettlement_VERSION() external view returns (uint64);
}
