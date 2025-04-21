// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {ICaptureTimestampManager} from "../../../../interfaces/SDK/managers/extendable/ICaptureTimestampManager.sol";

/**
 * @title CaptureTimestampManager
 * @notice Abstract contract for managing capture timestamps
 */
abstract contract CaptureTimestampManager is Initializable, ICaptureTimestampManager {
    /**
     * @inheritdoc ICaptureTimestampManager
     */
    function getCaptureTimestamp() public view virtual returns (uint48 timestamp);
}
