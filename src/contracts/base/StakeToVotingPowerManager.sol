// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IStakeToVotingPowerManager} from "../../interfaces/base/IStakeToVotingPowerManager.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract StakeToVotingPowerManager is Initializable, IStakeToVotingPowerManager {
    /**
     * @inheritdoc IStakeToVotingPowerManager
     */
    uint64 public constant StakeToVotingPowerManager_VERSION = 1;

    /**
     * @inheritdoc IStakeToVotingPowerManager
     */
    function stakeToVotingPowerAt(
        address vault,
        uint256 stake,
        bytes memory extraData,
        uint48 timestamp
    ) public view virtual returns (uint256 power);

    /**
     * @inheritdoc IStakeToVotingPowerManager
     */
    function stakeToVotingPower(
        address vault,
        uint256 stake,
        bytes memory extraData
    ) public view virtual returns (uint256 power);
}
