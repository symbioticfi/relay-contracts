// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library EnumerableSetWithTimeData {
    using EnumerableSetWithTimeData for Inner;
    using EnumerableSetWithTimeData for Uint160Set;

    struct Uint160Set {
        Inner[] array;
        mapping(uint160 => uint256) positions;
    }

    struct AddressSet {
        Uint160Set set;
    }

    struct Inner {
        uint160 value;
        uint48 enabled;
        uint48 disabled;
    }

    error AlreadyRegistered();
    error NotRegistered();
    error AlreadyEnabled();
    error NotEnabled();
    error ImmutablePeriodNotPassed();

    function length(AddressSet storage self) internal view returns (uint256) {
        return self.set.length();
    }

    function at(AddressSet storage self, uint256 pos) internal view returns (address, uint48, uint48) {
        (uint160 value, uint48 enabled, uint48 disabled) = self.set.at(pos);
        return (address(value), enabled, disabled);
    }

    function getActive(AddressSet storage self, uint48 timestamp) internal view returns (address[] memory array) {
        uint160[] memory uint160Array = self.set.getActive(timestamp);

        assembly ("memory-safe") {
            array := uint160Array
        }

        return array;
    }

    function register(AddressSet storage self, address addr) internal {
        self.set.register(uint160(addr));
    }

    function pause(AddressSet storage self, address addr) internal {
        self.set.pause(uint160(addr));
    }

    function unpause(AddressSet storage self, address addr, uint48 immutablePeriod) internal {
        self.set.unpause(uint160(addr), immutablePeriod);
    }

    function unregister(AddressSet storage self, address addr, uint48 immutablePeriod) internal {
        self.set.unregister(uint160(addr), immutablePeriod);
    }

    function contains(AddressSet storage self, address addr) internal view returns (bool) {
        return self.set.contains(uint160(addr));
    }

    function length(Uint160Set storage self) internal view returns (uint256) {
        return self.array.length;
    }

    function at(Uint160Set storage self, uint256 pos) internal view returns (uint160, uint48, uint48) {
        return self.array[pos].get();
    }

    function getActive(Uint160Set storage self, uint48 timestamp) internal view returns (uint160[] memory) {
        uint160[] memory array = new uint160[](self.array.length);
        uint256 len = 0;
        for (uint256 i; i < self.array.length; ++i) {
            if (!self.array[i].wasActiveAt(timestamp)) {
                continue;
            }

            array[len++] = self.array[i].getValue();
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(array, len)
        }

        return array;
    }

    function register(Uint160Set storage self, uint160 value) internal {
        if (self.positions[value] != 0) {
            revert AlreadyRegistered();
        }

        uint256 pos = self.array.length;
        Inner storage element = self.array.push();
        element.set(value);
        self.positions[value] = pos + 1;
    }

    function pause(Uint160Set storage self, uint160 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].disable();
    }

    function unpause(Uint160Set storage self, uint160 value, uint48 immutablePeriod) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].validateUnpause(immutablePeriod);
        self.array[self.positions[value] - 1].enable();
    }

    function unregister(Uint160Set storage self, uint160 value, uint48 immutablePeriod) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        uint256 pos = self.positions[value] - 1;
        self.array[pos].validateUnregister(immutablePeriod);
        self.array[pos] = self.array[self.array.length - 1];
        self.array.pop();

        delete self.positions[value];
        self.positions[self.array[pos].getValue()] = pos + 1;
    }

    function contains(Uint160Set storage self, uint160 value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    function getValue(Inner storage self) internal view returns (uint160) {
        return self.value;
    }

    function getAddress(Inner storage self) internal view returns (address) {
        return address(self.value);
    }

    function get(Inner storage self) internal view returns (uint160, uint48, uint48) {
        return (self.value, self.enabled, self.disabled);
    }

    function set(Inner storage self, uint160 value) internal {
        self.value = value;
        self.enabled = Time.timestamp();
        self.disabled = 0;
    }

    function set(Inner storage self, address addr) internal {
        self.value = uint160(addr);
        self.enabled = Time.timestamp();
        self.disabled = 0;
    }

    function enable(Inner storage self) internal {
        if (self.enabled != 0 && self.disabled == 0) {
            revert AlreadyEnabled();
        }

        self.enabled = Time.timestamp();
        self.disabled = 0;
    }

    function disable(Inner storage self) internal {
        if (self.enabled == 0 || self.disabled != 0) {
            revert NotEnabled();
        }

        self.disabled = Time.timestamp();
    }

    function wasActiveAt(Inner storage self, uint48 timestamp) internal view returns (bool) {
        return self.enabled != 0 && self.enabled < timestamp && (self.disabled == 0 || self.disabled >= timestamp);
    }

    function validateUnpause(Inner storage self, uint48 slashingWindow) internal view {
        if (self.disabled + slashingWindow >= Time.timestamp()) {
            revert ImmutablePeriodNotPassed();
        }
    }

    function validateUnregister(Inner storage self, uint48 slashingWindow) internal view {
        if (self.disabled == 0 || self.disabled + slashingWindow >= Time.timestamp()) {
            revert ImmutablePeriodNotPassed();
        }
    }
}
