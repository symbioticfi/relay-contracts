// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "./PermissionManager.sol";
import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {EpochManagerLogic} from "./logic/EpochManageLogic.sol";

import {IEpochManager} from "../../interfaces/base/IEpochManager.sol";

abstract contract EpochManager is PermissionManager, IEpochManager {
    using Checkpoints for Checkpoints.Trace208;

    /**
     * @inheritdoc IEpochManager
     */
    function EpochManager_VERSION() public pure returns (uint64) {
        return EpochManagerLogic.EpochManager_VERSION;
    }

    function __EpochManager_init(
        EpochManagerInitParams memory initParams
    ) internal virtual onlyInitializing {
        EpochManagerLogic.initialize(initParams);
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getCaptureTimestamp() public view virtual returns (uint48) {
        return EpochManagerLogic.getCaptureTimestamp();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getCurrentEpoch() public view virtual returns (uint48) {
        return EpochManagerLogic.getCurrentEpoch();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getCurrentEpochDuration() public view virtual returns (uint48 epochDuration) {
        return EpochManagerLogic.getCurrentEpochDuration();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getCurrentEpochStart() public view virtual returns (uint48) {
        return EpochManagerLogic.getCurrentEpochStart();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getNextEpoch() public view virtual returns (uint48) {
        return EpochManagerLogic.getNextEpoch();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getNextEpochStart() public view virtual returns (uint48) {
        return EpochManagerLogic.getNextEpochStart();
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getEpochIndex(uint48 timestamp, bytes memory hint) public view virtual returns (uint48) {
        return EpochManagerLogic.getEpochIndex(timestamp, hint);
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getEpochDuration(uint48 epoch, bytes memory hint) public view virtual returns (uint48 epochDuration) {
        return EpochManagerLogic.getEpochDuration(epoch, hint);
    }

    /**
     * @inheritdoc IEpochManager
     */
    function getEpochStart(uint48 epoch, bytes memory hint) public view virtual returns (uint48) {
        return EpochManagerLogic.getEpochStart(epoch, hint);
    }

    /**
     * @inheritdoc IEpochManager
     */
    function setEpochDuration(
        uint48 epochDuration
    ) public virtual checkPermission {
        EpochManagerLogic.setEpochDuration(epochDuration);
    }

    function _getEpochDurationDataByTimestamp(
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (uint48, uint48, uint48) {
        return EpochManagerLogic.getEpochDurationDataByTimestamp(timestamp, hint);
    }

    function _getEpochDurationDataByIndex(
        uint48 index,
        bytes memory hint
    ) internal view returns (uint48, uint48, uint48) {
        return EpochManagerLogic.getEpochDurationDataByIndex(index, hint);
    }

    function _getCurrentEpochDurationData() internal view returns (uint48, uint48, uint48) {
        return EpochManagerLogic.getCurrentEpochDurationData();
    }

    function _setEpochDuration(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal virtual {
        EpochManagerLogic.setEpochDuration(epochDuration, epochDurationTimestamp, epochDurationIndex);
    }

    function _serializeEpochDurationData(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal pure returns (uint208) {
        return EpochManagerLogic.serializeEpochDurationData(epochDuration, epochDurationTimestamp, epochDurationIndex);
    }

    function _deserializeEpochDurationData(
        uint208 epochDurationData
    ) internal pure returns (uint48, uint48, uint48) {
        return EpochManagerLogic.deserializeEpochDurationData(epochDurationData);
    }

    function _getCurrentValue(
        Checkpoints.Trace208 storage trace,
        uint48 currentTimepoint
    ) internal view virtual returns (uint208) {
        return EpochManagerLogic.getCurrentValue(trace, currentTimepoint);
    }
}
