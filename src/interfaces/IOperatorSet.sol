// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IOperatorSet {
    function get(uint48 captureTimestamp) external view returns (address[] memory);
}
