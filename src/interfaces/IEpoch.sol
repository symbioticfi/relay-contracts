// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IEpoch {
    function timestampToEpoch(uint48) external view returns (uint256);
    function epochToTimestamp(uint256) external view returns (uint48);
}
