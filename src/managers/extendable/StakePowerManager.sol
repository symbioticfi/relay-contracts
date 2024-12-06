// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title StakePowerManager
 * @notice Abstract contract for managing stake power conversion
 */
abstract contract StakePowerManager is Initializable {
    /**
     * @notice Converts stake amount to voting power
     * @param vault The vault address
     * @param stake The stake amount
     * @return power The calculated voting power
     */
    function stakeToPower(address vault, uint256 stake) public view virtual returns (uint256 power);
}
