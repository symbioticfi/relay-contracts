// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Settlement} from "../src/contracts/modules/settlement/Settlement.sol";
import {OzAccessControl} from "../src/contracts/modules/common/permissions/OzAccessControl.sol";

contract MySettlement is Settlement, OzAccessControl {
    function initialize(
        SettlementInitParams memory settlementInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __Settlement_init(settlementInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
