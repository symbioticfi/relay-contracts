// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IRewarder {
    error Rewarder_UnknownRewarderType();
    error Rewarder_NonVetoRewarder();
    error Rewarder_NoRewarder();
    error Rewarder_InvalidSharedVault();
    error Rewarder_InvalidVault();
    error Rewarder_InvalidOperatorVault();
    error Rewarder_SharedVaultAlreadyIsRegistered();
    error Rewarder_OperatorVaultAlreadyIsRegistered();
    error Rewarder_TokenAlreadyIsRegistered();
    error Rewarder_TokenNotRegistered();
    error Rewarder_OperatorNotRegistered();
    error Rewarder_SharedVaultNotRegistered();
    error Rewarder_OperatorVaultNotRegistered();
    error Rewarder_InvalidToken();
    error Rewarder_SlashingWindowTooLarge();

    event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data);

    event DistributeOperatorRewards(
        address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root
    );

    function Rewarder_VERSION() external view returns (uint64);
}
