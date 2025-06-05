// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IStakerRewards} from "@symbioticfi/rewards/src/interfaces/stakerRewards/IStakerRewards.sol";
import {IDefaultOperatorRewards} from
    "@symbioticfi/rewards/src/interfaces/defaultOperatorRewards/IDefaultOperatorRewards.sol";

import {IBaseRewarder} from "../../../interfaces/modules/voting-power/IBaseRewarder.sol";
import {VotingPowerProvider} from "./VotingPowerProvider.sol";

abstract contract BaseRewarder is VotingPowerProvider, IBaseRewarder {
    /**
     * @inheritdoc IBaseRewarder
     */
    uint64 public constant BaseRewarder_VERSION = 1;

    function __BaseRewarder_init() internal virtual onlyInitializing {}

    function _distributeStakerRewards(
        address stakerRewards,
        address token,
        uint256 amount,
        bytes memory data
    ) internal virtual {
        IStakerRewards(stakerRewards).distributeRewards(NETWORK(), token, amount, data);
        emit DistributeStakerRewards(stakerRewards, token, amount, data);
    }

    function _distributeOperatorRewards(
        address operatorRewards,
        address token,
        uint256 amount,
        bytes32 root
    ) internal virtual {
        IDefaultOperatorRewards(operatorRewards).distributeRewards(NETWORK(), token, amount, root);
        emit DistributeOperatorRewards(operatorRewards, token, amount, root);
    }
}
