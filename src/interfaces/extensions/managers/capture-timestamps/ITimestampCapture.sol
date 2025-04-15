// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ICaptureTimestampManager} from "../../../managers/extendable/ICaptureTimestampManager.sol";

interface ITimestampCapture {
    function TimestampCapture_VERSION() external view returns (uint64);
}
