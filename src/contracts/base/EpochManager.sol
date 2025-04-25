// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "./PermissionManager.sol";
import {Checkpoints} from "../libraries/structs/Checkpoints.sol";

import {IEpochManager} from "../../interfaces/base/IEpochManager.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

abstract contract EpochManager is PermissionManager, IEpochManager {
    using Checkpoints for Checkpoints.Trace208;

    /**
     * @inheritdoc IEpochManager
     */
    uint64 public constant EpochManager_VERSION = 1;

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
     * @inheritdoc IEpochManager
     */
    function getCaptureTimestamp() public view virtual returns (uint48) {
        return getCurrentEpochStart();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getCurrentEpoch() public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getCurrentEpochDurationData();
        return epochDurationIndex + (Time.timestamp() - epochDurationTimestamp) / epochDuration;
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getCurrentEpochDuration() public view virtual returns (uint48 epochDuration) {
        (epochDuration,,) = _getCurrentEpochDurationData();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getCurrentEpochStart() public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getCurrentEpochDurationData();
        return epochDurationTimestamp + (getCurrentEpoch() - epochDurationIndex) * epochDuration;
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getNextEpoch() public view virtual returns (uint48) {
        return getCurrentEpoch() + 1;
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getNextEpochStart() public view virtual returns (uint48) {
        return getCurrentEpochStart() + getCurrentEpochDuration();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getEpochIndex(uint48 timestamp, bytes memory hint) public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getEpochDurationDataByTimestamp(timestamp, hint);

        return epochDurationIndex + (timestamp - epochDurationTimestamp) / epochDuration;
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getEpochDuration(uint48 epoch, bytes memory hint) public view virtual returns (uint48 epochDuration) {
        (epochDuration,,) = _getEpochDurationDataByIndex(epoch, hint);
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getEpochStart(uint48 epoch, bytes memory hint) public view virtual returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getEpochDurationDataByIndex(epoch, hint);
        return epochDurationTimestamp + (epoch - epochDurationIndex) * epochDuration;
    }

    /**
     * @inheritdoc IEpochManager
     */
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
