// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.3.0) (utils/structs/EnumerableSet.sol)
// This file was procedurally generated from scripts/generate/templates/EnumerableSet.js.

pragma solidity ^0.8.20;

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {Checkpoints} from "./Checkpoints.sol";

library CheckpointsEnumerableMap {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace208;

    /**
     * @dev Query for a nonexistent map key.
     */
    error EnumerableMapNonexistentKey(bytes32 key);

    struct Bytes32ToTrace208Map {
        // Storage of keys
        EnumerableSet.Bytes32Set _keys;
        mapping(bytes32 key => Checkpoints.Trace208) _values;
    }

    /**
     * @dev Adds a key-value pair to a map, or updates the value for an existing
     * key. O(1).
     *
     * Returns true if the key was added to the map, that is if it was not
     * already present.
     */
    function set(
        Bytes32ToTrace208Map storage map,
        bytes32 key,
        uint48 checkpointKey,
        uint208 checkpointValue
    ) internal returns (bool) {
        map._values[key].push(checkpointKey, checkpointValue);
        return map._keys.add(key);
    }

    /**
     * @dev Removes a key-value pair from a map. O(1).
     *
     * Returns true if the key was removed from the map, that is if it was present.
     */
    function remove(Bytes32ToTrace208Map storage map, bytes32 key) internal returns (bool) {
        delete map._values[key];
        return map._keys.remove(key);
    }

    /**
     * @dev Returns true if the key is in the map. O(1).
     */
    function contains(Bytes32ToTrace208Map storage map, bytes32 key) internal view returns (bool) {
        return map._keys.contains(key);
    }

    /**
     * @dev Returns the number of key-value pairs in the map. O(1).
     */
    function length(
        Bytes32ToTrace208Map storage map
    ) internal view returns (uint256) {
        return map._keys.length();
    }

    /**
     * @dev Returns the key-value pair stored at position `index` in the map. O(1).
     *
     * Note that there are no guarantees on the ordering of entries inside the
     * array, and it may change when more entries are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(
        Bytes32ToTrace208Map storage map,
        uint256 index
    ) internal view returns (bytes32 key, Checkpoints.Trace208 storage value) {
        bytes32 atKey = map._keys.at(index);
        return (atKey, map._values[atKey]);
    }

    /**
     * @dev Tries to returns the value associated with `key`. O(1).
     * Does not revert if `key` is not in the map.
     */
    function tryGet(
        Bytes32ToTrace208Map storage map,
        bytes32 key
    ) internal view returns (bool exists, Checkpoints.Trace208 storage value) {
        Checkpoints.Trace208 storage val = map._values[key];
        if (val.length() == 0) {
            return (contains(map, key), val);
        } else {
            return (true, val);
        }
    }

    /**
     * @dev Returns the value associated with `key`. O(1).
     *
     * Requirements:
     *
     * - `key` must be in the map.
     */
    function get(Bytes32ToTrace208Map storage map, bytes32 key) internal view returns (Checkpoints.Trace208 storage) {
        Checkpoints.Trace208 storage value = map._values[key];
        if (value.length() == 0 && !contains(map, key)) {
            revert EnumerableMapNonexistentKey(key);
        }
        return value;
    }

    /**
     * @dev Return the an array containing all the keys
     *
     * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
     * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
     * this function has an unbounded cost, and using it as part of a state-changing function may render the function
     * uncallable if the map grows to a point where copying to memory consumes too much gas to fit in a block.
     */
    function keys(
        Bytes32ToTrace208Map storage map
    ) internal view returns (bytes32[] memory) {
        return map._keys.values();
    }

    // AddressToUintMap

    struct AddressToTrace208Map {
        Bytes32ToTrace208Map _inner;
    }

    /**
     * @dev Adds a key-value pair to a map, or updates the value for an existing
     * key. O(1).
     *
     * Returns true if the key was added to the map, that is if it was not
     * already present.
     */
    function set(
        AddressToTrace208Map storage map,
        address key,
        uint48 checkpointKey,
        uint208 checkpointValue
    ) internal returns (bool) {
        return set(map._inner, bytes32(uint256(uint160(key))), checkpointKey, checkpointValue);
    }

    /**
     * @dev Removes a value from a map. O(1).
     *
     * Returns true if the key was removed from the map, that is if it was present.
     */
    function remove(AddressToTrace208Map storage map, address key) internal returns (bool) {
        return remove(map._inner, bytes32(uint256(uint160(key))));
    }

    /**
     * @dev Returns true if the key is in the map. O(1).
     */
    function contains(AddressToTrace208Map storage map, address key) internal view returns (bool) {
        return contains(map._inner, bytes32(uint256(uint160(key))));
    }

    /**
     * @dev Returns the number of elements in the map. O(1).
     */
    function length(
        AddressToTrace208Map storage map
    ) internal view returns (uint256) {
        return length(map._inner);
    }

    /**
     * @dev Returns the element stored at position `index` in the map. O(1).
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(
        AddressToTrace208Map storage map,
        uint256 index
    ) internal view returns (address key, Checkpoints.Trace208 storage value) {
        (bytes32 atKey, Checkpoints.Trace208 storage val) = at(map._inner, index);
        return (address(uint160(uint256(atKey))), val);
    }

    /**
     * @dev Tries to returns the value associated with `key`. O(1).
     * Does not revert if `key` is not in the map.
     */
    function tryGet(
        AddressToTrace208Map storage map,
        address key
    ) internal view returns (bool exists, Checkpoints.Trace208 storage value) {
        (bool success, Checkpoints.Trace208 storage val) = tryGet(map._inner, bytes32(uint256(uint160(key))));
        return (success, val);
    }

    /**
     * @dev Returns the value associated with `key`. O(1).
     *
     * Requirements:
     *
     * - `key` must be in the map.
     */
    function get(AddressToTrace208Map storage map, address key) internal view returns (Checkpoints.Trace208 storage) {
        return get(map._inner, bytes32(uint256(uint160(key))));
    }

    /**
     * @dev Return the an array containing all the keys
     *
     * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
     * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
     * this function has an unbounded cost, and using it as part of a state-changing function may render the function
     * uncallable if the map grows to a point where copying to memory consumes too much gas to fit in a block.
     */
    function keys(
        AddressToTrace208Map storage map
    ) internal view returns (address[] memory) {
        bytes32[] memory store = keys(map._inner);
        address[] memory result;

        assembly ("memory-safe") {
            result := store
        }

        return result;
    }
}
