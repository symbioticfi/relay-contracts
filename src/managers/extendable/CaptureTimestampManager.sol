// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
/**
 * @title CaptureTimestampManager
 * @notice Abstract contract for managing capture timestamps
 */

abstract contract CaptureTimestampManager is Initializable {
    /**
     * @notice Returns the current capture timestamp
     * @return timestamp The current capture timestamp
     */
    function getCaptureTimestamp() public view virtual returns (uint48 timestamp);

    /**
     * @notice Returns the current timestamp
     * @return timestamp The current timestamp
     */
    function _now() internal view returns (uint48) {
        return Time.timestamp();
    }
}
