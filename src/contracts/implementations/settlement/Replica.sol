// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SettlementManager} from "./SettlementManager.sol";

import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

import {IReplica} from "../../../interfaces/implementations/settlement/IReplica.sol";

contract Replica is SettlementManager, OzAccessControl, IReplica {
    constructor() {
        _disableInitializers();
    }

    /**
     * @inheritdoc IReplica
     */
    function initialize(
        SettlementManagerInitParams memory settlementManagerInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __SettlementManager_init(settlementManagerInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
