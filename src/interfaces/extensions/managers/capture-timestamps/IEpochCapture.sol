// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IEpochCapture
 * @notice Interface for a middleware extension that captures timestamps based on epochs
 * @dev Implements timestamp capture using fixed time periods (epochs) from a base timestamp
 */
interface IEpochCapture {
    /**
     * @notice Returns the start timestamp for a given epoch
     * @param epoch The epoch number
     * @return The start timestamp
     */
    function getEpochStart(
        uint48 epoch
    ) external view returns (uint48);

    /**
     * @notice Returns the current epoch number
     * @return The current epoch
     */
    function getCurrentEpoch() external view returns (uint48);

    /**
     * @notice Returns the duration of each epoch
     * @return The duration of each epoch
     */
    function getEpochDuration() external view returns (uint48);
}
