// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title StakeVotingPowerManager
 * @notice Abstract contract for managing stake power conversion
 */
abstract contract StakeVotingPowerManager is Initializable {
    /**
     * @notice Converts stake amount to voting power
     * @param vault The vault address
     * @param stake The stake amount
     * @return power The calculated voting power
     */
    function _stakeToVotingPower(
        address vault,
        address operator,
        uint256 stake
    ) internal view virtual returns (uint256 power);
}
