// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../../modules/base/IPermissionManager.sol";

import {IAccessManaged} from "@openzeppelin/contracts/access/manager/IAccessManaged.sol";

interface IOzAccessManaged {
    /**
     * @notice The parameters for the initialization of the OzAccessManaged contract.
     * @param authority The address of the authority that will check the access.
     */
    struct OzAccessManagedInitParams {
        address authority;
    }
}
