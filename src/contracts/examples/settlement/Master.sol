// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SettlementManager} from "./SettlementManager.sol";
import {ValSetConfigManager} from "./ValSetConfigManager.sol";
import {MasterConfigManager} from "./MasterConfigManager.sol";

import {OzOwnable} from "../../modules/permissions/OzOwnable.sol";

contract Master is SettlementManager, ValSetConfigManager, MasterConfigManager, OzOwnable {
    function initialize(
        ValSetConfig memory valSetConfig,
        MasterConfig memory masterConfig,
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
        __ValSetConfigManager_init(valSetConfig);
        __MasterConfigManager_init(masterConfig);
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
