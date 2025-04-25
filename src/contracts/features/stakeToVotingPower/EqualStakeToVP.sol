// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StakeToVotingPowerManager} from "../../base/StakeToVotingPowerManager.sol";

/**
 * @title EqualStakeToVP
 * @notice Implementation of a 1:1 stake to power conversion
 * @dev Simply returns the stake amount as the power amount without any modifications
 */
abstract contract EqualStakeToVP is StakeToVotingPowerManager {
    function stakeToVotingPowerAt(
        address, /* vault */
        uint256 stake,
        bytes memory, /* extraData */
        uint48 /* timestamp */
    ) public view virtual override returns (uint256) {
        return stake;
    }

    function stakeToVotingPower(
        address, /* vault */
        uint256 stake,
        bytes memory /* extraData */
    ) public view virtual override returns (uint256) {
        return stake;
    }
}
