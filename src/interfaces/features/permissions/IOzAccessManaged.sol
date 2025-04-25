// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../base/IPermissionManager.sol";

import {IAccessManaged} from "@openzeppelin/contracts/access/manager/IAccessManaged.sol";

/**
 * @title IOzAccessManaged
 */
interface IOzAccessManaged {
    struct OzAccessManagedInitParams {
        address authority;
    }

    function OzAccessManaged_VERSION() external view returns (uint64);
}
