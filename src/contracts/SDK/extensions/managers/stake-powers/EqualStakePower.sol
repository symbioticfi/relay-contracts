// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StakeVotingPowerManager} from "../../../managers/extendable/StakeVotingPowerManager.sol";

/**
 * @title EqualStakePower
 * @notice Implementation of a 1:1 stake to power conversion
 * @dev Simply returns the stake amount as the power amount without any modifications
 */
abstract contract EqualStakePower is StakeVotingPowerManager {
    function stakeToVotingPower(address, /* vault */ uint256 stake) public pure override returns (uint256 power) {
        return stake;
    }
}
