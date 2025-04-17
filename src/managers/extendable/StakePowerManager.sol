// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {IStakePowerManager} from "../../interfaces/managers/extendable/IStakePowerManager.sol";

/**
 * @title StakePowerManager
 * @notice Abstract contract for managing stake power conversion
 */
abstract contract StakePowerManager is Initializable, IStakePowerManager {
    /**
     * @inheritdoc IStakePowerManager
     */
    function stakeToPower(address vault, uint256 stake) public view virtual returns (uint256 power);
}
