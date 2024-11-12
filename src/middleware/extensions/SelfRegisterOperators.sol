// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../BaseMiddleware.sol";
import {BaseSig} from "./sigs/BaseSig.sol";

abstract contract SelfRegisterOperators is BaseMiddleware, BaseSig {
    error InvalidSignature();

    function registerOperator(bytes memory key, address vault, bytes memory signature) public {
        _beforeRegisterOperator(msg.sender, key, vault);
        _verifyKey(key, signature);
        _registerOperator(msg.sender);
        _updateKey(msg.sender, key);
        _registerOperatorVault(msg.sender, vault);
    }

    function unregisterOperator() public {
        _beforeUnregisterOperator(msg.sender);
        _unregisterOperator(msg.sender);
    }

    function pauseOperator() public {
        _beforePauseOperator(msg.sender);
        _pauseOperator(msg.sender);
    }

    function unpauseOperator() public {
        _beforeUnpauseOperator(msg.sender);
        _unpauseOperator(msg.sender);
    }

    function updateOperatorKey(bytes memory key, bytes memory signature) public {
        _beforeUpdateOperatorKey(msg.sender, key);
        _verifyKey(key, signature);
        _updateKey(msg.sender, key);
    }

    function _verifyKey(bytes memory key, bytes memory signature) internal view {
        if (!_verifyKeySignature(key, signature)) {
            revert InvalidSignature();
        }
    }

    function _beforeUpdateOperatorKey(address operator, bytes memory key) internal virtual {}

    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual {}
    function _beforeUnregisterOperator(address operator) internal virtual {}
    function _beforePauseOperator(address operator) internal virtual {}
    function _beforeUnpauseOperator(address operator) internal virtual {}
}
