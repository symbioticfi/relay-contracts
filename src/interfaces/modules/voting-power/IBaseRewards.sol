// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBaseRewards {
    error BaseRewards_NotRewarder();

    /// @custom:storage-location erc7201:symbiotic.storage.BaseRewards
    struct BaseRewardsStorage {
        address _rewarder;
    }

    struct BaseRewardsInitParams {
        address rewarder;
    }

    event SetRewarder(address rewarder);

    event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data);

    event DistributeOperatorRewards(
        address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root
    );

    function BaseRewards_VERSION() external view returns (uint64);

    function getRewarder() external view returns (address);

    function setRewarder(
        address rewarder
    ) external;

    function distributeStakerRewards(
        address stakerRewards,
        address token,
        uint256 amount,
        bytes memory data
    ) external;

    function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) external;
}
