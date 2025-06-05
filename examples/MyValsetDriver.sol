// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ValSetDriver} from "../src/contracts/modules/valset-driver/ValSetDriver.sol";
import {OzOwnable} from "../src/contracts/modules/common/permissions/OzOwnable.sol";

contract MyValSetDriver is
    ValSetDriver,
    OzOwnable
{
    function initialize(
        ValSetDriverInitParams memory valSetDriverInitParams,
        OzOwnableInitParams memory ozOwnableInitParams
    ) public virtual initializer {
        __ValSetDriver_init(valSetDriverInitParams);
        __OzOwnable_init(ozOwnableInitParams);
    }
}
