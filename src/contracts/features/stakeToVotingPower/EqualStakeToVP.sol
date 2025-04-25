// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StakeToVotingPowerManager} from "../../base/StakeToVotingPowerManager.sol";

import {IStakeToVotingPowerManager} from "../../../interfaces/base/IStakeToVotingPowerManager.sol";
import {IEqualStakeToVP} from "../../../interfaces/features/stakeToVotingPower/IEqualStakeToVP.sol";

abstract contract EqualStakeToVP is StakeToVotingPowerManager, IEqualStakeToVP {
    /**
     * @inheritdoc IEqualStakeToVP
     */
    uint64 public constant EqualStakeToVP_VERSION = 1;

    function __EqualStakeToVP_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc IStakeToVotingPowerManager
     */
    function stakeToVotingPowerAt(
        address, /* vault */
        uint256 stake,
        bytes memory, /* extraData */
        uint48 /* timestamp */
    ) public view virtual override returns (uint256) {
        return stake;
    }

    /**
     * @inheritdoc IStakeToVotingPowerManager
     */
    function stakeToVotingPower(
        address, /* vault */
        uint256 stake,
        bytes memory /* extraData */
    ) public view virtual override returns (uint256) {
        return stake;
    }
}
