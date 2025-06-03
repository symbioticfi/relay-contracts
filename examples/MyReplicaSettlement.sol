// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ReplicaSettlement} from "../src/contracts/modules/settlement/ReplicaSettlement.sol";
import {OzAccessControl} from "../src/contracts/modules/common/permissions/OzAccessControl.sol";

contract MyReplicaSettlement is ReplicaSettlement, OzAccessControl {
    function initialize(
        ReplicaSettlementInitParams memory replicaSettlementInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __ReplicaSettlement_init(replicaSettlementInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
