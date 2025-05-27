// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library KeyTags {
    using KeyTags for uint128;

    error KeyTags_InvalidKeyType();
    error KeyTags_InvalidKeyTag();
    error KeyTags_Duplicate();

    // 3 bits for type, 4 bits for tag
    uint256 public constant TOTAL_KEY_TAGS = 128;

    function getKeyTag(uint8 type_, uint8 identifier) internal pure returns (uint8) {
        if (type_ > 7) {
            revert KeyTags_InvalidKeyType();
        }
        if (identifier > 15) {
            revert KeyTags_InvalidKeyTag();
        }
        return type_ << 4 | identifier;
    }

    function getType(
        uint8 keyTag_
    ) internal pure returns (uint8 type_) {
        if (keyTag_ >= TOTAL_KEY_TAGS) {
            revert KeyTags_InvalidKeyTag();
        }
        return keyTag_ >> 4;
    }

    function getTag(
        uint8 keyTag_
    ) internal pure returns (uint8) {
        if (keyTag_ >= TOTAL_KEY_TAGS) {
            revert KeyTags_InvalidKeyTag();
        }
        return keyTag_ & 0x0F;
    }

    function contains(uint128 keyTagsData, uint8 keyTag) internal pure returns (bool) {
        return keyTagsData & (1 << keyTag) > 0;
    }

    function add(uint128 keyTagsData, uint8 keyTag) internal pure returns (uint128) {
        return keyTagsData | uint128(1 << keyTag);
    }

    function remove(uint128 keyTagsData, uint8 keyTag) internal pure returns (uint128) {
        return keyTagsData & ~uint128(1 << keyTag);
    }

    function serialize(
        uint8[] memory keyTags
    ) internal pure returns (uint128 keyTagsData) {
        for (uint256 i; i < keyTags.length; ++i) {
            uint128 oldKeyTagsData = keyTagsData;
            keyTagsData = keyTagsData.add(keyTags[i]);
            if (oldKeyTagsData == keyTagsData) {
                revert KeyTags_Duplicate();
            }
        }
    }

    function deserialize(
        uint128 keyTagsData
    ) internal pure returns (uint8[] memory keyTags) {
        uint256 length;
        keyTags = new uint8[](KeyTags.TOTAL_KEY_TAGS);
        for (uint8 i; i < KeyTags.TOTAL_KEY_TAGS; ++i) {
            if (keyTagsData.contains(i)) {
                keyTags[length++] = i;
            }
        }
        assembly ("memory-safe") {
            mstore(keyTags, length)
        }
    }
}
