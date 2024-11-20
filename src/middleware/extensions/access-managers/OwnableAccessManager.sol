// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../BaseMiddleware.sol";

abstract contract OwnableAccessManager is BaseMiddleware {
    address public owner;

    error OnlyOwnerCanCall(address sender);
    error InvalidOwner(address owner);

    function __OwnableAccessManaged_init(
        address _owner
    ) internal onlyInitializing {
        owner = _owner;
    }

    function _checkAccess() internal override {
        if (msg.sender != owner) {
            revert OnlyOwnerCanCall(msg.sender);
        }
    }

    function setOwner(
        address _owner
    ) public checkAccess {
        if (_owner == address(0)) {
            revert InvalidOwner(address(0));
        }
        owner = _owner;
    }
}
