// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBaseKeyManager {
    struct Key {
        uint8 tag;
        bytes payload;
    }

    struct OperatorWithKeys {
        address operator;
        Key[] keys;
    }

    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) external view returns (uint8[] memory requiredKeyTags);

    function getRequiredKeyTags() external view returns (uint8[] memory requiredKeyTags);

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bytes memory);

    function getKey(address operator, uint8 tag) external view returns (bytes memory);

    function getOperator(
        bytes memory key
    ) external view returns (address);

    function getRequiredKeysAt(uint48 timestamp, bytes memory hint) external view returns (OperatorWithKeys[] memory);

    function getRequiredKeys() external view returns (OperatorWithKeys[] memory);
}
