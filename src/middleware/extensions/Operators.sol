// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {BaseMiddleware} from "../BaseMiddleware.sol";

abstract contract Operators is BaseMiddleware {
    function registerOperator(address operator, bytes memory key, address vault) public checkAccess {
        _beforeRegisterOperator(operator, key, vault);
        _registerOperator(operator);
        _updateKey(operator, key);
        _registerOperatorVault(operator, vault);
    }

    function unregisterOperator(address operator) public checkAccess {
        _beforeUnregisterOperator(operator);
        _unregisterOperator(operator);
    }

    function pauseOperator(address operator) public checkAccess {
        _beforePauseOperator(operator);
        _pauseOperator(operator);
    }

    function unpauseOperator(address operator) public checkAccess {
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
    }

    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual {}
    function _beforeUnregisterOperator(address operator) internal virtual {}
    function _beforePauseOperator(address operator) internal virtual {}
    function _beforeUnpauseOperator(address operator) internal virtual {}
}