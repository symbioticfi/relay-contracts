// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title StakeToVotingPowerManager
 * @notice Abstract contract for managing stake power conversion
 */
abstract contract StakeToVotingPowerManager is Initializable {
    function stakeToVotingPowerAt(
        address vault,
        uint256 stake,
        bytes memory extraData,
        uint48 timestamp
    ) public view virtual returns (uint256 power);

    /**
     * @notice Converts stake amount to voting power
     * @param vault The vault address
     * @param stake The stake amount
     * @return power The calculated voting power
     */
    function stakeToVotingPower(
        address vault,
        uint256 stake,
        bytes memory extraData
    ) public view virtual returns (uint256 power);
}
