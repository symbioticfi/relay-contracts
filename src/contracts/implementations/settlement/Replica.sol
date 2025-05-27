// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Settlement} from "./Settlement.sol";

import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

import {IReplica} from "../../../interfaces/implementations/settlement/IReplica.sol";

contract Replica is Settlement, OzAccessControl, IReplica {
    /**
     * @inheritdoc IReplica
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
