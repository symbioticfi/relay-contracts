// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library PauseableEnumerableSet {
    using PauseableEnumerableSet for Inner;
    using PauseableEnumerableSet for Uint160Set;
    using PauseableEnumerableSet for Inner256;
    using PauseableEnumerableSet for Uint256Set;

    // Custom error messages
    error AlreadyRegistered(); // Thrown when trying to register an already registered value.
    error NotRegistered(); // Thrown when trying to modify a value that's not registered.
    error AlreadyEnabled(); // Thrown when enabling an already enabled value.
    error NotEnabled(); // Thrown when disabling a value that's not enabled.
    error Enabled(); // Thrown when trying to disable a value that's enabled.
    error ImmutablePeriodNotPassed(); // Thrown when an action is attempted before immutable period passes.

    /* 
     * Struct for managing a set of Uint160 values.
     */
    struct Uint160Set {
        Inner[] array;
        mapping(uint160 => uint256) positions; // Maps value to its index + 1.
    }

    /* 
     * Struct for managing a set of addresses.
     */
    struct AddressSet {
        Uint160Set set;
    }

    /* 
     * Struct for managing value and its active status.
     */
    struct Inner {
        uint160 value; // The actual value.
        uint48 enabledTimestamp; // Timestamp when the value was enabled.
        uint48 disabledTimestamp; // Timestamp when the value was disabled.
    }

    /* 
     * @notice Returns the length of the AddressSet.
     * @param self The AddressSet storage.
     * @return The number of elements in the set.
     */
    function length(AddressSet storage self) internal view returns (uint256) {
        return self.set.length();
    }

    /* 
     * @notice Returns the address and its active period at a given position in the AddressSet.
     * @param self The AddressSet storage.
     * @param pos The position in the set.
     * @return The address, enabled timestamp and disabled timestamp at the position.
     */
    function at(AddressSet storage self, uint256 pos) internal view returns (address, uint48, uint48) {
        (uint160 value, uint48 enabledTimestamp, uint48 disabledTimestamp) = self.set.at(pos);
        return (address(value), enabledTimestamp, disabledTimestamp);
    }

    /* 
     * @notice Retrieves all active addresses at a given timestamp.
     * @param self The AddressSet storage.
     * @param timestamp The timestamp to check.
     * @return An array of active addresses.
     */
    function getActive(AddressSet storage self, uint48 timestamp) internal view returns (address[] memory array) {
        uint160[] memory uint160Array = self.set.getActive(timestamp);

        assembly {
            array := uint160Array
        }

        return array;
    }

    /* 
     * @notice Checks if a given addr was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param addr The address to check.
     * @return A boolean indicating whether the addr was active at the specified timestamp.
     */
    function wasActiveAt(AddressSet storage self, uint48 timestamp, address addr) internal view returns (bool) {
        return self.set.wasActiveAt(timestamp, uint160(addr));
    }

    /* 
     * @notice Registers a new address at a given timestamp.
     * @param self The AddressSet storage.
     * @param timestamp The timestamp when the address is added.
     * @param addr The address to register.
     */
    function register(AddressSet storage self, uint48 timestamp, address addr) internal {
        self.set.register(timestamp, uint160(addr));
    }

    /* 
     * @notice Pauses an address at a given timestamp.
     * @param self The AddressSet storage.
     * @param timestamp The timestamp when the address is paused.
     * @param addr The address to pause.
     */
    function pause(AddressSet storage self, uint48 timestamp, address addr) internal {
        self.set.pause(timestamp, uint160(addr));
    }

    /* 
     * @notice Unpauses an address, re-enabling it after the immutable period.
     * @param self The AddressSet storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unpausing.
     * @param addr The address to unpause.
     */
    function unpause(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address addr) internal {
        self.set.unpause(timestamp, immutablePeriod, uint160(addr));
    }

    /* 
     * @notice Unregisters an address, removing it from the set.
     * @param self The AddressSet storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unregistering.
     * @param addr The address to unregister.
     */
    function unregister(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address addr) internal {
        self.set.unregister(timestamp, immutablePeriod, uint160(addr));
    }

    /* 
     * @notice Checks if an address is contained in the AddressSet.
     * @param self The AddressSet storage.
     * @param addr The address to check.
     * @return True if the address is in the set, false otherwise.
     */
    function contains(AddressSet storage self, address addr) internal view returns (bool) {
        return self.set.contains(uint160(addr));
    }

    /* 
     * @notice Returns the number of elements in the Uint160Set.
     * @param self The Uint160Set storage.
     * @return The number of elements.
     */
    function length(Uint160Set storage self) internal view returns (uint256) {
        return self.array.length;
    }

    /* 
     * @notice Returns the value and its active period at a given position in the Uint160Set.
     * @param self The Uint160Set storage.
     * @param pos The position in the set.
     * @return The value, enabled timestamp and disabled timestamp at the position.
     */
    function at(Uint160Set storage self, uint256 pos) internal view returns (uint160, uint48, uint48) {
        return self.array[pos].get();
    }

    /* 
     * @notice Retrieves all active values at a given timestamp.
     * @param self The Uint160Set storage.
     * @param timestamp The timestamp to check.
     * @return An array of active values.
     */
    function getActive(Uint160Set storage self, uint48 timestamp) internal view returns (uint160[] memory) {
        uint160[] memory array = new uint160[](self.array.length);
        uint256 len = 0;
        for (uint256 i; i < self.array.length; ++i) {
            if (!self.array[i].wasActiveAt(timestamp)) {
                continue;
            }
            array[len++] = self.array[i].value;
        }

        assembly {
            mstore(array, len)
        }

        return array;
    }

    /* 
     * @notice Checks if a given value was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param value The value to check.
     * @return A boolean indicating whether the value was active at the specified timestamp.
     */
    function wasActiveAt(Uint160Set storage self, uint48 timestamp, uint160 value) internal view returns (bool) {
        if (self.positions[value] == 0) {
            return false;
        }

        return self.array[self.positions[value] - 1].wasActiveAt(timestamp);
    }

    /* 
     * @notice Registers a new Uint160 value at a given timestamp.
     * @param self The Uint160Set storage.
     * @param timestamp The timestamp when the value is added.
     * @param value The Uint160 value to register.
     */
    function register(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        if (self.positions[value] != 0) {
            revert AlreadyRegistered();
        }

        uint256 pos = self.array.length;
        Inner storage element = self.array.push();
        element.set(timestamp, value);
        self.positions[value] = pos + 1;
    }

    /* 
     * @notice Pauses a Uint160 value at a given timestamp.
     * @param self The Uint160Set storage.
     * @param timestamp The timestamp when the value is paused.
     * @param value The Uint160 value to pause.
     */
    function pause(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].disable(timestamp);
    }

    /* 
     * @notice Unpauses a Uint160 value after the immutable period.
     * @param self The Uint160Set storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unpausing.
     * @param value The Uint160 value to unpause.
     */
    function unpause(Uint160Set storage self, uint48 timestamp, uint48 immutablePeriod, uint160 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].validateUnpause(timestamp, immutablePeriod);
        self.array[self.positions[value] - 1].enable(timestamp);
    }

    /* 
     * @notice Unregisters a Uint160 value from the set.
     * @param self The Uint160Set storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unregistering.
     * @param value The Uint160 value to unregister.
     */
    function unregister(Uint160Set storage self, uint48 timestamp, uint48 immutablePeriod, uint160 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        uint256 pos = self.positions[value] - 1;
        self.array[pos].validateUnregister(timestamp, immutablePeriod);

        if (self.array.length == 1 || self.array.length == pos + 1) {
            delete self.positions[value];
            self.array.pop();
            return;
        }

        self.array[pos] = self.array[self.array.length - 1];
        self.array.pop();

        delete self.positions[value];
        self.positions[self.array[pos].value] = pos + 1;
    }

    /* 
     * @notice Checks if a Uint160 value is contained in the Uint160Set.
     * @param self The Uint160Set storage.
     * @param value The Uint160 value to check.
     * @return True if the value is in the set, false otherwise.
     */
    function contains(Uint160Set storage self, uint160 value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    /* 
     * @notice Returns the address stored in the Inner struct.
     * @param self The Inner struct
     * @return The stored Uint160 as address
    */
    function getAddress(Inner storage self) internal view returns (address) {
        return address(self.value);
    }

    /* 
    * @notice Returns the value and its active period from the Inner struct.
    * @param self The Inner struct.
    * @return The value, enabled timestamp and disabled timestamp.
    */
    function get(Inner storage self) internal view returns (uint160, uint48, uint48) {
        return (self.value, self.enabledTimestamp, self.disabledTimestamp);
    }

    /* 
    * @notice Sets the value and marks it as enabled at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the value is set.
    * @param value The Uint160 value to store.
    */
    function set(Inner storage self, uint48 timestamp, uint160 value) internal {
        self.value = value;
        self.enabledTimestamp = timestamp;
        self.disabledTimestamp = 0;
    }

    /* 
    * @notice Sets the address and marks it as enabled at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the address is set.
    * @param addr The address to store.
    */
    function set(Inner storage self, uint48 timestamp, address addr) internal {
        self.value = uint160(addr);
        self.enabledTimestamp = timestamp;
        self.disabledTimestamp = 0;
    }

    /* 
    * @notice Enables the value at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the value is enabled.
    */
    function enable(Inner storage self, uint48 timestamp) internal {
        if (self.enabledTimestamp != 0) {
            revert AlreadyEnabled();
        }

        self.enabledTimestamp = timestamp;
        self.disabledTimestamp = 0;
    }

    /* 
    * @notice Disables the value at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the value is disabled.
    */
    function disable(Inner storage self, uint48 timestamp) internal {
        if (self.disabledTimestamp != 0) {
            revert NotEnabled();
        }
        if (self.enabledTimestamp == 0) {
            revert NotEnabled();
        }

        self.disabledTimestamp = timestamp;
        self.enabledTimestamp = 0;
    }

    /* 
    * @notice Checks if the value was active at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp to check.
    * @return True if the value was active at the timestamp, false otherwise.
    */
    function wasActiveAt(Inner storage self, uint48 timestamp) internal view returns (bool) {
        return
            self.enabledTimestamp < timestamp && (self.disabledTimestamp == 0 || self.disabledTimestamp >= timestamp);
    }

    /* 
    * @notice Validates whether the value can be unpaused at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The current timestamp.
    * @param immutablePeriod The immutable period that must pass before unpausing.
    */
    function validateUnpause(Inner storage self, uint48 timestamp, uint48 immutablePeriod) internal view {
        if (self.disabledTimestamp + immutablePeriod > timestamp) {
            revert ImmutablePeriodNotPassed();
        }
    }

    /* 
    * @notice Validates whether the value can be unregistered at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The current timestamp.
    * @param immutablePeriod The immutable period that must pass before unregistering.
    */
    function validateUnregister(Inner storage self, uint48 timestamp, uint48 immutablePeriod) internal view {
        if (self.enabledTimestamp != 0 || self.disabledTimestamp == 0) {
            revert Enabled();
        }

        if (self.disabledTimestamp + immutablePeriod > timestamp) {
            revert ImmutablePeriodNotPassed();
        }
    }

    /* 
     * Struct for managing a set of Uint160 values.
     */
    struct Uint256Set {
        Inner256[] array;
        mapping(uint256 => uint256) positions; // Maps value to its index + 1.
    }

    /* 
     * Struct for managing a set of addresses.
     */
    struct Bytes32Set {
        Uint256Set set;
    }

    /* 
     * Struct for managing value and its active status.
     */
    struct Inner256 {
        uint256 value; // The actual value.
        uint48 enabledTimestamp; // Timestamp when the value was enabled.
        uint48 disabledTimestamp; // Timestamp when the value was disabled.
    }

    /* 
     * @notice Returns the length of the AddressSet.
     * @param self The AddressSet storage.
     * @return The number of elements in the set.
     */
    function length(Bytes32Set storage self) internal view returns (uint256) {
        return self.set.length();
    }

    /* 
     * @notice Returns the address and its active period at a given position in the AddressSet.
     * @param self The AddressSet storage.
     * @param pos The position in the set.
     * @return The address, enabled timestamp and disabled timestamp at the position.
     */
    function at(Bytes32Set storage self, uint256 pos) internal view returns (bytes32, uint48, uint48) {
        (uint256 value, uint48 enabledTimestamp, uint48 disabledTimestamp) = self.set.at(pos);
        return (bytes32(value), enabledTimestamp, disabledTimestamp);
    }

    /* 
     * @notice Retrieves all active addresses at a given timestamp.
     * @param self The AddressSet storage.
     * @param timestamp The timestamp to check.
     * @return An array of active addresses.
     */
    function getActive(Bytes32Set storage self, uint48 timestamp) internal view returns (bytes32[] memory array) {
        uint256[] memory uint256Array = self.set.getActive(timestamp);

        assembly {
            array := uint256Array
        }

        return array;
    }

    /* 
     * @notice Checks if a given addr was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param addr The address to check.
     * @return A boolean indicating whether the addr was active at the specified timestamp.
     */
    function wasActiveAt(Bytes32Set storage self, uint48 timestamp, bytes32 key) internal view returns (bool) {
        return self.set.wasActiveAt(timestamp, uint256(key));
    }

    /* 
     * @notice Registers a new address at a given timestamp.
     * @param self The AddressSet storage.
     * @param timestamp The timestamp when the address is added.
     * @param addr The address to register.
     */
    function register(Bytes32Set storage self, uint48 timestamp, bytes32 key) internal {
        self.set.register(timestamp, uint256(key));
    }

    /* 
     * @notice Pauses an address at a given timestamp.
     * @param self The AddressSet storage.
     * @param timestamp The timestamp when the address is paused.
     * @param addr The address to pause.
     */
    function pause(Bytes32Set storage self, uint48 timestamp, bytes32 key) internal {
        self.set.pause(timestamp, uint256(key));
    }

    /* 
     * @notice Unpauses an address, re-enabling it after the immutable period.
     * @param self The AddressSet storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unpausing.
     * @param addr The address to unpause.
     */
    function unpause(Bytes32Set storage self, uint48 timestamp, uint48 immutablePeriod, bytes32 key) internal {
        self.set.unpause(timestamp, immutablePeriod, uint256(key));
    }

    /* 
     * @notice Unregisters an address, removing it from the set.
     * @param self The AddressSet storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unregistering.
     * @param addr The address to unregister.
     */
    function unregister(Bytes32Set storage self, uint48 timestamp, uint48 immutablePeriod, bytes32 key) internal {
        self.set.unregister(timestamp, immutablePeriod, uint256(key));
    }

    /* 
     * @notice Prunes the set by removing disabled values that have passed the immutable period.
     * @param self The AddressSet storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The immutable period that must pass before unregistering.
     */
    function prune(Bytes32Set storage self, uint48 timestamp, uint48 immutablePeriod) internal {
        self.set.prune(timestamp, immutablePeriod);
    }

    /* 
     * @notice Checks if an address is contained in the AddressSet.
     * @param self The AddressSet storage.
     * @param addr The address to check.
     * @return True if the address is in the set, false otherwise.
     */
    function contains(Bytes32Set storage self, bytes32 key) internal view returns (bool) {
        return self.set.contains(uint256(key));
    }

    /* 
     * @notice Returns the number of elements in the Uint160Set.
     * @param self The Uint160Set storage.
     * @return The number of elements.
     */
    function length(Uint256Set storage self) internal view returns (uint256) {
        return self.array.length;
    }

    /* 
     * @notice Returns the value and its active period at a given position in the Uint160Set.
     * @param self The Uint160Set storage.
     * @param pos The position in the set.
     * @return The value, enabled timestamp and disabled timestamp at the position.
     */
    function at(Uint256Set storage self, uint256 pos) internal view returns (uint256, uint48, uint48) {
        return self.array[pos].get();
    }

    /* 
     * @notice Retrieves all active values at a given timestamp.
     * @param self The Uint160Set storage.
     * @param timestamp The timestamp to check.
     * @return An array of active values.
     */
    function getActive(Uint256Set storage self, uint48 timestamp) internal view returns (uint256[] memory) {
        uint256[] memory array = new uint256[](self.array.length);
        uint256 len = 0;
        for (uint256 i; i < self.array.length; ++i) {
            if (!self.array[i].wasActiveAt(timestamp)) {
                continue;
            }
            array[len++] = self.array[i].value;
        }

        assembly {
            mstore(array, len)
        }

        return array;
    }

    /* 
     * @notice Checks if a given value was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param value The value to check.
     * @return A boolean indicating whether the value was active at the specified timestamp.
     */
    function wasActiveAt(Uint256Set storage self, uint48 timestamp, uint256 value) internal view returns (bool) {
        if (self.positions[value] == 0) {
            return false;
        }

        return self.array[self.positions[value] - 1].wasActiveAt(timestamp);
    }

    /* 
     * @notice Registers a new Uint160 value at a given timestamp.
     * @param self The Uint160Set storage.
     * @param timestamp The timestamp when the value is added.
     * @param value The Uint160 value to register.
     */
    function register(Uint256Set storage self, uint48 timestamp, uint256 value) internal {
        if (self.positions[value] != 0) {
            revert AlreadyRegistered();
        }

        uint256 pos = self.array.length;
        Inner256 storage element = self.array.push();
        element.set(timestamp, value);
        self.positions[value] = pos + 1;
    }

    /* 
     * @notice Pauses a Uint160 value at a given timestamp.
     * @param self The Uint160Set storage.
     * @param timestamp The timestamp when the value is paused.
     * @param value The Uint160 value to pause.
     */
    function pause(Uint256Set storage self, uint48 timestamp, uint256 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].disable(timestamp);
    }

    /* 
     * @notice Unpauses a Uint160 value after the immutable period.
     * @param self The Uint160Set storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unpausing.
     * @param value The Uint160 value to unpause.
     */
    function unpause(Uint256Set storage self, uint48 timestamp, uint48 immutablePeriod, uint256 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].validateUnpause(timestamp, immutablePeriod);
        self.array[self.positions[value] - 1].enable(timestamp);
    }

    /* 
     * @notice Unregisters a Uint160 value from the set.
     * @param self The Uint160Set storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The required immutable period before unregistering.
     * @param value The Uint160 value to unregister.
     */
    function unregister(Uint256Set storage self, uint48 timestamp, uint48 immutablePeriod, uint256 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        uint256 pos = self.positions[value] - 1;
        self.array[pos].validateUnregister(timestamp, immutablePeriod);

        if (self.array.length == 1 || self.array.length == pos + 1) {
            delete self.positions[value];
            self.array.pop();
            return;
        }

        self.array[pos] = self.array[self.array.length - 1];
        self.array.pop();

        delete self.positions[value];
        self.positions[self.array[pos].value] = pos + 1;
    }

    /* 
     * @notice Prunes the set by removing disabled values that have passed the immutable period.
     * @param self The Uint160Set storage.
     * @param timestamp The current timestamp.
     * @param immutablePeriod The immutable period that must pass before unregistering.
     */
    function prune(Uint256Set storage self, uint48 timestamp, uint48 immutablePeriod) internal {
        // Start from end to avoid shifting elements during unregister
        for (uint256 i = self.array.length; i > 0;) {
            unchecked {
                --i;
            }

            if (!self.array[i].checkUnregister(timestamp, immutablePeriod)) {
                continue;
            }

            self.unregister(timestamp, immutablePeriod, self.array[i].value);
        }
    }

    /* 
     * @notice Checks if a Uint160 value is contained in the Uint160Set.
     * @param self The Uint160Set storage.
     * @param value The Uint160 value to check.
     * @return True if the value is in the set, false otherwise.
     */
    function contains(Uint256Set storage self, uint256 value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    /* 
     * @notice Returns the address stored in the Inner struct.
     * @param self The Inner struct
    * @return The stored Uint160 as address
    */
    function getBytes32(Inner256 storage self) internal view returns (bytes32) {
        return bytes32(self.value);
    }

    /* 
    * @notice Returns the value and its active period from the Inner struct.
    * @param self The Inner struct.
    * @return The value, enabled timestamp and disabled timestamp.
    */
    function get(Inner256 storage self) internal view returns (uint256, uint48, uint48) {
        return (self.value, self.enabledTimestamp, self.disabledTimestamp);
    }

    /* 
    * @notice Sets the value and marks it as enabled at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the value is set.
    * @param value The Uint160 value to store.
    */
    function set(Inner256 storage self, uint48 timestamp, uint256 value) internal {
        self.value = value;
        self.enabledTimestamp = timestamp;
        self.disabledTimestamp = 0;
    }

    /* 
    * @notice Sets the address and marks it as enabled at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the address is set.
    * @param addr The address to store.
    */
    function set(Inner256 storage self, uint48 timestamp, bytes32 key) internal {
        self.value = uint256(key);
        self.enabledTimestamp = timestamp;
        self.disabledTimestamp = 0;
    }

    /* 
    * @notice Enables the value at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the value is enabled.
    */
    function enable(Inner256 storage self, uint48 timestamp) internal {
        if (self.enabledTimestamp != 0) {
            revert AlreadyEnabled();
        }

        self.enabledTimestamp = timestamp;
        self.disabledTimestamp = 0;
    }

    /* 
    * @notice Disables the value at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp when the value is disabled.
    */
    function disable(Inner256 storage self, uint48 timestamp) internal {
        if (self.disabledTimestamp != 0) {
            revert NotEnabled();
        }
        self.enabledTimestamp = 0;
        self.disabledTimestamp = timestamp;
    }

    /* 
    * @notice Checks if the value was active at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The timestamp to check.
    * @return True if the value was active at the timestamp, false otherwise.
    */
    function wasActiveAt(Inner256 storage self, uint48 timestamp) internal view returns (bool) {
        return
            self.enabledTimestamp < timestamp && (self.disabledTimestamp == 0 || self.disabledTimestamp >= timestamp);
    }

    /* 
    * @notice Validates whether the value can be unpaused at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The current timestamp.
    * @param immutablePeriod The immutable period that must pass before unpausing.
    */
    function validateUnpause(Inner256 storage self, uint48 timestamp, uint48 immutablePeriod) internal view {
        if (self.disabledTimestamp + immutablePeriod > timestamp) {
            revert ImmutablePeriodNotPassed();
        }
    }

    /* 
    * @notice Validates whether the value can be unregistered at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The current timestamp.
    * @param immutablePeriod The immutable period that must pass before unregistering.
    */
    function validateUnregister(Inner256 storage self, uint48 timestamp, uint48 immutablePeriod) internal view {
        if (self.enabledTimestamp != 0 || self.disabledTimestamp == 0) {
            revert Enabled();
        }

        if (self.disabledTimestamp + immutablePeriod > timestamp) {
            revert ImmutablePeriodNotPassed();
        }
    }

    /* 
    * @notice Checks if the value can be unregistered at a given timestamp.
    * @param self The Inner struct.
    * @param timestamp The current timestamp.
    * @param immutablePeriod The immutable period that must pass before unregistering.
    * @return True if the value can be unregistered, false otherwise.
    */
    function checkUnregister(Inner256 storage self, uint48 timestamp, uint48 immutablePeriod)
        internal
        view
        returns (bool)
    {
        if (self.enabledTimestamp != 0 || self.disabledTimestamp == 0) {
            return false;
        }

        if (self.disabledTimestamp + immutablePeriod > timestamp) {
            return false;
        }

        return true;
    }
}
