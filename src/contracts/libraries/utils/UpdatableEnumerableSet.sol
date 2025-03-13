// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Updatable} from "./Updatable.sol";

library UpdatableEnumerableSet {
    using Updatable for AddressInner;

    struct AddressInner {
        address value;
        bool isIncluded;
        bool nextIsIncluded;
        uint48 nextIsIncludedTimepoint;
    }

    struct AddressSet {
        AddressInner[] values;
        mapping(address => uint256) positions;
    }

    function add(
        AddressSet storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        address value
    ) internal returns (bool) {
        if (!contains(self, value)) {
            self.values.push(
                AddressInner({
                    value: value,
                    isIncluded: false,
                    nextIsIncluded: true,
                    nextIsIncludedTimepoint: nextValueTimepoint
                })
            );
            self.positions[value] = self.values.length;
            return true;
        }
        return self.values[self.positions[value] - 1].set(currentTimepoint, nextValueTimepoint, true);
    }

    function remove(
        AddressSet storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        address value
    ) internal returns (bool) {
        uint256 position = self.positions[value];

        if (position != 0) {
            return self.values[position - 1].set(currentTimepoint, nextValueTimepoint, false);
        }
        return false;
    }

    // function clear(AddressSet storage self) internal {
    //     uint256 len = length(self);
    //     for (uint256 i = 0; i < len; ++i) {
    //         delete self.positions[self.values[i].value];
    //     }
    //     AddressInner[] storage array = self.values;
    //     assembly ("memory-safe") {
    //         sstore(array.slot, len)
    //     }
    // }

    function contains(AddressSet storage self, address value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    function isIncluded(AddressSet storage self, uint48 currentTimepoint, address value) internal view returns (bool) {
        return contains(self, value) && self.values[self.positions[value] - 1].get(currentTimepoint);
    }

    function length(
        AddressSet storage self
    ) internal view returns (uint256) {
        return self.values.length;
    }

    function at(
        AddressSet storage self,
        uint48 currentTimepoint,
        uint256 index
    ) internal view returns (bool, address) {
        return (self.values[index].get(currentTimepoint), self.values[index].value);
    }

    // @dev Returns only included values
    function values(
        AddressSet storage self,
        uint48 currentTimepoint
    ) internal view returns (address[] memory values_) {
        uint256 rawLength = length(self);

        uint256 len;
        values_ = new address[](rawLength);
        for (uint256 i; i < rawLength; ++i) {
            if (self.values[i].get(currentTimepoint)) {
                values_[len++] = self.values[i].value;
            }
        }

        assembly {
            mstore(values_, len)
        }
    }
}
