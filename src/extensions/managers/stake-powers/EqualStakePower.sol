// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StakePowerManager} from "../../../managers/extendable/StakePowerManager.sol";

/**
 * @title EqualStakePower
 * @notice Implementation of a 1:1 stake to power conversion
 * @dev Simply returns the stake amount as the power amount without any modifications
 */
abstract contract EqualStakePower is StakePowerManager {
    /**
     * @notice Converts stake amount to voting power using a 1:1 ratio
     * @param vault The vault address (unused in this implementation)
     * @param stake The stake amount
     * @return power The calculated voting power (equal to stake)
     */
    function stakeToPower(address vault, uint256 stake) public pure override returns (uint256 power) {
        return stake;
    }
}
