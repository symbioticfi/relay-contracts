// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManagedUpgradeable} from "@openzeppelin/contracts-upgradeable/access/manager/AccessManagedUpgradeable.sol";

import {BaseMiddleware} from "../../BaseMiddleware.sol";

abstract contract OzAccessManaged is BaseMiddleware, AccessManagedUpgradeable {
    function __OzAccessManaged_init(
        address authority
    ) internal onlyInitializing {
        __AccessManaged_init(authority);
    }

    function _checkAccess() internal override {
        _checkCanCall(msg.sender, msg.data);
    }
}
