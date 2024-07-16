// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BitMaps} from "./BitMaps.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library Arrays {
    using BitMaps for BitMaps.BitMap;

    struct CheckpointedBytesArray {
        bytes[] array;
        mapping(bytes => uint256) idxs;
        BitMaps.BitMap activeBitmap;
        uint256 removedPrefix;
    }

    struct CheckpointedAddressArray {
        address[] array;
        mapping(address => uint256) idxs;
        BitMaps.BitMap activeBitmap;
        uint256 removedPrefix; // to checkpoints
    }

    function getActive(CheckpointedBytesArray storage self, uint48 timestamp)
        internal
        view
        returns (bytes[] memory activeArray)
    {
        uint256 len = self.array.length;
        uint256 buckets = (len + 255) / 256;
        uint256[] memory data = new uint256[](buckets);
        for (uint256 bucket = 0; bucket < buckets; ++bucket) {
            data[bucket] = self.activeBitmap.getBucket(bucket, timestamp);
        }

        uint256[] memory activeIdxs = _getActiveIdxs(data);
        uint256 activeLen = activeIdxs.length;
        activeArray = new bytes[](activeIdxs.length);
        for (uint256 i = 0; i < activeLen; ++i) {
            activeArray[i] = self.array[activeIdxs[i]];
        }
    }

    // mb add add and activate?
    function add(CheckpointedBytesArray storage self, bytes[] calldata _array) internal {
        for (uint256 i = 0; i < _array.length; ++i) {
            if (self.idxs[_array[i]] != 0) {
                revert();
            }
            self.idxs[_array[i]] = self.array.length;
            self.array.push(_array[i]);
        }
    }

    function setActive(CheckpointedBytesArray storage self, uint256[] calldata buckets, uint256[] calldata data)
        internal
    {
        _setActive(self.array.length, self.removedPrefix, buckets, data);
        self.activeBitmap.setBatch(buckets, data);
    }

    function removePrefix(CheckpointedBytesArray storage self, uint256 newRemovedPrefix) external {
        uint48 timestamp = Time.timestamp();
        uint256 curBucket = self.removedPrefix >> 8;
        uint256 data = self.activeBitmap.getBucket(curBucket, timestamp);

        for (uint256 i = self.removedPrefix; i < newRemovedPrefix; i++) {
            uint256 bucket = i >> 8;
            if (bucket > curBucket) {
                data = self.activeBitmap.getBucket(bucket, timestamp);
                curBucket = bucket;
            }
            uint256 mask = 1 << (i & 0xff);
            if (data & mask != 0) {
                revert();
            }
        }

        self.removedPrefix = newRemovedPrefix;
    }

    function getActive(CheckpointedAddressArray storage self, uint48 timestamp)
        internal
        view
        returns (address[] memory activeArray)
    {
        uint256 len = self.array.length;

        uint256 buckets = (len + 255) / 256;
        uint256[] memory data = new uint256[](buckets);
        for (uint256 bucket = 0; bucket < buckets; ++bucket) {
            data[bucket] = self.activeBitmap.getBucket(bucket, timestamp);
        }
        uint256[] memory activeIdxs = _getActiveIdxs(data);
        uint256 activeLen = activeIdxs.length;
        activeArray = new address[](activeLen);
        for (uint256 i = 0; i < activeLen; ++i) {
            activeArray[i] = self.array[activeIdxs[i]];
        }
    }

    function add(CheckpointedAddressArray storage self, address[] memory _array) internal {
        for (uint256 i = 0; i < _array.length; ++i) {
            if (self.idxs[_array[i]] != 0) {
                revert();
            }
            self.idxs[_array[i]] = self.array.length;
            self.array.push(_array[i]);
        }
    }

    function setActive(CheckpointedAddressArray storage self, uint256[] calldata buckets, uint256[] calldata data)
        internal
    {
        _setActive(self.array.length, self.removedPrefix, buckets, data);
        self.activeBitmap.setBatch(buckets, data);
    }

    function removePrefix(CheckpointedAddressArray storage self, uint256 newRemovedPrefix) external {
        uint48 timestamp = Time.timestamp();
        uint256 curBucket = self.removedPrefix >> 8;
        uint256 data = self.activeBitmap.getBucket(curBucket, timestamp);

        for (uint256 i = self.removedPrefix; i < newRemovedPrefix; i++) {
            uint256 bucket = i >> 8;
            if (bucket > curBucket) {
                data = self.activeBitmap.getBucket(bucket, timestamp);
                curBucket = bucket;
            }
            uint256 mask = 1 << i;
            if (data & mask != 0) {
                revert();
            }
        }

        self.removedPrefix = newRemovedPrefix;
    }

    function _getActiveIdxs(uint256[] memory data) private pure returns (uint256[] memory activeIdxs) {
        uint256 activeLen = 0;
        for (uint256 bucket = 0; bucket < data.length; ++bucket) {
            uint256 _data = data[bucket];
            for (uint256 i = 0; i < 256; ++i) {
                uint256 mask = 1 << i;
                if (_data & mask != 0) {
                    activeLen += 1;
                }
            }
        }

        activeIdxs = new uint256[](activeLen);
        activeLen = 0;
        for (uint256 bucket = 0; bucket < data.length; ++bucket) {
            uint256 _data = data[bucket];
            for (uint256 i = 0; i < 256; ++i) {
                uint256 mask = 1 << i;
                if (_data & mask != 0) {
                    activeIdxs[activeLen++] = i + bucket * 256;
                }
            }
        }
    }

    function _setActive(uint256 arrayLen, uint256 removedPrefix, uint256[] calldata buckets, uint256[] calldata data)
        private
        pure
    {
        if (buckets.length != data.length) {
            revert();
        }

        for (uint256 i = 1; i < buckets.length; ++i) {
            if (buckets[i] <= buckets[i - 1]) {
                revert();
            }
        }

        uint256 lastBucketIndex = buckets.length - 1;
        uint256 maxKeyIndex = 0;
        uint256 minKeyIndex = type(uint96).max;
        for (uint256 i = 0; i < 256; ++i) {
            uint256 mask = 1 << i;
            if (data[lastBucketIndex] & mask != 0) {
                maxKeyIndex = i;
            }
            if (minKeyIndex == type(uint96).max && data[0] & mask != 0) {
                minKeyIndex = i;
            }
        }
        maxKeyIndex += buckets[lastBucketIndex] * 256;
        minKeyIndex += buckets[0] * 256;
        if (maxKeyIndex >= arrayLen || removedPrefix > 0 && minKeyIndex >= removedPrefix) {
            revert();
        }
    }
}
