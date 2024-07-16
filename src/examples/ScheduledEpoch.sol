// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IEpoch} from "../interfaces/IEpoch.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

contract ScheduledEpoch is IEpoch {
    uint48 immutable epochStart;
    uint48 immutable epochDuration;
    uint256 immutable firstEpoch;

    constructor(uint48 _epochStart, uint48 _epochDuration, uint256 _firstEpoch) {
        epochStart = _epochStart;
        epochDuration = _epochDuration;
        firstEpoch = _firstEpoch;
    }

    function timestampToEpoch(uint48 timestamp) external view override returns (uint256) {
        return uint256((timestamp - epochStart) / epochDuration) + firstEpoch;
    }

    function epochToTimestamp(uint256 epoch) external view override returns (uint48) {
        if (epoch < firstEpoch) {
            revert();
        }
        return epochStart + uint48(epoch - firstEpoch) * epochDuration;
    }
}
