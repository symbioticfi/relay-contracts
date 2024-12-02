// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title PauseableEnumerableSet
 * @notice Library for managing sets of values that can be paused and unpaused
 * @dev Provides functionality for managing sets of addresses, uint160s, bytes32s and bytes values
 *      Each value in a set has an associated status that tracks when it was enabled/disabled
 */
library PauseableEnumerableSet {
    using PauseableEnumerableSet for Inner160;
    using PauseableEnumerableSet for Uint160Set;
    using PauseableEnumerableSet for InnerBytes32;
    using PauseableEnumerableSet for InnerBytes;
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
     * @dev Stores a uint160 value and its status
     */
    struct Inner160 {
        uint160 value;
        Status status;
    }

    /**
     * @dev Stores a bytes32 value and its status
     */
    struct InnerBytes32 {
        bytes32 value;
        Status status;
    }

    /**
     * @dev Stores a bytes value and its status
     */
    struct InnerBytes {
        bytes value;
        Status status;
    }

    /**
     * @dev Set of uint160 values with their statuses
     */
    struct Uint160Set {
        Inner160[] array;
        mapping(uint160 => uint256) positions;
    }

    /**
     * @dev Set of address values, implemented using Uint160Set
     */
    struct AddressSet {
        Uint160Set set;
    }

    /**
     * @dev Set of bytes32 values with their statuses
     */
    struct Bytes32Set {
        InnerBytes32[] array;
        mapping(bytes32 => uint256) positions;
    }

    /**
     * @dev Set of bytes values with their statuses
     */
    struct BytesSet {
        InnerBytes[] array;
        mapping(bytes => uint256) positions;
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
        return self.enabled != 0 && self.disabled == 0 && self.disabled + immutablePeriod > timestamp;
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

    /**
     * @notice Gets the value and status for an Inner160
     * @param self The Inner160 to get data from
     * @return The value, enabled timestamp, and disabled timestamp
     */
    function get(
        Inner160 storage self
    ) internal view returns (uint160, uint48, uint48) {
        return (self.value, self.status.enabled, self.status.disabled);
    }

    /**
     * @notice Gets the value and status for an InnerBytes32
     * @param self The InnerBytes32 to get data from
     * @return The value, enabled timestamp, and disabled timestamp
     */
    function get(
        InnerBytes32 storage self
    ) internal view returns (bytes32, uint48, uint48) {
        return (self.value, self.status.enabled, self.status.disabled);
    }

    /**
     * @notice Gets the value and status for an InnerBytes
     * @param self The InnerBytes to get data from
     * @return The value, enabled timestamp, and disabled timestamp
     */
    function get(
        InnerBytes storage self
    ) internal view returns (bytes memory, uint48, uint48) {
        return (self.value, self.status.enabled, self.status.disabled);
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
        return self.set.length();
    }

    /**
     * @notice Gets the address and status at a given position
     * @param self The AddressSet to query
     * @param pos The position to query
     * @return The address, enabled timestamp, and disabled timestamp
     */
    function at(AddressSet storage self, uint256 pos) internal view returns (address, uint48, uint48) {
        (uint160 value, uint48 enabled, uint48 disabled) = self.set.at(pos);
        return (address(value), enabled, disabled);
    }

    /**
     * @notice Gets all active addresses at a given timestamp
     * @param self The AddressSet to query
     * @param timestamp The timestamp to check
     * @return array Array of active addresses
     */
    function getActive(AddressSet storage self, uint48 timestamp) internal view returns (address[] memory array) {
        uint160[] memory uint160Array = self.set.getActive(timestamp);
        assembly {
            array := uint160Array
        }
        return array;
    }

    /**
     * @notice Checks if an address was active at a given timestamp
     * @param self The AddressSet to query
     * @param timestamp The timestamp to check
     * @param addr The address to check
     * @return bool Whether the address was active
     */
    function wasActiveAt(AddressSet storage self, uint48 timestamp, address addr) internal view returns (bool) {
        return self.set.wasActiveAt(timestamp, uint160(addr));
    }

    /**
     * @notice Registers a new address
     * @param self The AddressSet to modify
     * @param timestamp The timestamp to set as enabled
     * @param addr The address to register
     */
    function register(AddressSet storage self, uint48 timestamp, address addr) internal {
        self.set.register(timestamp, uint160(addr));
    }

    /**
     * @notice Pauses an address
     * @param self The AddressSet to modify
     * @param timestamp The timestamp to set as disabled
     * @param addr The address to pause
     */
    function pause(AddressSet storage self, uint48 timestamp, address addr) internal {
        self.set.pause(timestamp, uint160(addr));
    }

    /**
     * @notice Unpauses an address
     * @param self The AddressSet to modify
     * @param timestamp The timestamp to set as enabled
     * @param immutablePeriod The required waiting period after disabling
     * @param addr The address to unpause
     */
    function unpause(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address addr) internal {
        self.set.unpause(timestamp, immutablePeriod, uint160(addr));
    }

    /**
     * @notice Unregisters an address
     * @param self The AddressSet to modify
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param addr The address to unregister
     */
    function unregister(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address addr) internal {
        self.set.unregister(timestamp, immutablePeriod, uint160(addr));
    }

    /**
     * @notice Checks if an address is registered
     * @param self The AddressSet to query
     * @param addr The address to check
     * @return bool Whether the address is registered
     */
    function contains(AddressSet storage self, address addr) internal view returns (bool) {
        return self.set.contains(uint160(addr));
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
        return self.array.length;
    }

    /**
     * @notice Gets the uint160 and status at a given position
     * @param self The Uint160Set to query
     * @param pos The position to query
     * @return The uint160, enabled timestamp, and disabled timestamp
     */
    function at(Uint160Set storage self, uint256 pos) internal view returns (uint160, uint48, uint48) {
        return self.array[pos].get();
    }

    /**
     * @notice Gets all active uint160s at a given timestamp
     * @param self The Uint160Set to query
     * @param timestamp The timestamp to check
     * @return array Array of active uint160s
     */
    function getActive(Uint160Set storage self, uint48 timestamp) internal view returns (uint160[] memory array) {
        uint256 arrayLen = self.array.length;
        array = new uint160[](arrayLen);
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
     * @notice Checks if a uint160 was active at a given timestamp
     * @param self The Uint160Set to query
     * @param timestamp The timestamp to check
     * @param value The uint160 to check
     * @return bool Whether the uint160 was active
     */
    function wasActiveAt(Uint160Set storage self, uint48 timestamp, uint160 value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        return pos != 0 && self.array[pos - 1].status.wasActiveAt(timestamp);
    }

    /**
     * @notice Registers a new uint160
     * @param self The Uint160Set to modify
     * @param timestamp The timestamp to set as enabled
     * @param value The uint160 to register
     */
    function register(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        if (self.positions[value] != 0) revert AlreadyRegistered();

        Inner160 storage element = self.array.push();
        element.value = value;
        element.status.set(timestamp);
        self.positions[value] = self.array.length;
    }

    /**
     * @notice Pauses a uint160
     * @param self The Uint160Set to modify
     * @param timestamp The timestamp to set as disabled
     * @param value The uint160 to pause
     */
    function pause(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.disable(timestamp);
    }

    /**
     * @notice Unpauses a uint160
     * @param self The Uint160Set to modify
     * @param timestamp The timestamp to set as enabled
     * @param immutablePeriod The required waiting period after disabling
     * @param value The uint160 to unpause
     */
    function unpause(Uint160Set storage self, uint48 timestamp, uint48 immutablePeriod, uint160 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.enable(timestamp, immutablePeriod);
    }

    /**
     * @notice Unregisters a uint160
     * @param self The Uint160Set to modify
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The uint160 to unregister
     */
    function unregister(Uint160Set storage self, uint48 timestamp, uint48 immutablePeriod, uint160 value) internal {
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
     * @notice Checks if a uint160 is registered
     * @param self The Uint160Set to query
     * @param value The uint160 to check
     * @return bool Whether the uint160 is registered
     */
    function contains(Uint160Set storage self, uint160 value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    // Bytes32Set functions

    /**
     * @notice Gets the number of bytes32s in the set
     * @param self The Bytes32Set to query
     * @return uint256 The number of bytes32s
     */
    function length(
        Bytes32Set storage self
    ) internal view returns (uint256) {
        return self.array.length;
    }

    /**
     * @notice Gets the bytes32 and status at a given position
     * @param self The Bytes32Set to query
     * @param pos The position to query
     * @return The bytes32, enabled timestamp, and disabled timestamp
     */
    function at(Bytes32Set storage self, uint256 pos) internal view returns (bytes32, uint48, uint48) {
        return self.array[pos].get();
    }

    /**
     * @notice Gets all active bytes32s at a given timestamp
     * @param self The Bytes32Set to query
     * @param timestamp The timestamp to check
     * @return array Array of active bytes32s
     */
    function getActive(Bytes32Set storage self, uint48 timestamp) internal view returns (bytes32[] memory array) {
        uint256 arrayLen = self.array.length;
        array = new bytes32[](arrayLen);
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
     * @notice Checks if a bytes32 was active at a given timestamp
     * @param self The Bytes32Set to query
     * @param timestamp The timestamp to check
     * @param value The bytes32 to check
     * @return bool Whether the bytes32 was active
     */
    function wasActiveAt(Bytes32Set storage self, uint48 timestamp, bytes32 value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        return pos != 0 && self.array[pos - 1].status.wasActiveAt(timestamp);
    }

    /**
     * @notice Registers a new bytes32
     * @param self The Bytes32Set to modify
     * @param timestamp The timestamp to set as enabled
     * @param value The bytes32 to register
     */
    function register(Bytes32Set storage self, uint48 timestamp, bytes32 value) internal {
        if (self.positions[value] != 0) revert AlreadyRegistered();

        uint256 pos = self.array.length;
        InnerBytes32 storage element = self.array.push();
        element.value = value;
        element.status.set(timestamp);
        self.positions[value] = pos + 1;
    }

    /**
     * @notice Pauses a bytes32
     * @param self The Bytes32Set to modify
     * @param timestamp The timestamp to set as disabled
     * @param value The bytes32 to pause
     */
    function pause(Bytes32Set storage self, uint48 timestamp, bytes32 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.disable(timestamp);
    }

    /**
     * @notice Unpauses a bytes32
     * @param self The Bytes32Set to modify
     * @param timestamp The timestamp to set as enabled
     * @param immutablePeriod The required waiting period after disabling
     * @param value The bytes32 to unpause
     */
    function unpause(Bytes32Set storage self, uint48 timestamp, uint48 immutablePeriod, bytes32 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.enable(timestamp, immutablePeriod);
    }

    /**
     * @notice Checks if a bytes32 can be unregistered
     * @param self The Bytes32Set to query
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The bytes32 to check
     * @return bool Whether the bytes32 can be unregistered
     */
    function checkUnregister(
        Bytes32Set storage self,
        uint48 timestamp,
        uint48 immutablePeriod,
        bytes32 value
    ) internal view returns (bool) {
        uint256 pos = self.positions[value];
        if (pos == 0) return false;
        return self.array[pos - 1].status.checkUnregister(timestamp, immutablePeriod);
    }

    /**
     * @notice Unregisters a bytes32
     * @param self The Bytes32Set to modify
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The bytes32 to unregister
     */
    function unregister(Bytes32Set storage self, uint48 timestamp, uint48 immutablePeriod, bytes32 value) internal {
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
     * @notice Checks if a bytes32 is registered
     * @param self The Bytes32Set to query
     * @param value The bytes32 to check
     * @return bool Whether the bytes32 is registered
     */
    function contains(Bytes32Set storage self, bytes32 value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    // BytesSet functions

    /**
     * @notice Gets the number of bytes values in the set
     * @param self The BytesSet to query
     * @return uint256 The number of bytes values
     */
    function length(
        BytesSet storage self
    ) internal view returns (uint256) {
        return self.array.length;
    }

    /**
     * @notice Gets the bytes value and status at a given position
     * @param self The BytesSet to query
     * @param pos The position to query
     * @return The bytes value, enabled timestamp, and disabled timestamp
     */
    function at(BytesSet storage self, uint256 pos) internal view returns (bytes memory, uint48, uint48) {
        return self.array[pos].get();
    }

    /**
     * @notice Gets all active bytes values at a given timestamp
     * @param self The BytesSet to query
     * @param timestamp The timestamp to check
     * @return array Array of active bytes values
     */
    function getActive(BytesSet storage self, uint48 timestamp) internal view returns (bytes[] memory array) {
        uint256 arrayLen = self.array.length;
        array = new bytes[](arrayLen);
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
     * @notice Checks if a bytes value was active at a given timestamp
     * @param self The BytesSet to query
     * @param timestamp The timestamp to check
     * @param value The bytes value to check
     * @return bool Whether the bytes value was active
     */
    function wasActiveAt(BytesSet storage self, uint48 timestamp, bytes memory value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        return pos != 0 && self.array[pos - 1].status.wasActiveAt(timestamp);
    }

    /**
     * @notice Registers a new bytes value
     * @param self The BytesSet to modify
     * @param timestamp The timestamp to set as enabled
     * @param value The bytes value to register
     */
    function register(BytesSet storage self, uint48 timestamp, bytes memory value) internal {
        if (self.positions[value] != 0) revert AlreadyRegistered();

        uint256 pos = self.array.length;
        InnerBytes storage element = self.array.push();
        element.value = value;
        element.status.set(timestamp);
        self.positions[value] = pos + 1;
    }

    /**
     * @notice Pauses a bytes value
     * @param self The BytesSet to modify
     * @param timestamp The timestamp to set as disabled
     * @param value The bytes value to pause
     */
    function pause(BytesSet storage self, uint48 timestamp, bytes memory value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.disable(timestamp);
    }

    /**
     * @notice Unpauses a bytes value
     * @param self The BytesSet to modify
     * @param timestamp The timestamp to set as enabled
     * @param immutablePeriod The required waiting period after disabling
     * @param value The bytes value to unpause
     */
    function unpause(BytesSet storage self, uint48 timestamp, uint48 immutablePeriod, bytes memory value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.enable(timestamp, immutablePeriod);
    }

    /**
     * @notice Checks if a bytes value can be unregistered
     * @param self The BytesSet to query
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The bytes value to check
     * @return bool Whether the bytes value can be unregistered
     */
    function checkUnregister(
        BytesSet storage self,
        uint48 timestamp,
        uint48 immutablePeriod,
        bytes memory value
    ) internal view returns (bool) {
        uint256 pos = self.positions[value];
        if (pos == 0) return false;
        return self.array[pos - 1].status.checkUnregister(timestamp, immutablePeriod);
    }

    /**
     * @notice Unregisters a bytes value
     * @param self The BytesSet to modify
     * @param timestamp The current timestamp
     * @param immutablePeriod The required waiting period after disabling
     * @param value The bytes value to unregister
     */
    function unregister(BytesSet storage self, uint48 timestamp, uint48 immutablePeriod, bytes memory value) internal {
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
     * @notice Checks if a bytes value is registered
     * @param self The BytesSet to query
     * @param value The bytes value to check
     * @return bool Whether the bytes value is registered
     */
    function contains(BytesSet storage self, bytes memory value) internal view returns (bool) {
        return self.positions[value] != 0;
    }
}
