// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ExtraDataStorageHelper {
    string public constant GLOBAL_KEY_PREFIX = "symbiotic.Settlement.extraData.";

    string public constant KEY_TAG_PREFIX = "keyTag.";

    function getKey(uint128 verificationType, string memory name) internal pure returns (bytes32) {
        return keccak256(abi.encode(GLOBAL_KEY_PREFIX, verificationType, name));
    }

    function getKey(uint128 verificationType, uint8 keyTag, string memory name) internal pure returns (bytes32) {
        return keccak256(abi.encode(GLOBAL_KEY_PREFIX, verificationType, KEY_TAG_PREFIX, keyTag, name));
    }

    function getKey(
        uint128 verificationType,
        uint8 keyTag,
        string memory name,
        uint256 index
    ) internal pure returns (bytes32) {
        return bytes32(
            uint256(keccak256(abi.encode(GLOBAL_KEY_PREFIX, verificationType, KEY_TAG_PREFIX, keyTag, name))) + index
        );
    }
}
