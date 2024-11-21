// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {BaseMiddleware} from "../../BaseMiddleware.sol";

abstract contract TimestampCapture is BaseMiddleware {
    /* 
     * @notice Returns the current timestamp minus 1 second.
     * @return timestamp The current timestamp minus 1 second.
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return Time.timestamp() - 1;
    }
}
