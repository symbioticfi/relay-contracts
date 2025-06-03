// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Settlement} from "./Settlement.sol";

import {OzAccessControl} from "../../modules/common/permissions/OzAccessControl.sol";

import {IReplicaSettlement} from "../../../interfaces/modules/settlement/IReplicaSettlement.sol";

contract ReplicaSettlement is Settlement, OzAccessControl, IReplicaSettlement {
    /**
     * @inheritdoc IReplicaSettlement
     */
    function initialize(
        SettlementInitParams memory settlementInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __Settlement_init(settlementInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
