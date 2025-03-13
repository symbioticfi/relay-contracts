// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title PauseableEnumerableSet
 * @notice Library for managing sets of values that can be paused and unpaused
 * @dev Provides functionality for managing sets of addresses, uint160s, bytes32s and bytes values
 *      Each value in a set has an associated status that tracks when it was enabled/disabled
 */
library PauseableEnumerableSet {
    using PauseableEnumerableSet for AddressSet;
    using PauseableEnumerableSet for Status;

    error AlreadyRegistered();
    error NotRegistered();
    error AlreadyEnabled();
    error NotEnabled();
    error Enabled();
    error ImmutablePeriodNotPassed();

    /**
     * @dev Stores the enabled and disabled timestamps for a value
     */
    struct Status {
        uint48 enabled;
        uint48 disabled;
    }

    /**
     * @dev Stores an address value and its status
     */
    struct InnerAddress {
        address value;
        Status status;
    }

    /**
     * @dev Set of address values with their statuses
     */
    struct AddressSet {
        InnerAddress[] array;
        mapping(address => uint256) positions;
    }

    /**
     * @dev Set of uint160 values, implemented using AddressSet
     */
    struct Uint160Set {
        AddressSet set;
    }

    /**
     * @notice Sets the initial status of a value
     * @param self The status to modify
     * @param timestamp The timestamp to set as enabled
     */
    function set(Status storage self, uint48 timestamp) internal {
        self.enabled = timestamp;
        self.disabled = 0;
    }

    /**
     * @notice Enables a previously disabled value
     * @param self The status to modify
     * @param timestamp The timestamp to set as enabled
     * @param immutablePeriod The required waiting period after disabling
     */
    function enable(Status storage self, uint48 timestamp, uint48 immutablePeriod) internal {
        if (self.enabled != 0) revert AlreadyEnabled();
        if (self.disabled + immutablePeriod > timestamp) revert ImmutablePeriodNotPassed();

        self.enabled = timestamp;
        self.disabled = 0;
    }

    /**
     * @notice Disables an enabled value
     * @param self The status to modify
     * @param timestamp The timestamp to set as disabled
     */
    function disable(Status storage self, uint48 timestamp) internal {
        if (self.disabled != 0) revert NotEnabled();
        self.enabled = 0;
        self.disabled = timestamp;
    }

    /**
     * @notice Validates if a value can be unregistered
     * @param self The status to check
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     */
    function validateUnregister(Status storage self, uint48 timestamp, uint48 immutablePeriod) internal view {
        if (self.enabled != 0 || self.disabled == 0) revert Enabled();
        if (self.disabled + immutablePeriod > timestamp) revert ImmutablePeriodNotPassed();
    }

    /**
     * @notice Checks if a value can be unregistered
     * @param self The status to check
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @return bool Whether the value can be unregistered
     */
    function checkUnregister(
        Status storage self,
        uint48 timestamp,
        uint48 immutablePeriod
    ) internal view returns (bool) {
        return self.enabled == 0 && self.disabled != 0 && self.disabled + immutablePeriod <= timestamp;
    }

    /**
     * @notice Checks if a value was active at a given timestamp
     * @param self The status to check
     * @param timestamp The timestamp to check
     * @return bool Whether the value was active
     */
    function wasActiveAt(Status storage self, uint48 timestamp) internal view returns (bool) {
        return self.enabled < timestamp && (self.disabled == 0 || self.disabled >= timestamp);
    }

    // AddressSet functions

    /**
     * @notice Gets the number of addresses in the set
     * @param self The AddressSet to query
     * @return uint256 The number of addresses
     */
    function length(
        AddressSet storage self
    ) internal view returns (uint256) {
        return self.array.length;
    }

    /**
     * @notice Gets the address and status at a given position
     * @param self The AddressSet to query
     * @param pos The position to query
     * @return The address, enabled timestamp, and disabled timestamp
     */
    function at(AddressSet storage self, uint256 pos) internal view returns (address, uint48, uint48) {
        InnerAddress storage element = self.array[pos];
        return (element.value, element.status.enabled, element.status.disabled);
    }

    /**
     * @notice Gets all active addresses at a given timestamp
     * @param self The AddressSet to query
     * @param timestamp The timestamp to check
     * @return array Array of active addresses
     */
    function getActive(AddressSet storage self, uint48 timestamp) internal view returns (address[] memory array) {
        uint256 arrayLen = self.array.length;
        array = new address[](arrayLen);
        uint256 len;
        for (uint256 i; i < arrayLen; ++i) {
            if (self.array[i].status.wasActiveAt(timestamp)) {
                array[len++] = self.array[i].value;
            }
        }

        assembly {
            mstore(array, len)
        }
        return array;
    }

    /**
     * @notice Checks if an address was active at a given timestamp
     * @param self The AddressSet to query
     * @param timestamp The timestamp to check
     * @param value The address to check
     * @return bool Whether the address was active
     */
    function wasActiveAt(AddressSet storage self, uint48 timestamp, address value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        return pos != 0 && self.array[pos - 1].status.wasActiveAt(timestamp);
    }

    /**
     * @notice Registers a new address
     * @param self The AddressSet to modify
     * @param timestamp The timestamp to set as enabled
     * @param value The address to register
     */
    function register(AddressSet storage self, uint48 timestamp, address value) internal {
        if (self.positions[value] != 0) revert AlreadyRegistered();

        InnerAddress storage element = self.array.push();
        element.value = value;
        element.status.set(timestamp);
        self.positions[value] = self.array.length;
    }

    /**
     * @notice Pauses an address
     * @param self The AddressSet to modify
     * @param timestamp The timestamp to set as disabled
     * @param value The address to pause
     */
    function pause(AddressSet storage self, uint48 timestamp, address value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.disable(timestamp);
    }

    /**
     * @notice Unpauses an address
     * @param self The AddressSet to modify
     * @param timestamp The timestamp to set as enabled
     * @param immutablePeriod The required waiting period after disabling
     * @param value The address to unpause
     */
    function unpause(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.enable(timestamp, immutablePeriod);
    }

    /**
     * @notice Unregisters an address
     * @param self The AddressSet to modify
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The address to unregister
     */
    function unregister(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address value) internal {
        uint256 pos = self.positions[value];
        if (pos == 0) revert NotRegistered();
        pos--;

        self.array[pos].status.validateUnregister(timestamp, immutablePeriod);

        if (self.array.length <= pos + 1) {
            delete self.positions[value];
            self.array.pop();
            return;
        }

        self.array[pos] = self.array[self.array.length - 1];
        self.array.pop();

        delete self.positions[value];
        self.positions[self.array[pos].value] = pos + 1;
    }

    /**
     * @notice Checks if an address is registered
     * @param self The AddressSet to query
     * @param value The address to check
     * @return bool Whether the address is registered
     */
    function contains(AddressSet storage self, address value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    /**
     * @notice Checks if an address can be unregistered
     * @param self The AddressSet to query
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The address to check
     * @return bool Whether the address can be unregistered
     */
    function checkUnregister(
        AddressSet storage self,
        uint48 timestamp,
        uint48 immutablePeriod,
        address value
    ) internal view returns (bool) {
        uint256 pos = self.positions[value];
        if (pos == 0) revert NotRegistered();
        pos--;
        return self.array[pos].status.checkUnregister(timestamp, immutablePeriod);
    }

    // Uint160Set functions

    /**
     * @notice Gets the number of uint160s in the set
     * @param self The Uint160Set to query
     * @return uint256 The number of uint160s
     */
    function length(
        Uint160Set storage self
    ) internal view returns (uint256) {
        return self.set.length();
    }

    /**
     * @notice Gets the uint160 and status at a given position
     * @param self The Uint160Set to query
     * @param pos The position to query
     * @return The uint160, enabled timestamp, and disabled timestamp
     */
    function at(Uint160Set storage self, uint256 pos) internal view returns (uint160, uint48, uint48) {
        (address value, uint48 enabled, uint48 disabled) = self.set.at(pos);
        return (uint160(value), enabled, disabled);
    }

    /**
     * @notice Gets all active uint160s at a given timestamp
     * @param self The Uint160Set to query
     * @param timestamp The timestamp to check
     * @return array Array of active uint160s
     */
    function getActive(Uint160Set storage self, uint48 timestamp) internal view returns (uint160[] memory array) {
        address[] memory addressArray = self.set.getActive(timestamp);
        assembly {
            array := addressArray
        }
        return array;
    }

    /**
     * @notice Checks if a uint160 was active at a given timestamp
     * @param self The Uint160Set to query
     * @param timestamp The timestamp to check
     * @param value The uint160 to check
     * @return bool Whether the uint160 was active
     */
    function wasActiveAt(Uint160Set storage self, uint48 timestamp, uint160 value) internal view returns (bool) {
        return self.set.wasActiveAt(timestamp, address(value));
    }

    /**
     * @notice Registers a new uint160
     * @param self The Uint160Set to modify
     * @param timestamp The timestamp to set as enabled
     * @param value The uint160 to register
     */
    function register(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        self.set.register(timestamp, address(value));
    }

    /**
     * @notice Pauses a uint160
     * @param self The Uint160Set to modify
     * @param timestamp The timestamp to set as disabled
     * @param value The uint160 to pause
     */
    function pause(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        self.set.pause(timestamp, address(value));
    }

    /**
     * @notice Unpauses a uint160
     * @param self The Uint160Set to modify
     * @param timestamp The timestamp to set as enabled
     * @param immutablePeriod The required waiting period after disabling
     * @param value The uint160 to unpause
     */
    function unpause(Uint160Set storage self, uint48 timestamp, uint48 immutablePeriod, uint160 value) internal {
        self.set.unpause(timestamp, immutablePeriod, address(value));
    }

    /**
     * @notice Unregisters a uint160
     * @param self The Uint160Set to modify
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The uint160 to unregister
     */
    function unregister(Uint160Set storage self, uint48 timestamp, uint48 immutablePeriod, uint160 value) internal {
        self.set.unregister(timestamp, immutablePeriod, address(value));
    }

    /**
     * @notice Checks if a uint160 is registered
     * @param self The Uint160Set to query
     * @param value The uint160 to check
     * @return bool Whether the uint160 is registered
     */
    function contains(Uint160Set storage self, uint160 value) internal view returns (bool) {
        return self.set.contains(address(value));
    }
}
