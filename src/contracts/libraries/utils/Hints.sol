// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Hints {
    error InvalidLength();

    function normalize(bytes[] memory hints, uint256 length) internal pure returns (bytes[] memory) {
        if (hints.length == 0) {
            return new bytes[](length);
        }
        if (hints.length != length) {
            revert InvalidLength();
        }
        return hints;
    }
}
