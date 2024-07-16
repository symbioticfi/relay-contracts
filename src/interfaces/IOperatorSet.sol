// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IOperatorSet {
    function length() external view returns (uint256);
    function get(uint256 idx, uint48 captureTimestamp) external view returns (address);
    function getAll(uint48 captureTimestamp) external view returns (address[] memory);
}
