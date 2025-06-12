// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVotingPowerCalcManager {
    function stakeToVotingPowerAt(
        address vault,
        uint256 stake,
        bytes memory extraData,
        uint48 timestamp
    ) external view returns (uint256);

    function stakeToVotingPower(address vault, uint256 stake, bytes memory extraData) external view returns (uint256);
}
