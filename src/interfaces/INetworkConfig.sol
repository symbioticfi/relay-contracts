// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Updatable} from "../contracts/libraries/utils/Updatable.sol";

interface INetworkConfig {
    struct NetworkConfigInitParams {
        address defaultAdminRoleHolder;
        uint48 epochDuration;
        address hookReceiver;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.NetworkConfig
    struct NetworkConfigStorage {
        address _network;
        uint96 _subnetworkID;
        Updatable.Uint208Value _epochDurationData; // 8 empty bytes + 6 bytes for epochDurationInitIndex + 6 bytes for epochDurationInitTimestamp + 6 bytes for epochDuration
        Updatable.Uint208Value _hookReceiver;
    }
}
