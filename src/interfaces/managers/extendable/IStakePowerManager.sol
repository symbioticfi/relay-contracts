// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IStakePowerManager {
    /**
     * @notice Converts stake amount to voting power
     * @param vault The vault address
     * @param stake The stake amount
     * @return power The calculated voting power
     */
    function stakeToPower(address vault, uint256 stake) external view returns (uint256 power);
}
