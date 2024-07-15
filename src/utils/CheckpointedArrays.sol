// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BitMaps} from "./BitMaps.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library CheckpointedArrays {
    using BitMaps for BitMaps.BitMap;

    struct CheckpointedBytesArray {
        bytes[] data;
        mapping(bytes => uint256) idxs;
        BitMaps.BitMap activeBitmap;
        uint256 removedPrefix;
    }

    struct CheckpointedAddressArray {
        address[] data;
        mapping(address => uint256) idxs;
        BitMaps.BitMap activeBitmap;
        uint256 removedPrefix;
    }

    function getActive(CheckpointedBytesArray storage self) internal view returns (bytes[] memory activeArray) {
        activeArray = new bytes[](self.data.length);
        uint256 activeLen = 0;
        uint256 len = self.data.length;
        uint256 buckets = (len + 255) / 256;
        for (uint256 bucket = 0; bucket < buckets; ++bucket) {
            uint256 data = self.activeBitmap.getBucket(bucket);
            for (uint256 i = 0; i < 256; ++i) {
                uint256 mask = 1 << i;
                if (data & mask != 0) {
                    uint256 idx = i + bucket * 256;
                    activeArray[activeLen++] = self.data[idx];
                }
            }
        }
        assembly {
            mstore(activeArray, activeLen)
        }
    }

    function add(CheckpointedBytesArray storage self, bytes[] calldata _data) internal {
        for (uint256 i = 0; i < _data.length; ++i) {
            if (self.idxs[_data[i]] != 0) {
                revert();
            }
            self.idxs[_data[i]] = self.data.length;
            self.data.push(_data[i]);
        }
    }

    function setActive(CheckpointedBytesArray storage self, uint256[] calldata buckets, uint256[] calldata _data)
        internal
    {
        if (buckets.length != _data.length) {
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
            if (_data[lastBucketIndex] & mask != 0) {
                maxKeyIndex = i;
            }
            if (minKeyIndex == type(uint96).max && _data[0] & mask != 0) {
                minKeyIndex = i;
            }
        }
        maxKeyIndex += buckets[lastBucketIndex] * 256;
        minKeyIndex += buckets[0] * 256;
        if (maxKeyIndex >= self.data.length || self.removedPrefix > 0 && minKeyIndex >= self.removedPrefix) {
            revert();
        }
        self.activeBitmap.setBatch(buckets, _data);
    }

    function removePrefix(CheckpointedBytesArray storage self, uint256 newRemovedPrefix) external {
        uint256 curBucket = self.removedPrefix >> 8;
        uint256 data = self.activeBitmap.getBucket(curBucket);
        for (uint256 i = self.removedPrefix; i < newRemovedPrefix; i++) {
            uint256 bucket = i >> 8;
            if (bucket > curBucket) {
                data = self.activeBitmap.getBucket(bucket);
                curBucket = bucket;
            }
            uint256 mask = 1 << (i & 0xff);
            if (data & mask != 0) {
                revert();
            }
        }

        self.removedPrefix = newRemovedPrefix;
    }

    function getActive(CheckpointedAddressArray storage self) internal view returns (address[] memory activeArray) {
        activeArray = new address[](self.data.length);
        uint256 activeLen = 0;
        uint256 len = self.data.length;
        uint256 buckets = (len + 255) / 256;
        for (uint256 bucket = 0; bucket < buckets; ++bucket) {
            uint256 data = self.activeBitmap.getBucket(bucket);
            for (uint256 i = 0; i < 256; ++i) {
                uint256 mask = 1 << i;
                if (data & mask != 0) {
                    uint256 idx = i + bucket * 256;
                    activeArray[activeLen++] = self.data[idx];
                }
            }
        }
        assembly {
            mstore(activeArray, activeLen)
        }
    }

    function add(CheckpointedAddressArray storage self, address[] memory _data) internal {
        for (uint256 i = 0; i < _data.length; ++i) {
            if (self.idxs[_data[i]] != 0) {
                revert();
            }
            self.idxs[_data[i]] = self.data.length;
            self.data.push(_data[i]);
        }
    }

    function setActive(CheckpointedAddressArray storage self, uint256[] calldata buckets, uint256[] calldata _data)
        internal
    {
        if (buckets.length != _data.length) {
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
            if (_data[lastBucketIndex] & mask != 0) {
                maxKeyIndex = i;
            }
            if (minKeyIndex == type(uint96).max && _data[0] & mask != 0) {
                minKeyIndex = i;
            }
        }
        maxKeyIndex += buckets[lastBucketIndex] * 256;
        minKeyIndex += buckets[0] * 256;
        if (maxKeyIndex >= self.data.length || self.removedPrefix > 0 && minKeyIndex >= self.removedPrefix) {
            revert();
        }
        self.activeBitmap.setBatch(buckets, _data);
    }

    function removePrefix(CheckpointedAddressArray storage self, uint256 newRemovedPrefix) external {
        if (self.removedPrefix >= newRemovedPrefix) {
            revert();
        }

        uint256 curBucket = self.removedPrefix >> 8;
        uint256 data = self.activeBitmap.getBucket(curBucket);
        for (uint256 i = self.removedPrefix; i < newRemovedPrefix; i++) {
            uint256 bucket = i >> 8;
            if (bucket > curBucket) {
                data = self.activeBitmap.getBucket(bucket);
                curBucket = bucket;
            }
            uint256 mask = 1 << i;
            if (data & mask != 0) {
                revert();
            }
        }

        self.removedPrefix = newRemovedPrefix;
    }
}
