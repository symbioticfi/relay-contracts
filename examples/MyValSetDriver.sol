// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ValSetDriver} from "../src/contracts/modules/valset-driver/ValSetDriver.sol";
import {OzAccessControl} from "../src/contracts/modules/common/permissions/OzAccessControl.sol";

contract MyValSetDriver is ValSetDriver, OzAccessControl {
    function initialize(
        ValSetDriverInitParams memory valSetDriverInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __ValSetDriver_init(valSetDriverInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
