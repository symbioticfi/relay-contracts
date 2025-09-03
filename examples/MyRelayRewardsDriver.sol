// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {RelayRewardsDriver} from "../src/modules/rewards/RelayRewardsDriver.sol";

import {OzOwnable} from "@symbioticfi/relay-contracts/src/contracts/modules/common/permissions/OzOwnable.sol";

contract MyRelayRewardsDriver is RelayRewardsDriver, OzOwnable {
    constructor(address rewards) RelayRewards(rewards) {
    }

    function initialize(OzOwnableInitParams memory ozOwnableInitParams) public virtual initializer {
        __OzOwnable_init(ozOwnableInitParams);
    }
}