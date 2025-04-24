// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StakeVotingPowerManager} from "../../base/StakeVotingPowerManager.sol";

/**
 * @title EqualStakePower
 * @notice Implementation of a 1:1 stake to power conversion
 * @dev Simply returns the stake amount as the power amount without any modifications
 */
abstract contract EqualStakePower is StakeVotingPowerManager {
    function stakeToVotingPowerAt(
        address, /* vault */
        uint256 stake,
        bytes memory, /* extraData */
        uint48 /* timestamp */
    ) public view override returns (uint256 power) {
        return stake;
    }

    function stakeToVotingPower(
        address, /* vault */
        uint256 stake,
        bytes memory /* extraData */
    ) public view override returns (uint256 power) {
        return stake;
    }
}
