// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IEpoch} from "../interfaces/IEpoch.sol";

contract SimpleEpoch is IEpoch {
    function timestampToEpoch(uint48) external view override returns (uint256) {}
    function epochToTimestamp(uint256) external view override returns (uint48) {}
}
