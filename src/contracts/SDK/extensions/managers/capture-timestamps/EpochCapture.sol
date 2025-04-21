// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManager} from "../../../managers/extendable/AccessManager.sol";
import {CaptureTimestampManager} from "../../../managers/extendable/CaptureTimestampManager.sol";
import {Checkpoints} from "../../../../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

abstract contract EpochCapture is CaptureTimestampManager, AccessManager {
    using Checkpoints for Checkpoints.Trace208;

    uint64 public constant EpochCapture_VERSION = 1;

    error InvalidEpochDuration();
    error InvalidEpochDurationTimestamp();
    error InvalidEpochDurationIndex();
    error TooOldTimestamp();
    error NoCheckpoint();

    struct EpochCaptureStorage {
        Checkpoints.Trace208 _epochDurationDataByTimestamp; // 14 empty bytes + 6 bytes for epochDurationIndex + 6 bytes for epochDuration
        Checkpoints.Trace208 _epochDurationDataByIndex; // 14 empty bytes + 6 bytes for epochDurationStart + 6 bytes for epochDuration
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.EpochCapture")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant EpochCaptureStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _getEpochCaptureStorage() internal pure returns (EpochCaptureStorage storage $) {
        bytes32 location = EpochCaptureStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __EpochCapture_init(
        uint48 epochDuration,
        uint48 epochDurationTimestamp
    ) internal virtual onlyInitializing {
        _setEpochDuration(epochDuration, epochDurationTimestamp, 0);
    }

    function getCaptureTimestamp() public view override returns (uint48) {
        return getCurrentEpochStart();
    }

    function getCurrentEpoch() public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getCurrentEpochDurationData();
        return epochDurationIndex + (Time.timestamp() - epochDurationTimestamp) / epochDuration;
    }

    function getCurrentEpochDuration() public view returns (uint48 epochDuration) {
        (epochDuration,,) = _getCurrentEpochDurationData();
    }

    function getCurrentEpochStart() public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getCurrentEpochDurationData();
        return epochDurationTimestamp + (getCurrentEpoch() - epochDurationIndex) * epochDuration;
    }

    function getEpochIndex(uint48 timestamp, bytes memory hint) public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getEpochDurationDataByTimestamp(timestamp, hint);

        return epochDurationIndex + (timestamp - epochDurationTimestamp) / epochDuration;
    }

    function getEpochDuration(uint48 epoch, bytes memory hint) public view returns (uint48 epochDuration) {
        (epochDuration,,) = _getEpochDurationDataByIndex(epoch, hint);
    }

    function getEpochStart(uint48 epoch, bytes memory hint) public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getEpochDurationDataByIndex(epoch, hint);
        return epochDurationTimestamp + (epoch - epochDurationIndex) * epochDuration;
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public checkAccess {
        _setEpochDuration(epochDuration, getCurrentEpochStart() + getCurrentEpochDuration(), getCurrentEpoch() + 1);
    }

    function _setEpochDuration(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal {
        if (epochDuration == 0) {
            revert InvalidEpochDuration();
        }
        if (epochDurationTimestamp < Time.timestamp()) {
            revert InvalidEpochDurationTimestamp();
        }
        if (epochDurationIndex < getCurrentEpoch()) {
            revert InvalidEpochDurationIndex();
        }
        _getEpochCaptureStorage()._epochDurationDataByTimestamp.push(
            epochDurationTimestamp,
            _serializeEpochDurationData(epochDuration, epochDurationTimestamp, epochDurationIndex)
        );
        _getEpochCaptureStorage()._epochDurationDataByIndex.push(
            epochDurationIndex, _serializeEpochDurationData(epochDuration, epochDurationTimestamp, epochDurationIndex)
        );
    }

    function _getEpochDurationDataByTimestamp(
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (uint48, uint48, uint48) {
        return _deserializeEpochDurationData(
            _getEpochCaptureStorage()._epochDurationDataByTimestamp.upperLookupRecent(timestamp, hint)
        );
    }

    function _getEpochDurationDataByIndex(
        uint48 index,
        bytes memory hint
    ) internal view returns (uint48, uint48, uint48) {
        return _deserializeEpochDurationData(
            _getEpochCaptureStorage()._epochDurationDataByIndex.upperLookupRecent(index, hint)
        );
    }

    function _getCurrentEpochDurationData() internal view returns (uint48, uint48, uint48) {
        return _deserializeEpochDurationData(
            _getCurrentValue(_getEpochCaptureStorage()._epochDurationDataByTimestamp, Time.timestamp())
        );
    }

    function _deserializeEpochDurationData(
        uint208 epochDurationData
    ) internal pure returns (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) {
        return (uint48(epochDurationData), uint48(epochDurationData >> 48), uint48(epochDurationData >> 96));
    }

    function _serializeEpochDurationData(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal pure returns (uint208) {
        return (uint208(epochDurationIndex) << 96) | (uint208(epochDurationTimestamp) << 48) | epochDuration;
    }

    function _getCurrentValue(
        Checkpoints.Trace208 storage trace,
        uint48 currentTimepoint
    ) internal view returns (uint208) {
        uint256 length = trace.length();
        if (length == 0) {
            revert NoCheckpoint();
        }
        Checkpoints.Checkpoint208 memory checkpoint = trace.at(uint32(length - 1));
        if (checkpoint._key <= currentTimepoint) {
            return checkpoint._value;
        }
        if (length == 1) {
            revert NoCheckpoint();
        }
        checkpoint = trace.at(uint32(length - 2));
        return checkpoint._value;
    }
}
