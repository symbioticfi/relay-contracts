// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (utils/structs/BitMaps.sol)
pragma solidity ^0.8.25;

import {Checkpoints} from "./Checkpoints.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

/**
 * @dev Library for managing uint256 to bool mapping in a compact and efficient way, provided the keys are sequential.
 * Largely inspired by Uniswap's https://github.com/Uniswap/merkle-distributor/blob/master/contracts/MerkleDistributor.sol[merkle-distributor].
 *
 * BitMaps pack 256 booleans across each bit of a single 256-bit slot of `uint256` type.
 * Hence booleans corresponding to 256 _sequential_ indices would only consume a single slot,
 * unlike the regular `bool` which would consume an entire slot for a single value.
 *
 * This results in gas savings in two ways:
 *
 * - Setting a zero value to non-zero only once every 256 times
 * - Accessing the same warm slot for every 256 _sequential_ indices
 */
library BitMaps {
    using Checkpoints for Checkpoints.Trace256;

    struct BitMap {
        mapping(uint256 bucket => Checkpoints.Trace256) _data;
    }

    function get(BitMap storage bitmap, uint256 index, uint48 timestamp) internal view returns (bool) {
        uint256 bucket = index >> 8;
        uint256 mask = 1 << (index & 0xff);
        return bitmap._data[bucket].upperLookupRecent(timestamp) & mask != 0;
    }

    function getBucket(BitMap storage bitmap, uint256 bucket, uint48 timestamp) internal view returns (uint256) {
        return bitmap._data[bucket].upperLookupRecent(timestamp);
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
     * @dev Sets the bitmaps at `buckets`.
     */
    function setBatch(BitMap storage bitmap, uint256[] calldata buckets, uint256[] calldata data) internal {
        if (buckets.length != data.length) {
            revert();
        }
        for (uint256 i = 0; i < buckets.length; ++i) {
            bitmap._data[buckets[i]].push(Time.timestamp(), data[i]);
        }
    }

    /**
     * @dev Sets the bitmaps at `idxs`.
     */
    function setBatchIdxs(BitMap storage bitmap, uint256[] calldata idxs) internal {
        (uint256[] memory buckets, uint256[] memory data) = idxsToBitmaps(idxs);
        if (buckets.length != data.length) {
            revert();
        }
        for (uint256 i = 0; i < buckets.length; ++i) {
            bitmap._data[buckets[i]].push(Time.timestamp(), data[i]);
        }
    }

    /**
     * @dev Sets the bit at `index`.
     */
    function set(BitMap storage bitmap, uint256 index) internal {
        uint256 bucket = index >> 8;
        uint256 mask = 1 << (index & 0xff);
        bitmap._data[bucket].push(Time.timestamp(), bitmap._data[bucket].latest() | mask);
    }

    /**
     * @dev Unsets the bit at `index`.
     */
    function unset(BitMap storage bitmap, uint256 index) internal {
        uint256 bucket = index >> 8;
        uint256 mask = 1 << (index & 0xff);
        bitmap._data[bucket].push(Time.timestamp(), bitmap._data[bucket].latest() & ~mask);
    }

    function idxsToBitmaps(uint256[] calldata idxs)
        public
        pure
        returns (uint256[] memory buckets, uint256[] memory data)
    {
        if (idxs.length == 0) {
            revert();
        }
        uint256 bucketsLen = 1;
        uint256 curBucket = idxs[0] / 256;
        for (uint256 i = 1; i < idxs.length; ++i) {
            if (idxs[i] <= idxs[i - 1]) {
                revert();
            }
            if (idxs[i] / 256 != curBucket) {
                curBucket = idxs[i] / 256;
                bucketsLen++;
            }
        }
        buckets = new uint256[](bucketsLen);
        data = new uint256[](bucketsLen);
        curBucket = idxs[0] / 256;
        uint256 bucketIdx = 0;
        buckets[bucketIdx] = curBucket;
        for (uint256 i = 0; i < idxs.length; ++i) {
            uint256 idx = idxs[i];
            if (idx / 256 != curBucket) {
                bucketIdx++;
                curBucket = idx / 256;
                buckets[bucketIdx] = curBucket;
            }
            uint256 mask = 1 << (idx % i);
            data[bucketIdx] |= mask;
        }
    }
}
