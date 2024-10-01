// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

/**
 * @dev This library adds helper functions for an optimized enable/diasble time data storaging.
 */
library AddressWithTimes {
    struct Address {
        address _address;
        uint48 enabled;
        uint48 disabled;
    }

    error AlreadyAdded();
    error AlreadyEnabled();
    error NotEnabled();
    error SlashPeriodNotPassed();

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

    /**
     * @dev Enable a given key.
     */
    function enable(Address storage self) internal {
        if (self.enabled != 0 && self.disabled == 0) {
            revert AlreadyEnabled();
        }

        self.enabled = Time.timestamp();
        self.disabled = 0;
    }

    /**
     * @dev Disable a given key.
     */
    function disable(Address storage self) internal {
        if (self.enabled == 0 || self.disabled != 0) {
            revert NotEnabled();
        }

        self.disabled = Time.timestamp();
    }

    function wasActiveAt(Address storage self, uint48 timestamp) internal view returns (bool) {
        return self.enabled != 0 && self.enabled <= timestamp && (self.disabled == 0 || self.disabled >= timestamp);
    }

    function checkUnpause(Address storage self, uint48 slashingWindow) internal view {
        if (self.disabled + slashingWindow >= Time.timestamp()) {
            revert SlashPeriodNotPassed();
        }
    }

    function checkUnregister(Address storage self, uint48 slashingWindow) internal view {
        if (self.disabled == 0 || self.disabled + slashingWindow >= Time.timestamp()) {
            revert SlashPeriodNotPassed();
        }
    }
}
