// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "./PermissionManager.sol";
import {Checkpoints} from "../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

abstract contract EpochManager is PermissionManager {
    using Checkpoints for Checkpoints.Trace208;

    uint64 public constant EpochManager_VERSION = 1;

    error EpochManager_InvalidEpochDuration();
    error EpochManager_InvalidEpochDurationTimestamp();
    error EpochManager_InvalidEpochDurationIndex();
    error EpochManager_NoCheckpoint();

    struct EpochManagerInitParams {
        uint48 epochDuration;
        uint48 epochDurationTimestamp;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.EpochManager
    struct EpochManagerStorage {
        Checkpoints.Trace208 _epochDurationDataByTimestamp; // 14 empty bytes + 6 bytes for epochDurationIndex + 6 bytes for epochDuration
        Checkpoints.Trace208 _epochDurationDataByIndex; // 14 empty bytes + 6 bytes for epochDurationStart + 6 bytes for epochDuration
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.EpochManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant EpochManagerStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _getEpochManagerStorage() internal pure returns (EpochManagerStorage storage $) {
        bytes32 location = EpochManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __EpochManager_init(
        EpochManagerInitParams memory initParams
    ) internal virtual onlyInitializing {
        _setEpochDuration(initParams.epochDuration, initParams.epochDurationTimestamp, 0);
    }

    /**
     * @notice Returns the current capture timestamp
     * @return timestamp The current capture timestamp
     */
    function getCaptureTimestamp() public view virtual returns (uint48) {
        return getCurrentEpochStart();
    }

    function getCurrentEpoch() public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getCurrentEpochDurationData();
        return epochDurationIndex + (Time.timestamp() - epochDurationTimestamp) / epochDuration;
    }

    function getCurrentEpochDuration() public view virtual returns (uint48 epochDuration) {
        (epochDuration,,) = _getCurrentEpochDurationData();
    }

    function getCurrentEpochStart() public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getCurrentEpochDurationData();
        return epochDurationTimestamp + (getCurrentEpoch() - epochDurationIndex) * epochDuration;
    }

    function getNextEpoch() public view virtual returns (uint48) {
        return getCurrentEpoch() + 1;
    }

    function getNextEpochStart() public view virtual returns (uint48) {
        return getCurrentEpochStart() + getCurrentEpochDuration();
    }

    function getEpochIndex(uint48 timestamp, bytes memory hint) public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getEpochDurationDataByTimestamp(timestamp, hint);

        return epochDurationIndex + (timestamp - epochDurationTimestamp) / epochDuration;
    }

    function getEpochDuration(uint48 epoch, bytes memory hint) public view virtual returns (uint48 epochDuration) {
        (epochDuration,,) = _getEpochDurationDataByIndex(epoch, hint);
    }

    function getEpochStart(uint48 epoch, bytes memory hint) public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getEpochDurationDataByIndex(epoch, hint);
        return epochDurationTimestamp + (epoch - epochDurationIndex) * epochDuration;
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public virtual checkPermission {
        _setEpochDuration(epochDuration, getCurrentEpochStart() + getCurrentEpochDuration(), getCurrentEpoch() + 1);
    }

    function _getEpochDurationDataByTimestamp(
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (uint48, uint48, uint48) {
        return _deserializeEpochDurationData(
            _getEpochManagerStorage()._epochDurationDataByTimestamp.upperLookupRecent(timestamp, hint)
        );
    }

    function _getEpochDurationDataByIndex(
        uint48 index,
        bytes memory hint
    ) internal view returns (uint48, uint48, uint48) {
        return _deserializeEpochDurationData(
            _getEpochManagerStorage()._epochDurationDataByIndex.upperLookupRecent(index, hint)
        );
    }

    function _getCurrentEpochDurationData() internal view returns (uint48, uint48, uint48) {
        return _deserializeEpochDurationData(
            _getCurrentValue(_getEpochManagerStorage()._epochDurationDataByTimestamp, Time.timestamp())
        );
    }

    function _setEpochDuration(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal virtual {
        if (epochDuration == 0) {
            revert EpochManager_InvalidEpochDuration();
        }
        if (epochDurationTimestamp < Time.timestamp()) {
            revert EpochManager_InvalidEpochDurationTimestamp();
        }
        if (epochDurationIndex < getCurrentEpoch()) {
            revert EpochManager_InvalidEpochDurationIndex();
        }
        _getEpochManagerStorage()._epochDurationDataByTimestamp.push(
            epochDurationTimestamp,
            _serializeEpochDurationData(epochDuration, epochDurationTimestamp, epochDurationIndex)
        );
        _getEpochManagerStorage()._epochDurationDataByIndex.push(
            epochDurationIndex, _serializeEpochDurationData(epochDuration, epochDurationTimestamp, epochDurationIndex)
        );
    }

    function _serializeEpochDurationData(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal pure returns (uint208) {
        return (uint208(epochDurationIndex) << 96) | (uint208(epochDurationTimestamp) << 48) | epochDuration;
    }

    function _deserializeEpochDurationData(
        uint208 epochDurationData
    ) internal pure returns (uint48, uint48, uint48) {
        return (uint48(epochDurationData), uint48(epochDurationData >> 48), uint48(epochDurationData >> 96));
    }

    function _getCurrentValue(
        Checkpoints.Trace208 storage trace,
        uint48 currentTimepoint
    ) internal view virtual returns (uint208) {
        uint256 length = trace.length();
        if (length == 0) {
            revert EpochManager_NoCheckpoint();
        }
        Checkpoints.Checkpoint208 memory checkpoint = trace.at(uint32(length - 1));
        if (checkpoint._key <= currentTimepoint) {
            return checkpoint._value;
        }
        if (length == 1) {
            revert EpochManager_NoCheckpoint();
        }
        checkpoint = trace.at(uint32(length - 2));
        return checkpoint._value;
    }
}
