// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {CaptureTimestampManager} from "../../../managers/extendable/CaptureTimestampManager.sol";

/**
 * @title TimestampCapture
 * @notice A middleware extension that captures timestamps by subtracting 1 second from current time
 * @dev Implements CaptureTimestampManager with a simple timestamp capture mechanism
 */
abstract contract TimestampCapture is CaptureTimestampManager {
    uint64 public constant TimestampCapture_VERSION = 1;

    /* 
     * @notice Returns the current timestamp minus 1 second.
     * @return timestamp The current timestamp minus 1 second.
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return _now() - 1;
    }
}
