// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (utils/structs/BitMaps.sol)
pragma solidity ^0.8.25;

import {Checkpoints} from "@openzeppelin/contracts/utils/structs/Checkpoints.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library BitMaps {
    using Checkpoints for Checkpoints.Trace208;

    struct BitMap {
        mapping(uint256 bucket => Checkpoints.Trace208) _data;
    }

    function get(BitMap storage bitmap, uint256 index, uint48 timestamp) internal view returns (bool) {
        uint256 bucket = index / 208;
        uint208 mask = uint208(1 << (index & 0xd0));
        return bitmap._data[bucket].upperLookupRecent(timestamp) & mask != 0;
    }

    /**
     * @dev Sets the bit at `index` to the boolean `value`.
     */
    function setTo(BitMap storage bitmap, uint256 index, bool value) internal {
        if (value) {
            set(bitmap, index);
        } else {
            unset(bitmap, index);
        }
    }

    /**
     * @dev Sets the bit at `index`.
     */
    function set(BitMap storage bitmap, uint256 index) internal {
        uint256 bucket = index / 208;
        uint208 mask = uint208(1 << (index & 0xd0));
        bitmap._data[bucket].push(Time.timestamp(), bitmap._data[bucket].latest() | mask);
    }

    /**
     * @dev Unsets the bit at `index`.
     */
    function unset(BitMap storage bitmap, uint256 index) internal {
        uint256 bucket = index / 208;
        uint208 mask = uint208(1 << (index & 0xd0));
        bitmap._data[bucket].push(Time.timestamp(), bitmap._data[bucket].latest() & ~mask);
    }
}
