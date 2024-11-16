// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManagedUpgradeable} from "@openzeppelin/contracts-upgradeable/access/manager/AccessManagedUpgradeable.sol";

import {BaseMiddleware} from "../BaseMiddleware.sol";

abstract contract OzAccessManaged is BaseMiddleware, AccessManagedUpgradeable {
    constructor(
        address authority
    ) {
        __AccessManaged_init(authority);
    }

    function _checkAccess() internal override {
        _checkCanCall(msg.sender, msg.data);
    }
}
