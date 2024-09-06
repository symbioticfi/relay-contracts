// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library KeyData {
    // Mask for uint96 (0xFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000)
    uint256 private constant UINT96_MASK = (1 << 96) - 1;

    // Offset for address in the uint256 slot
    uint256 private constant ADDRESS_SHIFT = 96;

    function pack(address operator, uint96 position) internal pure returns (uint256) {
        return (uint256(position) | (uint256(uint160(operator)) << ADDRESS_SHIFT));
    }

    function getOperator(uint256 self) internal pure returns (address) {
        return address(uint160(self >> ADDRESS_SHIFT));
    }

    function getPosition(uint256 self) internal pure returns (uint256) {
        return self & UINT96_MASK;
    }
}
