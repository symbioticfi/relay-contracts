// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {BaseMiddleware} from "../../BaseMiddleware.sol";

abstract contract EpochCapture is BaseMiddleware {
    uint48 public START_TIMESTAMP; // Start timestamp of the first epoch
    uint48 public EPOCH_DURATION; // Duration of each epoch

    /* 
     * @notice initalizer of the Epochs contract.
     * @param epochDuration The duration of each epoch.
     */
    function __EpochCapture_init(
        uint48 epochDuration
    ) internal onlyInitializing {
        EPOCH_DURATION = epochDuration;
        START_TIMESTAMP = Time.timestamp();
    }

    /* 
     * @notice Returns the start timestamp for a given epoch.
     * @param epoch The epoch number.
     * @return The start timestamp.
     */
    function getEpochStart(
        uint48 epoch
    ) public view returns (uint48) {
        return START_TIMESTAMP + epoch * EPOCH_DURATION;
    }

    /* 
     * @notice Returns the current epoch.
     * @return The current epoch.
     */
    function getCurrentEpoch() public view returns (uint48) {
        return (Time.timestamp() - START_TIMESTAMP) / EPOCH_DURATION;
    }

    /* 
     * @notice Returns the capture timestamp for the current epoch.
     * @return The capture timestamp.
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return getEpochStart(getCurrentEpoch());
    }
}
