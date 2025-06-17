// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IBaseRewards} from "../../src/interfaces/modules/voting-power/extensions/IBaseRewards.sol";

contract RewarderMock {
    function distributeStakerRewards(
        address middleware,
        address stakerRewards,
        address token,
        uint256 amount,
        bytes memory data
    ) external {
        IBaseRewards(middleware).distributeStakerRewards(stakerRewards, token, amount, data);
    }

    function distributeOperatorRewards(
        address middleware,
        address operatorRewards,
        address token,
        uint256 amount,
        bytes32 root
    ) external {
        IBaseRewards(middleware).distributeOperatorRewards(operatorRewards, token, amount, root);
    }
}
