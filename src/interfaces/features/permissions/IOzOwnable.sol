// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../base/IPermissionManager.sol";

interface IOzOwnable {
    struct OzOwnableInitParams {
        address owner;
    }

    function OzOwnable_VERSION() external view returns (uint64);
}
