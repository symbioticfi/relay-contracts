// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IDelegator} from "./interfaces/IDelegator.sol";
import {IVault} from "./interfaces/IVault.sol";

abstract contract Stake {
    function getOperatorStakeAt(address network, address operator, address[] memory vaults, uint48 captureTimestamp)
        internal
        view
        returns (uint256 stake)
    {
        for (uint256 i = 0; i < vaults.length; ++i) {
            stake += IDelegator(IVault(vaults[i]).delegator()).stakeAt(network, operator, captureTimestamp);
        }
        return stake;
    }
}
