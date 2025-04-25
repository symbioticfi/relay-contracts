// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SettlementManager} from "./SettlementManager.sol";

import {OzOwnable} from "../../features/permissions/OzOwnable.sol";

contract Replica is SettlementManager, OzOwnable {
    constructor() {
        _disableInitializers();
    }

    function initialize(
        SettlementManagerInitParams memory settlementManagerInitParams,
        OzOwnableInitParams memory ozOwnableInitParams
    ) public virtual initializer {
        __SettlementManager_init(settlementManagerInitParams);
        __OzOwnable_init(ozOwnableInitParams);
    }
}
