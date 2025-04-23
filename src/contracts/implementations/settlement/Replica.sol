// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SettlementManager} from "./SettlementManager.sol";

import {OzOwnable} from "../../features/permissions/OzOwnable.sol";

contract Replica is SettlementManager, OzOwnable {
    function initialize(
        address network,
        uint96 subnetworkID,
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        string memory name,
        QuorumThreshold[] memory quorumThresholds,
        uint48 commitDuration,
        uint8 requiredKeyTag,
        address sigVerifier
    ) internal initializer {
        __SettlementManager_init(
            network,
            subnetworkID,
            epochDuration,
            epochDurationTimestamp,
            name,
            quorumThresholds,
            commitDuration,
            requiredKeyTag,
            sigVerifier
        );
    }
}
