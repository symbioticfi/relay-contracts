// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {CaptureTimestampManager} from "../../../managers/extendable/CaptureTimestampManager.sol";

import {ITimestampCapture} from "../../../interfaces/extensions/managers/capture-timestamps/ITimestampCapture.sol";
import {ICaptureTimestampManager} from "../../../interfaces/managers/extendable/ICaptureTimestampManager.sol";

/**
 * @title TimestampCapture
 * @notice A middleware extension that captures timestamps by subtracting 1 second from current time
 * @dev Implements CaptureTimestampManager with a simple timestamp capture mechanism
 */
abstract contract TimestampCapture is CaptureTimestampManager, ITimestampCapture {
    /**
     * @inheritdoc ITimestampCapture
     */
    uint64 public constant TimestampCapture_VERSION = 1;

    /**
     * @inheritdoc ICaptureTimestampManager
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return _now() - 1;
    }
}
