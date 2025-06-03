// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {IEpochManager} from "../../../interfaces/base/IEpochManager.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library EpochManagerLogic {
    using Checkpoints for Checkpoints.Trace208;

    uint64 internal constant EpochManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.EpochManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant EpochManagerStorageLocation =
        0xab930e9b836b4d72502da14061937ab080936446173403910135ea983863d400;

    function _getEpochManagerStorage() internal pure returns (IEpochManager.EpochManagerStorage storage $) {
        bytes32 location = EpochManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function initialize(
        IEpochManager.EpochManagerInitParams memory initParams
    ) public {
        setEpochDurationInternal(initParams.epochDuration, initParams.epochDurationTimestamp, 0);
        emit IEpochManager.InitEpochDuration(initParams.epochDuration, initParams.epochDurationTimestamp);
    }

    function getCaptureTimestamp() public view returns (uint48) {
        return getCurrentEpochStart();
    }

    function getCurrentEpoch() public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) = getCurrentEpochDurationData();
        return epochDurationIndex + (Time.timestamp() - epochDurationTimestamp) / epochDuration;
    }

    function getCurrentEpochDuration() public view returns (uint48 epochDuration) {
        (epochDuration,,) = getCurrentEpochDurationData();
    }

    function getCurrentEpochStart() public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) = getCurrentEpochDurationData();
        return epochDurationTimestamp + (getCurrentEpoch() - epochDurationIndex) * epochDuration;
    }

    function getNextEpoch() public view returns (uint48) {
        return getCurrentEpoch() + 1;
    }

    function getNextEpochDuration() public view returns (uint48) {
        (uint48 epochDuration,,) =
            deserializeEpochDurationData(_getEpochManagerStorage()._epochDurationDataByTimestamp.latest());

        return epochDuration;
    }

    function getNextEpochStart() public view returns (uint48) {
        return getCurrentEpochStart() + getCurrentEpochDuration();
    }

    function getEpochIndex(uint48 timestamp, bytes memory hint) public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            getEpochDurationDataByTimestamp(timestamp, hint);

        return epochDurationIndex + (timestamp - epochDurationTimestamp) / epochDuration;
    }

    function getEpochDuration(uint48 epoch, bytes memory hint) public view returns (uint48 epochDuration) {
        (epochDuration,,) = getEpochDurationDataByIndex(epoch, hint);
    }

    function getEpochStart(uint48 epoch, bytes memory hint) public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            getEpochDurationDataByIndex(epoch, hint);
        return epochDurationTimestamp + (epoch - epochDurationIndex) * epochDuration;
    }

    function getEpochDurationDataByTimestamp(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (uint48, uint48, uint48) {
        return deserializeEpochDurationData(
            _getEpochManagerStorage()._epochDurationDataByTimestamp.upperLookupRecent(timestamp, hint)
        );
    }

    function getEpochDurationDataByIndex(
        uint48 index,
        bytes memory hint
    ) public view returns (uint48, uint48, uint48) {
        return deserializeEpochDurationData(
            _getEpochManagerStorage()._epochDurationDataByIndex.upperLookupRecent(index, hint)
        );
    }

    function getCurrentEpochDurationData() public view returns (uint48, uint48, uint48) {
        return deserializeEpochDurationData(
            getCurrentValue(_getEpochManagerStorage()._epochDurationDataByTimestamp, Time.timestamp())
        );
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public {
        setEpochDuration(epochDuration, getNextEpochStart(), getNextEpoch());
        emit IEpochManager.SetEpochDuration(epochDuration);
    }

    function setEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) public {
        if (epochDurationIndex < getCurrentEpoch()) {
            revert IEpochManager.EpochManager_InvalidEpochDurationIndex();
        }
        setEpochDurationInternal(epochDuration, epochDurationTimestamp, epochDurationIndex);
    }

    function setEpochDurationInternal(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal {
        if (epochDuration == 0) {
            revert IEpochManager.EpochManager_InvalidEpochDuration();
        }
        if (epochDurationTimestamp < Time.timestamp()) {
            revert IEpochManager.EpochManager_InvalidEpochDurationTimestamp();
        }
        _getEpochManagerStorage()._epochDurationDataByTimestamp.push(
            epochDurationTimestamp,
            serializeEpochDurationData(epochDuration, epochDurationTimestamp, epochDurationIndex)
        );
        _getEpochManagerStorage()._epochDurationDataByIndex.push(
            epochDurationIndex, serializeEpochDurationData(epochDuration, epochDurationTimestamp, epochDurationIndex)
        );
    }

    function serializeEpochDurationData(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal pure returns (uint208) {
        return (uint208(epochDurationIndex) << 96) | (uint208(epochDurationTimestamp) << 48) | uint208(epochDuration);
    }

    function deserializeEpochDurationData(
        uint208 epochDurationData
    ) internal pure returns (uint48, uint48, uint48) {
        return (uint48(epochDurationData), uint48(epochDurationData >> 48), uint48(epochDurationData >> 96));
    }

    function getCurrentValue(
        Checkpoints.Trace208 storage trace,
        uint48 currentTimepoint
    ) public view returns (uint208) {
        uint256 length = trace.length();
        if (length == 0) {
            revert IEpochManager.EpochManager_NoCheckpoint();
        }
        Checkpoints.Checkpoint208 memory checkpoint = trace.at(uint32(length - 1));
        if (checkpoint._key <= currentTimepoint) {
            return checkpoint._value;
        }
        if (length == 1) {
            revert IEpochManager.EpochManager_NoCheckpoint();
        }
        checkpoint = trace.at(uint32(length - 2));
        return checkpoint._value;
    }
}
