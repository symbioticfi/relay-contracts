// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {BitMaps} from "./BitMaps.sol";

library Subsets {
    using BitMaps for BitMaps.BitMap;
    using EnumerableSet for EnumerableSet.AddressSet;

    error InvalidVaultsPositions();

    function enableSubset(BitMaps.BitMap storage setStatus, uint256[] memory positions, uint256 setLength) external {
        _verifyPositions(positions, setLength);
        for (uint256 i = 0; i < positions.length; ++i) {
            setStatus.set(positions[i]);
        }
    }

    function enable(BitMaps.BitMap storage setStatus, uint256 position, uint256 setLength) external {
        _verifyPosition(position, setLength);
        setStatus.set(position);
    }

    function disableSubset(BitMaps.BitMap storage setStatus, uint256[] memory positions, uint256 setLength) external {
        _verifyPositions(positions, setLength);
        for (uint256 i = 0; i < positions.length; ++i) {
            setStatus.unset(positions[i]);
        }
    }

    function disable(BitMaps.BitMap storage setStatus, uint256 position, uint256 setLength) external {
        _verifyPosition(position, setLength);
        setStatus.unset(position);
    }

    function getEnabledSubset(EnumerableSet.AddressSet storage set, BitMaps.BitMap storage setStatus, uint48 timestamp)
        external
        view
        returns (address[] memory)
    {
        address[] memory _set = set.values();
        uint256 length = 0;
        for (uint256 i = 0; i < _set.length; ++i) {
            if (setStatus.get(i, timestamp)) {
                _set[length++] = _set[i];
            }
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(_set, length)
        }

        return _set;
    }

    function getEnabledSubset(bytes32[] storage set, BitMaps.BitMap storage setStatus, uint48 timestamp)
        external
        view
        returns (bytes32[] memory)
    {
        bytes32[] memory _set = set;
        uint256 length = 0;
        for (uint256 i = 0; i < _set.length; ++i) {
            if (setStatus.get(i, timestamp)) {
                _set[length++] = _set[i];
            }
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(_set, length)
        }

        return _set;
    }

    function getEnabledSubset(bytes[] storage set, BitMaps.BitMap storage setStatus, uint48 timestamp)
        external
        view
        returns (bytes[] memory)
    {
        bytes[] memory _set = set;
        uint256 length = 0;
        for (uint256 i = 0; i < _set.length; ++i) {
            if (setStatus.get(i, timestamp)) {
                _set[length++] = _set[i];
            }
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(_set, length)
        }

        return _set;
    }

    function _verifyPositions(uint256[] memory positions, uint256 setLength) private pure {
        _verifyPosition(positions[positions.length - 1], setLength);

        for (uint256 i = 1; i < positions.length; ++i) {
            if (positions[i] <= positions[i - 1]) {
                revert InvalidVaultsPositions();
            }
        }
    }

    function _verifyPosition(uint256 position, uint256 setLength) private pure {
        if (position >= setLength) {
            revert InvalidVaultsPositions();
        }
    }
}
