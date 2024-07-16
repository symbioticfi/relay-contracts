// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BitMaps} from "./BitMaps.sol";
import {Checkpoints} from "./Checkpoints.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library Arrays {
    using BitMaps for BitMaps.BitMap;
    using Checkpoints for Checkpoints.Trace208;

    struct CheckpointedBytesArray {
        bytes[] array;
        mapping(bytes => uint256) idxs;
        BitMaps.BitMap activeBitmap;
    }

    struct CheckpointedAddressArray {
        address[] array;
        mapping(address => uint256) idxs;
        BitMaps.BitMap activeBitmap;
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
            bytes memory element = _array[i];
            // keccak is expensive for each element hmm
            if (self.idxs[element] != 0 || (self.array.length > 0 && keccak256(self.array[0]) == keccak256(element))) {
                // khmm expensive
                revert();
            }
            self.idxs[element] = self.array.length;
            self.array.push(element);
        }
    }

    function setActive(CheckpointedBytesArray storage self, uint256[] calldata buckets, uint256[] calldata data)
        internal
    {
        _setActive(self.array.length, buckets, data);
        self.activeBitmap.setBatch(buckets, data);
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
        _setActive(self.array.length, buckets, data);
        self.activeBitmap.setBatch(buckets, data);
    }

    function _getActiveIdxs(uint256[] memory data) private pure returns (uint256[] memory activeIdxs) {
        uint256 activeLen = 0;
        for (uint256 bucket = 0; bucket < data.length; ++bucket) {
            uint256 _data = data[bucket];
            for (uint256 i = 0; i < 256; ++i) {
                uint256 mask = 1 << i;
                if (_data & mask != 0) {
                    activeLen++;
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

    function _setActive(uint256 arrayLen, uint256[] calldata buckets, uint256[] calldata data) private pure {
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
        for (uint256 i = 0; i < 256; ++i) {
            uint256 mask = 1 << i;
            if (data[lastBucketIndex] & mask != 0) {
                maxKeyIndex = i;
            }
        }
        maxKeyIndex += buckets[lastBucketIndex] * 256;
        if (maxKeyIndex >= arrayLen) {
            revert();
        }
    }
}
