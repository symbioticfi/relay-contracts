// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

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

    struct Status {
        uint48 enabled;
        uint48 disabled;
    }

    struct Inner160 {
        uint160 value;
        Status status;
    }

    struct InnerBytes32 {
        bytes32 value;
        Status status;
    }

    struct InnerBytes {
        bytes value;
        Status status;
    }

    struct Uint160Set {
        Inner160[] array;
        mapping(uint160 => uint256) positions;
    }

    struct AddressSet {
        Uint160Set set;
    }

    struct Bytes32Set {
        InnerBytes32[] array;
        mapping(bytes32 => uint256) positions;
    }

    struct BytesSet {
        InnerBytes[] array;
        mapping(bytes => uint256) positions;
    }

    function set(Status storage self, uint48 timestamp) internal {
        self.enabled = timestamp;
        self.disabled = 0;
    }
    // Status functions

    function enable(Status storage self, uint48 timestamp, uint48 immutablePeriod) internal {
        if (self.enabled != 0) revert AlreadyEnabled();
        if (self.disabled + immutablePeriod > timestamp) revert ImmutablePeriodNotPassed();

        self.enabled = timestamp;
        self.disabled = 0;
    }

    function disable(Status storage self, uint48 timestamp) internal {
        if (self.disabled != 0) revert NotEnabled();
        self.enabled = 0;
        self.disabled = timestamp;
    }

    function validateUnregister(Status storage self, uint48 timestamp, uint48 immutablePeriod) internal view {
        if (self.enabled != 0 || self.disabled == 0) revert Enabled();
        if (self.disabled + immutablePeriod > timestamp) revert ImmutablePeriodNotPassed();
    }

    function checkUnregister(
        Status storage self,
        uint48 timestamp,
        uint48 immutablePeriod
    ) internal view returns (bool) {
        return self.enabled != 0 && self.disabled == 0 && self.disabled + immutablePeriod > timestamp;
    }

    function wasActiveAt(Status storage self, uint48 timestamp) internal view returns (bool) {
        return self.enabled < timestamp && (self.disabled == 0 || self.disabled >= timestamp);
    }

    function get(
        Inner160 storage self
    ) internal view returns (uint160, uint48, uint48) {
        return (self.value, self.status.enabled, self.status.disabled);
    }

    function get(
        InnerBytes32 storage self
    ) internal view returns (bytes32, uint48, uint48) {
        return (self.value, self.status.enabled, self.status.disabled);
    }

    function get(
        InnerBytes storage self
    ) internal view returns (bytes memory, uint48, uint48) {
        return (self.value, self.status.enabled, self.status.disabled);
    }

    // AddressSet functions
    function length(
        AddressSet storage self
    ) internal view returns (uint256) {
        return self.set.length();
    }

    function at(AddressSet storage self, uint256 pos) internal view returns (address, uint48, uint48) {
        (uint160 value, uint48 enabled, uint48 disabled) = self.set.at(pos);
        return (address(value), enabled, disabled);
    }

    function getActive(AddressSet storage self, uint48 timestamp) internal view returns (address[] memory array) {
        uint160[] memory uint160Array = self.set.getActive(timestamp);
        assembly {
            array := uint160Array
        }
        return array;
    }

    function wasActiveAt(AddressSet storage self, uint48 timestamp, address addr) internal view returns (bool) {
        return self.set.wasActiveAt(timestamp, uint160(addr));
    }

    function register(AddressSet storage self, uint48 timestamp, address addr) internal {
        self.set.register(timestamp, uint160(addr));
    }

    function pause(AddressSet storage self, uint48 timestamp, address addr) internal {
        self.set.pause(timestamp, uint160(addr));
    }

    function unpause(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address addr) internal {
        self.set.unpause(timestamp, immutablePeriod, uint160(addr));
    }

    function unregister(AddressSet storage self, uint48 timestamp, uint48 immutablePeriod, address addr) internal {
        self.set.unregister(timestamp, immutablePeriod, uint160(addr));
    }

    function contains(AddressSet storage self, address addr) internal view returns (bool) {
        return self.set.contains(uint160(addr));
    }

    // Uint160Set functions
    function length(
        Uint160Set storage self
    ) internal view returns (uint256) {
        return self.array.length;
    }

    function at(Uint160Set storage self, uint256 pos) internal view returns (uint160, uint48, uint48) {
        return self.array[pos].get();
    }

    function getActive(Uint160Set storage self, uint48 timestamp) internal view returns (uint160[] memory array) {
        array = new uint160[](self.array.length);
        uint256 len;
        for (uint256 i; i < self.array.length; ++i) {
            if (self.array[i].status.wasActiveAt(timestamp)) {
                array[len++] = self.array[i].value;
            }
        }

        assembly {
            mstore(array, len)
        }
        return array;
    }

    function wasActiveAt(Uint160Set storage self, uint48 timestamp, uint160 value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        return pos != 0 && self.array[pos - 1].status.wasActiveAt(timestamp);
    }

    function register(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        if (self.positions[value] != 0) revert AlreadyRegistered();

        Inner160 storage element = self.array.push();
        element.value = value;
        element.status.set(timestamp);
        self.positions[value] = self.array.length;
    }

    function pause(Uint160Set storage self, uint48 timestamp, uint160 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.disable(timestamp);
    }

    function unpause(Uint160Set storage self, uint48 timestamp, uint48 immutablePeriod, uint160 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.enable(timestamp, immutablePeriod);
    }

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

    function contains(Uint160Set storage self, uint160 value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    // Bytes32Set functions
    function length(
        Bytes32Set storage self
    ) internal view returns (uint256) {
        return self.array.length;
    }

    function at(Bytes32Set storage self, uint256 pos) internal view returns (bytes32, uint48, uint48) {
        return self.array[pos].get();
    }

    function getActive(Bytes32Set storage self, uint48 timestamp) internal view returns (bytes32[] memory array) {
        array = new bytes32[](self.array.length);
        uint256 len;
        for (uint256 i; i < self.array.length; ++i) {
            if (self.array[i].status.wasActiveAt(timestamp)) {
                array[len++] = self.array[i].value;
            }
        }

        assembly {
            mstore(array, len)
        }
        return array;
    }

    function wasActiveAt(Bytes32Set storage self, uint48 timestamp, bytes32 value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        return pos != 0 && self.array[pos - 1].status.wasActiveAt(timestamp);
    }

    function register(Bytes32Set storage self, uint48 timestamp, bytes32 value) internal {
        if (self.positions[value] != 0) revert AlreadyRegistered();

        uint256 pos = self.array.length;
        InnerBytes32 storage element = self.array.push();
        element.value = value;
        element.status.set(timestamp);
        self.positions[value] = pos + 1;
    }

    function pause(Bytes32Set storage self, uint48 timestamp, bytes32 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.disable(timestamp);
    }

    function unpause(Bytes32Set storage self, uint48 timestamp, uint48 immutablePeriod, bytes32 value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.enable(timestamp, immutablePeriod);
    }

    function checkUnregister(Bytes32Set storage self, uint48 timestamp, uint48 immutablePeriod, bytes32 value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        if (pos == 0) return false;
        return self.array[pos - 1].status.checkUnregister(timestamp, immutablePeriod);
    }

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

    function contains(Bytes32Set storage self, bytes32 value) internal view returns (bool) {
        return self.positions[value] != 0;
    }

    // BytesSet functions
    function length(
        BytesSet storage self
    ) internal view returns (uint256) {
        return self.array.length;
    }

    function at(BytesSet storage self, uint256 pos) internal view returns (bytes memory, uint48, uint48) {
        return self.array[pos].get();
    }

    function getActive(BytesSet storage self, uint48 timestamp) internal view returns (bytes[] memory array) {
        array = new bytes[](self.array.length);
        uint256 len;
        for (uint256 i; i < self.array.length; ++i) {
            if (self.array[i].status.wasActiveAt(timestamp)) {
                array[len++] = self.array[i].value;
            }
        }

        assembly {
            mstore(array, len)
        }
        return array;
    }

    function wasActiveAt(BytesSet storage self, uint48 timestamp, bytes memory value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        return pos != 0 && self.array[pos - 1].status.wasActiveAt(timestamp);
    }

    function register(BytesSet storage self, uint48 timestamp, bytes memory value) internal {
        if (self.positions[value] != 0) revert AlreadyRegistered();

        uint256 pos = self.array.length;
        InnerBytes storage element = self.array.push();
        element.value = value;
        element.status.set(timestamp);
        self.positions[value] = pos + 1;
    }

    function pause(BytesSet storage self, uint48 timestamp, bytes memory value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.disable(timestamp);
    }

    function unpause(BytesSet storage self, uint48 timestamp, uint48 immutablePeriod, bytes memory value) internal {
        if (self.positions[value] == 0) revert NotRegistered();
        self.array[self.positions[value] - 1].status.enable(timestamp, immutablePeriod);
    }

    function checkUnregister(BytesSet storage self, uint48 timestamp, uint48 immutablePeriod, bytes memory value) internal view returns (bool) {
        uint256 pos = self.positions[value];
        if (pos == 0) return false;
        return self.array[pos - 1].status.checkUnregister(timestamp, immutablePeriod);
    }

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

    function contains(BytesSet storage self, bytes memory value) internal view returns (bool) {
        return self.positions[value] != 0;
    }
}
