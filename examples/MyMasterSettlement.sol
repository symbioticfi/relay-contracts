// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {MasterSettlement} from "../src/contracts/modules/settlement/MasterSettlement.sol";
import {OzAccessControl} from "../src/contracts/modules/common/permissions/OzAccessControl.sol";

contract MyMasterSettlement is MasterSettlement, OzAccessControl {
    function initialize(
        MasterSettlementInitParams memory masterSettlementInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __MasterSettlement_init(masterSettlementInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
