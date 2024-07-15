// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IDelegator} from "./interfaces/IDelegator.sol";
import {IVault} from "./interfaces/IVault.sol";

abstract contract Stake {
    function getOperatorsStakeAt(address network, address[] memory operators, address[] memory vaults, uint48 timestamp)
        internal
        view
        returns (uint256[] memory stakes)
    {
        stakes = new uint256[](operators.length);
        for (uint256 i = 0; i < operators.length; ++i) {
            stakes[i] = getOperatorStakeAt(network, operators[i], vaults, timestamp);
        }
    }

    function getOperatorStakeAt(address network, address operator, address[] memory vaults, uint48 timestamp)
        internal
        view
        returns (uint256 stake)
    {
        for (uint256 i = 0; i < vaults.length; ++i) {
            stake += IDelegator(IVault(vaults[i]).delegator()).stakeAt(network, operator, timestamp);
        }
        return stake;
    }
}
