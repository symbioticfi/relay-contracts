// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StakePowerManager} from "../../../managers/extendable/StakePowerManager.sol";

import {IEqualStakePower} from "../../../interfaces/extensions/managers/stake-powers/IEqualStakePower.sol";
import {IStakePowerManager} from "../../../interfaces/managers/extendable/IStakePowerManager.sol";

/**
 * @title EqualStakePower
 * @notice Implementation of a 1:1 stake to power conversion
 * @dev Simply returns the stake amount as the power amount without any modifications
 */
abstract contract EqualStakePower is StakePowerManager, IEqualStakePower {
    /**
     * @inheritdoc IEqualStakePower
     */
    uint64 public constant EqualStakePower_VERSION = 1;

    /**
     * @inheritdoc IStakePowerManager
     */
    function stakeToPower(address vault, uint256 stake) public pure override returns (uint256 power) {
        return stake;
    }
}
