// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Checkpoints} from "../structs/Checkpoints.sol";
import {InputNormalizer} from "../utils/InputNormalizer.sol";

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

library PersistentSet {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using Checkpoints for Checkpoints.Trace208;
    using Math for uint256;
    using InputNormalizer for bytes[];

    struct Set {
        EnumerableSet.Bytes32Set _elements;
        Checkpoints.Trace256[] _statuses;
        Checkpoints.Trace208 _length;
    }

    function _add(Set storage set, uint48 key, bytes32 value) private returns (bool) {
        unchecked {
            bool added = set._elements.add(value);
            if (added) {
                (uint256 row, uint256 column) = _getRowAndColumn(set._elements.length() - 1);
                if (column == 0) {
                    Checkpoints.Trace256 storage statusBitMap = set._statuses.push();
                    statusBitMap.push(key, 1);
                } else {
                    Checkpoints.Trace256 storage statusBitMap = set._statuses[row];
                    statusBitMap.push(key, statusBitMap.latest() | (1 << column));
                }
            } else {
                (uint256 row, uint256 column) = _getRowAndColumn(set._elements._inner._positions[value] - 1);
                uint256 oldStatusBitMap = set._statuses[row].latest();
                uint256 newStatusBitMap = oldStatusBitMap | (1 << column);
                if (oldStatusBitMap == newStatusBitMap) {
                    return false;
                }
                set._statuses[row].push(key, newStatusBitMap);
            }
            set._length.push(key, _length(set) + 1);
            return true;
        }
    }

    function _remove(Set storage set, uint48 key, bytes32 value) private returns (bool) {
        unchecked {
            uint256 positionRaw = set._elements._inner._positions[value];
            if (positionRaw == 0) {
                return false;
            }
            (uint256 row, uint256 column) = _getRowAndColumn(positionRaw - 1);
            uint256 oldStatusBitMap = set._statuses[row].latest();
            uint256 newStatusBitMap = oldStatusBitMap & ~(1 << column);
            if (oldStatusBitMap == newStatusBitMap) {
                return false;
            }
            set._statuses[row].push(key, newStatusBitMap);
            set._length.push(key, _length(set) - 1);
            return true;
        }
    }

    function _containsAt(Set storage set, uint48 key, bytes32 value, bytes memory hint) private view returns (bool) {
        unchecked {
            uint256 positionRaw = set._elements._inner._positions[value];
            if (positionRaw == 0) {
                return false;
            }
            (uint256 row, uint256 column) = _getRowAndColumn(positionRaw - 1);
            return set._statuses[row].upperLookupRecent(key, hint) & (1 << column) > 0;
        }
    }

    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        unchecked {
            uint256 positionRaw = set._elements._inner._positions[value];
            if (positionRaw == 0) {
                return false;
            }
            (uint256 row, uint256 column) = _getRowAndColumn(positionRaw - 1);
            return set._statuses[row].latest() & (1 << column) > 0;
        }
    }

    function _lengthAt(Set storage set, uint48 key, bytes memory hint) private view returns (uint208) {
        return set._length.upperLookupRecent(key, hint);
    }

    function _length(
        Set storage set
    ) private view returns (uint208) {
        return set._length.latest();
    }

    function _valuesAt(
        Set storage set,
        uint48 key,
        bytes[] memory hints
    ) private view returns (bytes32[] memory values_) {
        unchecked {
            uint256 totalLength = set._elements.length();
            values_ = new bytes32[](totalLength);
            uint256 rows = (totalLength + 255) >> 8;
            hints = InputNormalizer.normalize(hints, rows);
            uint256 setLength;
            for (uint256 i; i < rows; ++i) {
                uint256 statusBitMap = set._statuses[i].upperLookupRecent(key, hints[i]);
                for (uint256 j; j < 256; ++j) {
                    if (statusBitMap & (1 << j) > 0) {
                        values_[setLength++] = set._elements.at(i << 8 | j);
                    }
                }
            }
            assembly ("memory-safe") {
                mstore(values_, setLength)
            }
        }
    }

    function _values(
        Set storage set
    ) private view returns (bytes32[] memory values_) {
        unchecked {
            uint256 totalLength = set._elements.length();
            values_ = new bytes32[](totalLength);
            uint256 rows = (totalLength + 255) >> 8;
            uint256 setLength;
            for (uint256 i; i < rows; ++i) {
                uint256 statusBitMap = set._statuses[i].latest();
                for (uint256 j; j < 256; ++j) {
                    if (statusBitMap & (1 << j) > 0) {
                        values_[setLength++] = set._elements.at(i << 8 | j);
                    }
                }
            }
            assembly ("memory-safe") {
                mstore(values_, setLength)
            }
        }
    }

    function _allValues(
        Set storage set
    ) private view returns (EnumerableSet.Bytes32Set storage) {
        return set._elements;
    }

    function _getRowAndColumn(
        uint256 position
    ) private pure returns (uint256, uint256) {
        return (position >> 8, position & 0xff);
    }

    // Bytes32Set

    struct Bytes32Set {
        Set _inner;
    }

    function add(Bytes32Set storage set, uint48 key, bytes32 value) internal returns (bool) {
        return _add(set._inner, key, value);
    }

    function remove(Bytes32Set storage set, uint48 key, bytes32 value) internal returns (bool) {
        return _remove(set._inner, key, value);
    }

    function containsAt(
        Bytes32Set storage set,
        uint48 key,
        bytes32 value,
        bytes memory hint
    ) internal view returns (bool) {
        return _containsAt(set._inner, key, value, hint);
    }

    function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool) {
        return _contains(set._inner, value);
    }

    function lengthAt(Bytes32Set storage set, uint48 key, bytes memory hint) internal view returns (uint208) {
        return _lengthAt(set._inner, key, hint);
    }

    function length(
        Bytes32Set storage set
    ) internal view returns (uint208) {
        return _length(set._inner);
    }

    function valuesAt(
        Bytes32Set storage set,
        uint48 key,
        bytes[] memory hints
    ) internal view returns (bytes32[] memory result) {
        bytes32[] memory store = _valuesAt(set._inner, key, hints);
        assembly ("memory-safe") {
            result := store
        }
    }

    function values(
        Bytes32Set storage set
    ) internal view returns (bytes32[] memory result) {
        bytes32[] memory store = _values(set._inner);
        assembly ("memory-safe") {
            result := store
        }
    }

    function allValues(
        Bytes32Set storage set
    ) internal view returns (EnumerableSet.Bytes32Set storage result) {
        EnumerableSet.Bytes32Set storage store = _allValues(set._inner);
        assembly ("memory-safe") {
            result.slot := store.slot
        }
    }

    // AddressSet

    struct AddressSet {
        Set _inner;
    }

    function add(AddressSet storage set, uint48 key, address value) internal returns (bool) {
        return _add(set._inner, key, bytes32(uint256(uint160(value))));
    }

    function remove(AddressSet storage set, uint48 key, address value) internal returns (bool) {
        return _remove(set._inner, key, bytes32(uint256(uint160(value))));
    }

    function containsAt(
        AddressSet storage set,
        uint48 key,
        address value,
        bytes memory hint
    ) internal view returns (bool) {
        return _containsAt(set._inner, key, bytes32(uint256(uint160(value))), hint);
    }

    function contains(AddressSet storage set, address value) internal view returns (bool) {
        return _contains(set._inner, bytes32(uint256(uint160(value))));
    }

    function lengthAt(AddressSet storage set, uint48 key, bytes memory hint) internal view returns (uint208) {
        return _lengthAt(set._inner, key, hint);
    }

    function length(
        AddressSet storage set
    ) internal view returns (uint208) {
        return _length(set._inner);
    }

    function valuesAt(
        AddressSet storage set,
        uint48 key,
        bytes[] memory hints
    ) internal view returns (address[] memory result) {
        bytes32[] memory store = _valuesAt(set._inner, key, hints);
        assembly ("memory-safe") {
            result := store
        }
    }

    function values(
        AddressSet storage set
    ) internal view returns (address[] memory result) {
        bytes32[] memory store = _values(set._inner);
        assembly ("memory-safe") {
            result := store
        }
    }

    function allValues(
        AddressSet storage set
    ) internal view returns (EnumerableSet.AddressSet storage result) {
        EnumerableSet.Bytes32Set storage store = _allValues(set._inner);
        assembly ("memory-safe") {
            result.slot := store.slot
        }
    }
}
