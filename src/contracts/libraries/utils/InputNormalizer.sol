// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library InputNormalizer {
    error InvalidLength_InvalidLength();

    function normalize(bytes[] memory arr, uint256 length) internal pure returns (bytes[] memory) {
        if (arr.length == 0) {
            return new bytes[](length);
        }
        if (arr.length != length) {
            revert InvalidLength_InvalidLength();
        }
        return arr;
    }

    function normalize(bytes[][] memory arr, uint256 length) internal pure returns (bytes[][] memory) {
        if (arr.length == 0) {
            return new bytes[][](length);
        }
        if (arr.length != length) {
            revert InvalidLength_InvalidLength();
        }
        return arr;
    }
}
