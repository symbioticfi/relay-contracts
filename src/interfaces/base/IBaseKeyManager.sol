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

    function getKeysAt(uint48 timestamp, bytes memory hint) external view returns (OperatorWithKeys[] memory);

    function getKeys() external view returns (OperatorWithKeys[] memory);
}
