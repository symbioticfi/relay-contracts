// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Updatable} from "../utils/Updatable.sol";

import {INetworkConfig} from "../../../interfaces/INetworkConfig.sol";

import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library NetworkConfigLogic {
    using Subnetwork for address;
    using Updatable for Updatable.Uint208Value;

    function getNetwork(
        INetworkConfig.NetworkConfigStorage storage self
    ) public view returns (address) {
        return self._network;
    }

    function getSubnetworkID(
        INetworkConfig.NetworkConfigStorage storage self
    ) public view returns (uint96) {
        return self._subnetworkID;
    }

    function getSubnetwork(
        INetworkConfig.NetworkConfigStorage storage self
    ) public view returns (bytes32) {
        return self._network.subnetwork(self._subnetworkID);
    }

    function getEpochDuration(
        INetworkConfig.NetworkConfigStorage storage self
    ) public view returns (uint48) {
        return uint48(self._epochDurationData.get(Time.timestamp()));
    }

    function getCurrentEpoch(
        INetworkConfig.NetworkConfigStorage storage self
    ) public view returns (uint48) {
        uint208 epochDurationData = self._epochDurationData.get(Time.timestamp());
        uint48 epochDuration = uint48(epochDurationData);
        uint48 epochDurationTimestamp = uint48(epochDurationData >> 48);
        uint48 epochDurationIndex = uint48(epochDurationData >> 96);
        return epochDurationIndex + (Time.timestamp() - epochDurationTimestamp) / epochDuration;
    }

    function getCurrentEpochStartTs(
        INetworkConfig.NetworkConfigStorage storage self
    ) public view returns (uint48) {
        uint208 epochDurationData = self._epochDurationData.get(Time.timestamp());
        uint48 epochDuration = uint48(epochDurationData);
        uint48 epochDurationTimestamp = uint48(epochDurationData >> 48);
        uint48 epochDurationIndex = uint48(epochDurationData >> 96);
        return epochDurationTimestamp + (getCurrentEpoch(self) - epochDurationIndex) * epochDuration;
    }

    function getHookReceiver(
        INetworkConfig.NetworkConfigStorage storage self
    ) public view returns (address) {
        return address(uint160(self._hookReceiver.get(getCurrentEpoch(self))));
    }

    function initialize(
        INetworkConfig.NetworkConfigStorage storage self,
        INetworkConfig.NetworkConfigInitParams memory initParams
    ) public {
        if (initParams.epochDuration == 0) {
            revert("Epoch duration must be greater than 0");
        }
        self._epochDurationData.value = initParams.epochDuration << 48 | Time.timestamp();
        self._hookReceiver.value = uint160(initParams.hookReceiver);
    }

    function setEpochDuration(INetworkConfig.NetworkConfigStorage storage self, uint48 epochDuration) public {
        uint208 epochDurationData = epochDuration;
        uint48 nextEpochDurationTimepoint = getCurrentEpochStartTs(self) + getEpochDuration(self);
        epochDurationData = epochDurationData << 48 | nextEpochDurationTimepoint;
        epochDurationData = epochDurationData << 48 | (getCurrentEpoch(self) + 1);
        self._epochDurationData.set(Time.timestamp(), nextEpochDurationTimepoint, epochDurationData);
    }

    function setHookReceiver(INetworkConfig.NetworkConfigStorage storage self, address hookReceiver) public {
        uint48 currentEpoch = getCurrentEpoch(self);
        self._hookReceiver.set(currentEpoch, currentEpoch + 1, uint160(hookReceiver));
    }
}
