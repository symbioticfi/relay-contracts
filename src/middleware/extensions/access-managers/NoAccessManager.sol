// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../BaseMiddleware.sol";

abstract contract NoAccessManager is BaseMiddleware {
    error NoAccess();

    function _checkAccess() internal pure override {
        revert NoAccess();
    }
}
