// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library ArrayWithTimes {
    using ArrayWithTimes for Address;

    struct AddressArray {
        Address[] array;
        mapping(address => uint256) positions;
    }

    struct Address {
        address _address;
        uint48 enabled;
        uint48 disabled;
    }

    error AlreadyRegistered();
    error NotRegistered();
    error AlreadyEnabled();
    error NotEnabled();
    error ImmutablePeriodNotPassed();

    function length(AddressArray storage self) internal view returns (uint256) {
        return self.array.length;
    }

    function at(AddressArray storage self, uint256 pos) internal view returns (address, uint48, uint48) {
        return self.array[pos].get();
    }

    function getActive(AddressArray storage self, uint48 timestamp) internal view returns (address[] memory) {
        address[] memory array = new address[](self.array.length);
        uint256 len = 0;
        for (uint256 i; i < self.array.length; ++i) {
            if (!self.array[i].wasActiveAt(timestamp)) {
                continue;
            }

            array[len++] = self.array[i].getAddress();
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(array, len)
        }

        return array;
    }

    function register(AddressArray storage self, address addr) internal {
        if (self.positions[addr] != 0) {
            revert AlreadyRegistered();
        }

        uint256 pos = self.array.length;
        self.array.push();
        self.array[pos].set(addr);
        self.positions[addr] = pos + 1;
    }

    function pause(AddressArray storage self, address addr) internal {
        if (self.positions[addr] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[addr] - 1].disable();
    }

    function unpause(AddressArray storage self, address addr, uint48 immutablePeriod) internal {
        if (self.positions[addr] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[addr] - 1].validateUnpause(immutablePeriod);
        self.array[self.positions[addr] - 1].enable();
    }

    function unregister(AddressArray storage self, address addr, uint48 immutablePeriod) internal {
        if (self.positions[addr] == 0) {
            revert NotRegistered();
        }

        uint256 pos = self.positions[addr] - 1;
        self.array[pos].validateUnregister(immutablePeriod);
        self.array[pos] = self.array[self.array.length - 1];
        self.array.pop();

        delete self.positions[addr];
        self.positions[self.array[pos].getAddress()] = pos + 1;
    }

    function contains(AddressArray storage self, address addr) internal view returns (bool) {
        return self.positions[addr] == 0;
    }

    function getAddress(Address storage self) internal view returns (address) {
        return self._address;
    }

    function get(Address storage self) internal view returns (address, uint48, uint48) {
        return (self._address, self.enabled, self.disabled);
    }

    function set(Address storage self, address _address) internal {
        self._address = _address;
        self.enabled = Time.timestamp();
        self.disabled = 0;
    }

    function enable(Address storage self) internal {
        if (self.enabled != 0 && self.disabled == 0) {
            revert AlreadyEnabled();
        }

        self.enabled = Time.timestamp();
        self.disabled = 0;
    }

    function disable(Address storage self) internal {
        if (self.enabled == 0 || self.disabled != 0) {
            revert NotEnabled();
        }

        self.disabled = Time.timestamp();
    }

    function wasActiveAt(Address storage self, uint48 timestamp) internal view returns (bool) {
        return self.enabled != 0 && self.enabled <= timestamp && (self.disabled == 0 || self.disabled >= timestamp);
    }

    function validateUnpause(Address storage self, uint48 slashingWindow) internal view {
        if (self.disabled + slashingWindow >= Time.timestamp()) {
            revert ImmutablePeriodNotPassed();
        }
    }

    function validateUnregister(Address storage self, uint48 slashingWindow) internal view {
        if (self.disabled == 0 || self.disabled + slashingWindow >= Time.timestamp()) {
            revert ImmutablePeriodNotPassed();
        }
    }
}
