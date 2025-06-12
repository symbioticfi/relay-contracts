// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../../modules/base/IPermissionManager.sol";

import {IAccessControl} from "@openzeppelin/contracts/access/IAccessControl.sol";

interface IOzAccessControl {
    event SetSelectorRole(bytes4 indexed selector, bytes32 indexed role);

    function getRole(
        bytes4 selector
    ) external view returns (bytes32);
}
