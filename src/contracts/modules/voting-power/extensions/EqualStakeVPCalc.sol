// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StakeToVotingPowerManager} from "../../../base/StakeToVotingPowerManager.sol";

import {IEqualStakeVPCalc} from "../../../../interfaces/modules/voting-power/extensions/IEqualStakeVPCalc.sol";
import {IStakeToVotingPowerManager} from "../../../../interfaces/base/IStakeToVotingPowerManager.sol";

abstract contract EqualStakeVPCalc is StakeToVotingPowerManager, IEqualStakeVPCalc {
    /**
     * @inheritdoc IEqualStakeVPCalc
     */
    uint64 public constant EqualStakeVPCalc_VERSION = 1;

    function __EqualStakeVPCalc_init() internal virtual onlyInitializing {}

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
