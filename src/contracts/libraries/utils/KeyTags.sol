// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library KeyTags {
    using KeyTags for uint128;

    error KeyTags_InvalidKeyType();
    error KeyTags_InvalidKeyTag();
    error KeyTags_Duplicate();

    // 3 bits for type, 4 bits for tag
    uint256 public constant TOTAL_KEY_TAGS = 128;

    function getKeyTag(uint8 type_, uint8 tag) internal pure returns (uint8) {
        if (type_ > 7) {
            revert KeyTags_InvalidKeyType();
        }
        if (tag > 15) {
            revert KeyTags_InvalidKeyTag();
        }
        return type_ << 4 | tag;
    }

    function getType(
        uint8 keyTag
    ) internal pure returns (uint8 type_) {
        if (keyTag >= TOTAL_KEY_TAGS) {
            revert KeyTags_InvalidKeyTag();
        }
        return keyTag >> 4;
    }

    function getTag(
        uint8 keyTag
    ) internal pure returns (uint8) {
        if (keyTag >= TOTAL_KEY_TAGS) {
            revert KeyTags_InvalidKeyTag();
        }
        return keyTag & 0x0F;
    }

    function contains(uint128 keyTagsSerialized, uint8 keyTag) internal pure returns (bool) {
        return keyTagsSerialized & (1 << keyTag) > 0;
    }

    function add(uint128 keyTagsSerialized, uint8 keyTag) internal pure returns (uint128) {
        return keyTagsSerialized | uint128(1 << keyTag);
    }

    function remove(uint128 keyTagsSerialized, uint8 keyTag) internal pure returns (uint128) {
        return keyTagsSerialized & ~uint128(1 << keyTag);
    }

    function serialize(
        uint8[] memory keyTags
    ) internal pure returns (uint128 keyTagsSerialized) {
        unchecked {
            for (uint256 i; i < keyTags.length; ++i) {
                uint128 oldKeyTagsSerialized = keyTagsSerialized;
                keyTagsSerialized = keyTagsSerialized.add(keyTags[i]);
                if (oldKeyTagsSerialized == keyTagsSerialized) {
                    revert KeyTags_Duplicate();
                }
            }
        }
    }

    function deserialize(
        uint128 keyTagsSerialized
    ) internal pure returns (uint8[] memory keyTags) {
        unchecked {
            uint256 length;
            keyTags = new uint8[](KeyTags.TOTAL_KEY_TAGS);
            for (uint8 i; i < KeyTags.TOTAL_KEY_TAGS; ++i) {
                if (keyTagsSerialized.contains(i)) {
                    keyTags[length++] = i;
                }
            }
            assembly ("memory-safe") {
                mstore(keyTags, length)
            }
        }
    }
}
