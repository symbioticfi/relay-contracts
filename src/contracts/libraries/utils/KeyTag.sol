// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library KeyTag {
    // 3 bits for type, 4 bits for tag
    uint256 public constant TOTAL_KEY_TAGS = 128;

    function keyTag(uint8 type_, uint8 identifier) internal pure returns (uint8) {
        if (type_ > 7) {
            revert("Invalid key type");
        }
        if (identifier > 15) {
            revert("Invalid key tag");
        }
        return type_ << 4 | identifier;
    }

    function getType(
        uint8 keyTag_
    ) internal pure returns (uint8 type_) {
        if (keyTag_ >= TOTAL_KEY_TAGS) {
            revert("Invalid key tag");
        }
        return keyTag_ >> 4;
    }

    function getTag(
        uint8 keyTag_
    ) internal pure returns (uint8) {
        if (keyTag_ >= TOTAL_KEY_TAGS) {
            revert("Invalid key tag");
        }
        return keyTag_ & 0x0F;
    }
}
