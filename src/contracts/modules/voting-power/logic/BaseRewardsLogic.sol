// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IStakerRewards} from "@symbioticfi/rewards/src/interfaces/stakerRewards/IStakerRewards.sol";
import {IDefaultOperatorRewards} from
    "@symbioticfi/rewards/src/interfaces/defaultOperatorRewards/IDefaultOperatorRewards.sol";

import {IBaseRewards} from "../../../../interfaces/modules/voting-power/IBaseRewards.sol";
import {INetworkManager} from "../../../../interfaces/base/INetworkManager.sol";

library BaseRewardsLogic {
    function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes memory data) public {
        IStakerRewards(stakerRewards).distributeRewards(INetworkManager(address(this)).NETWORK(), token, amount, data);
        emit IBaseRewards.DistributeStakerRewards(stakerRewards, token, amount, data);
    }

    function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) public {
        IDefaultOperatorRewards(operatorRewards).distributeRewards(
            INetworkManager(address(this)).NETWORK(), token, amount, root
        );
        emit IBaseRewards.DistributeOperatorRewards(operatorRewards, token, amount, root);
    }
}
