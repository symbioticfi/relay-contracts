// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library PauseableEnumerableSet {
    using PauseableEnumerableSet for Inner;
    using PauseableEnumerableSet for Uint160Set;

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
        uint48 enabledEpoch; // Epoch when the value was enabled.
        uint48 disabledEpoch; // Epoch when the value was disabled.
    }

    // Custom error messages
    error AlreadyRegistered(); // Thrown when trying to register an already registered value.
    error NotRegistered(); // Thrown when trying to modify a value that's not registered.
    error AlreadyEnabled(); // Thrown when enabling an already enabled value.
    error NotEnabled(); // Thrown when disabling a value that's not enabled.
    error ImmutablePeriodNotPassed(); // Thrown when an action is attempted before immutable period passes.

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
     * @return The address, enabled epoch, and disabled epoch at the position.
     */
    function at(AddressSet storage self, uint256 pos) internal view returns (address, uint48, uint48) {
        (uint160 value, uint48 enabledEpoch, uint48 disabledEpoch) = self.set.at(pos);
        return (address(value), enabledEpoch, disabledEpoch);
    }

    /* 
     * @notice Retrieves all active addresses at a given epoch.
     * @param self The AddressSet storage.
     * @param epoch The epoch to check.
     * @return An array of active addresses.
     */
    function getActive(AddressSet storage self, uint48 epoch) internal view returns (address[] memory array) {
        uint160[] memory uint160Array = self.set.getActive(epoch);

        assembly ("memory-safe") {
            array := uint160Array
        }

        return array;
    }

    /* 
     * @notice Registers a new address at a given epoch.
     * @param self The AddressSet storage.
     * @param epoch The epoch when the address is added.
     * @param addr The address to register.
     */
    function register(AddressSet storage self, uint48 epoch, address addr) internal {
        self.set.register(epoch, uint160(addr));
    }

    /* 
     * @notice Pauses an address at a given epoch.
     * @param self The AddressSet storage.
     * @param epoch The epoch when the address is paused.
     * @param addr The address to pause.
     */
    function pause(AddressSet storage self, uint48 epoch, address addr) internal {
        self.set.pause(epoch, uint160(addr));
    }

    /* 
     * @notice Unpauses an address, re-enabling it after the immutable period.
     * @param self The AddressSet storage.
     * @param epoch The current epoch.
     * @param immutableEpochs The required immutable period before unpausing.
     * @param addr The address to unpause.
     */
    function unpause(AddressSet storage self, uint48 epoch, uint48 immutableEpochs, address addr) internal {
        self.set.unpause(epoch, immutableEpochs, uint160(addr));
    }

    /* 
     * @notice Unregisters an address, removing it from the set.
     * @param self The AddressSet storage.
     * @param epoch The current epoch.
     * @param immutableEpochs The required immutable period before unregistering.
     * @param addr The address to unregister.
     */
    function unregister(AddressSet storage self, uint48 epoch, uint48 immutableEpochs, address addr) internal {
        self.set.unregister(epoch, immutableEpochs, uint160(addr));
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
     * @return The value, enabled epoch, and disabled epoch at the position.
     */
    function at(Uint160Set storage self, uint256 pos) internal view returns (uint160, uint48, uint48) {
        return self.array[pos].get();
    }

    /* 
     * @notice Retrieves all active values at a given epoch.
     * @param self The Uint160Set storage.
     * @param epoch The epoch to check.
     * @return An array of active values.
     */
    function getActive(Uint160Set storage self, uint48 epoch) internal view returns (uint160[] memory) {
        uint160[] memory array = new uint160[](self.array.length);
        uint256 len = 0;
        for (uint256 i; i < self.array.length; ++i) {
            if (!self.array[i].wasActiveAt(epoch)) {
                continue;
            }
            array[len++] = self.array[i].value;
        }

        assembly ("memory-safe") {
            mstore(array, len)
        }

        return array;
    }

    /* 
     * @notice Registers a new Uint160 value at a given epoch.
     * @param self The Uint160Set storage.
     * @param epoch The epoch when the value is added.
     * @param value The Uint160 value to register.
     */
    function register(Uint160Set storage self, uint48 epoch, uint160 value) internal {
        if (self.positions[value] != 0) {
            revert AlreadyRegistered();
        }

        uint256 pos = self.array.length;
        Inner storage element = self.array.push();
        element.set(epoch, value);
        self.positions[value] = pos + 1;
    }

    /* 
     * @notice Pauses a Uint160 value at a given epoch.
     * @param self The Uint160Set storage.
     * @param epoch The epoch when the value is paused.
     * @param value The Uint160 value to pause.
     */
    function pause(Uint160Set storage self, uint48 epoch, uint160 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].disable(epoch);
    }

    /* 
     * @notice Unpauses a Uint160 value after the immutable period.
     * @param self The Uint160Set storage.
     * @param epoch The current epoch.
     * @param immutableEpochs The required immutable period before unpausing.
     * @param value The Uint160 value to unpause.
     */
    function unpause(Uint160Set storage self, uint48 epoch, uint48 immutableEpochs, uint160 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        self.array[self.positions[value] - 1].validateUnpause(epoch, immutableEpochs);
        self.array[self.positions[value] - 1].enable(epoch);
    }

    /* 
     * @notice Unregisters a Uint160 value from the set.
     * @param self The Uint160Set storage.
     * @param epoch The current epoch.
     * @param immutableEpochs The required immutable period before unregistering.
     * @param value The Uint160 value to unregister.
     */
    function unregister(Uint160Set storage self, uint48 epoch, uint48 immutableEpochs, uint160 value) internal {
        if (self.positions[value] == 0) {
            revert NotRegistered();
        }

        if (self.array.length == 1 || self.array.length == self.positions[value]) {
            delete self.positions[value];
            self.array.pop();
            return;
        }

        uint256 pos = self.positions[value] - 1;
        self.array[pos].validateUnregister(epoch, immutableEpochs);
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
    * @notice @notice Returns the value and its active period from the Inner struct.
    * @param self The Inner struct.
    * @return The value, enabled epoch, and disabled epoch.
    */
    function get(Inner storage self) internal view returns (uint160, uint48, uint48) {
        return (self.value, self.enabledEpoch, self.disabledEpoch);
    }

    /* 
    * @notice Sets the value and marks it as enabled at a given epoch.
    * @param self The Inner struct.
    * @param epoch The epoch when the value is set.
    * @param value The Uint160 value to store.
    */
    function set(Inner storage self, uint48 epoch, uint160 value) internal {
        self.value = value;
        self.enabledEpoch = epoch + 1;
        self.disabledEpoch = 0;
    }

    /* 
    * @notice Sets the address and marks it as enabled at a given epoch.
    * @param self The Inner struct.
    * @param epoch The epoch when the address is set.
    * @param addr The address to store.
    */
    function set(Inner storage self, uint48 epoch, address addr) internal {
        self.value = uint160(addr);
        self.enabledEpoch = epoch + 1;
        self.disabledEpoch = 0;
    }

    /* 
    * @notice Enables the value at a given epoch.
    * @param self The Inner struct.
    * @param epoch The epoch when the value is enabled.
    */
    function enable(Inner storage self, uint48 epoch) internal {
        if (self.enabledEpoch != 0 && self.disabledEpoch == 0) {
            revert AlreadyEnabled();
        }

        self.enabledEpoch = epoch;
        self.disabledEpoch = 0;
    }

    /* 
    * @notice Disables the value at a given epoch.
    * @param self The Inner struct.
    * @param epoch The epoch when the value is disabled.
    */
    function disable(Inner storage self, uint48 epoch) internal {
        if (self.enabledEpoch == 0 || self.disabledEpoch != 0) {
            revert NotEnabled();
        }

        self.disabledEpoch = epoch;
    }

    /* 
    * @notice Checks if the value was active at a given epoch.
    * @param self The Inner struct.
    * @param epoch The epoch to check.
    * @return True if the value was active at the epoch, false otherwise.
    */
    function wasActiveAt(Inner storage self, uint48 epoch) internal view returns (bool) {
        return (self.enabledEpoch != 0 && self.enabledEpoch <= epoch)
            && (self.disabledEpoch == 0 || self.disabledEpoch > epoch);
    }

    /* 
    * @notice Validates whether the value can be unpaused at a given epoch.
    * @param self The Inner struct.
    * @param epoch The current epoch.
    * @param immutableEpochs The immutable period that must pass before unpausing.
    */
    function validateUnpause(Inner storage self, uint48 epoch, uint48 immutableEpochs) internal view {
        if (self.disabledEpoch + immutableEpochs > epoch) {
            revert ImmutablePeriodNotPassed();
        }
    }

    /* 
    * @notice Validates whether the value can be unregistered at a given epoch.
    * @param self The Inner struct.
    * @param epoch The current epoch.
    * @param immutableEpochs The immutable period that must pass before unregistering.
    */
    function validateUnregister(Inner storage self, uint48 epoch, uint48 immutableEpochs) internal view {
        if (self.disabledEpoch == 0 || self.disabledEpoch + immutableEpochs > epoch) {
            revert ImmutablePeriodNotPassed();
        }
    }
}
