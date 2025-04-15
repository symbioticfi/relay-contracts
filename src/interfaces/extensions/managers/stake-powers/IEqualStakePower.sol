// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IStakePowerManager} from "../../../managers/extendable/IStakePowerManager.sol";

interface IEqualStakePower {
    function EqualStakePower_VERSION() external view returns (uint64);
}
