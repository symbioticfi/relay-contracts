// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {BaseMiddleware} from "../BaseMiddleware.sol";

abstract contract Subnetworks is BaseMiddleware {
    function registerSubnetwork(uint96 subnetwork) public checkAccess {
        _beforeRegisterSubnetwork(subnetwork);
        _registerSubnetwork(subnetwork);
    }

    function pauseSubnetwork(uint96 subnetwork) public checkAccess {
        _beforePauseSubnetwork(subnetwork);
        _pauseSubnetwork(subnetwork);
    }

    function unpauseSubnetwork(uint96 subnetwork) public checkAccess {
        _beforeUnpauseSubnetwork(subnetwork);
        _unpauseSubnetwork(subnetwork);
    }

    function unregisterSubnetwork(uint96 subnetwork) public checkAccess {
        _beforeUnregisterSubnetwork(subnetwork);
        _unregisterSubnetwork(subnetwork);
    }

    function _beforeRegisterSubnetwork(uint96 subnetwork) internal virtual {}
    function _beforePauseSubnetwork(uint96 subnetwork) internal virtual {}
    function _beforeUnpauseSubnetwork(uint96 subnetwork) internal virtual {}
    function _beforeUnregisterSubnetwork(uint96 subnetwork) internal virtual {}
}
