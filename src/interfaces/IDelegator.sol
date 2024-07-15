// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IDelegator {
    function stakeAt(address, address, uint48) external view returns (uint256);
}
