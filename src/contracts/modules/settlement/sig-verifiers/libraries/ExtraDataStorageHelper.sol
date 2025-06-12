// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library ExtraDataStorageHelper {
    string public constant GLOBAL_KEY_PREFIX = "symbiotic.Settlement.extraData.";

    string public constant KEY_TAG_PREFIX = "keyTag.";

    function getKey(uint32 verificationType, bytes32 nameHash) internal pure returns (bytes32) {
        return keccak256(abi.encode(GLOBAL_KEY_PREFIX, verificationType, nameHash));
    }

    function getKey(uint32 verificationType, uint8 keyTag, bytes32 nameHash) internal pure returns (bytes32) {
        return keccak256(abi.encode(GLOBAL_KEY_PREFIX, verificationType, KEY_TAG_PREFIX, keyTag, nameHash));
    }

    function getKey(
        uint32 verificationType,
        uint8 keyTag,
        bytes32 nameHash,
        uint256 index
    ) internal pure returns (bytes32) {
        return bytes32(
            uint256(keccak256(abi.encode(GLOBAL_KEY_PREFIX, verificationType, KEY_TAG_PREFIX, keyTag, nameHash)))
                + index
        );
    }
}
