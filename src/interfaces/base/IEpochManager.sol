// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Checkpoints} from "../../contracts/libraries/structs/Checkpoints.sol";

interface IEpochManager {
    error EpochManager_InvalidEpochDuration();
    error EpochManager_InvalidEpochDurationTimestamp();
    error EpochManager_InvalidEpochDurationIndex();
    error EpochManager_NoCheckpoint();

    /// @custom:storage-location erc7201:symbiotic.storage.EpochManager
    struct EpochManagerStorage {
        Checkpoints.Trace208 _epochDurationDataByTimestamp;
        Checkpoints.Trace208 _epochDurationDataByIndex;
    }

    struct EpochManagerInitParams {
        uint48 epochDuration;
        uint48 epochDurationTimestamp;
    }

    function EpochManager_VERSION() external view returns (uint64);

    function getCaptureTimestamp() external view returns (uint48);

    function getCurrentEpoch() external view returns (uint48);

    function getCurrentEpochDuration() external view returns (uint48);

    function getCurrentEpochStart() external view returns (uint48);

    function getNextEpoch() external view returns (uint48);

    function getNextEpochStart() external view returns (uint48);

    function getEpochIndex(uint48 timestamp, bytes memory hint) external view returns (uint48);

    function getEpochDuration(uint48 epoch, bytes memory hint) external view returns (uint48);

    function getEpochStart(uint48 epoch, bytes memory hint) external view returns (uint48);

    function setEpochDuration(
        uint48 epochDuration
    ) external;
}
