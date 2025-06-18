// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../../modules/base/IPermissionManager.sol";

interface IOzOwnable {
    /**
     * @notice The parameters for the initialization of the OzOwnable contract.
     * @param owner The address of the owner.
     */
    struct OzOwnableInitParams {
        address owner;
    }
}
