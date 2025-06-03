// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Settlement} from "./Settlement.sol";

import {IReplicaSettlement} from "../../../interfaces/modules/settlement/IReplicaSettlement.sol";

abstract contract ReplicaSettlement is Settlement, IReplicaSettlement {
    /**
     * @inheritdoc IReplicaSettlement
     */
    uint64 public constant ReplicaSettlement_VERSION = 1;

    function __ReplicaSettlement_init(
        ReplicaSettlementInitParams memory replicaSettlementInitParams
    ) public virtual onlyInitializing {
        __Settlement_init(replicaSettlementInitParams.settlementInitParams);
    }
}
