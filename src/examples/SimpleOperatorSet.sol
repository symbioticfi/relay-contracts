// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IOperatorSet} from "../interfaces/IOperatorSet.sol";

contract SimpleOperatorSet is IOperatorSet {
    function length() external view override returns (uint256) {}
    function get(uint256 idx, uint48 captureTimestamp) external view override returns (address) {}
    function getAll(uint48 captureTimestamp) external view override returns (address[] memory) {}
}
