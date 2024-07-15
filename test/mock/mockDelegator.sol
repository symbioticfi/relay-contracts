// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract MockDelegator {
    function stakeAt(address, address, uint48) external view returns (uint256) {
        return 1000e18;
    }
}
