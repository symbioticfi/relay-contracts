// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../../modules/base/IPermissionManager.sol";

interface IOzOwnable {
    struct OzOwnableInitParams {
        address owner;
    }
}
