// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICaptureTimestampManager {
    /**
     * @notice Returns the current capture timestamp
     * @return timestamp The current capture timestamp
     */
    function getCaptureTimestamp() external view returns (uint48 timestamp);
}
