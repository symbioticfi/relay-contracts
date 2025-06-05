// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBaseRewards {
    event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data);

    event DistributeOperatorRewards(
        address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root
    );

    function BaseRewards_VERSION() external view returns (uint64);
}
