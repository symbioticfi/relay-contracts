// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract KeyManager is Initializable {
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
    ) public view virtual returns (uint8[] memory requiredKeyTags);

    function getRequiredKeyTags() public view virtual returns (uint8[] memory requiredKeyTags);

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bytes memory);

    function getKey(address operator, uint8 tag) public view virtual returns (bytes memory);

    function getOperator(
        bytes memory key
    ) public view virtual returns (address);

    function getRequiredKeysAt(
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (OperatorWithKeys[] memory);

    function getRequiredKeys() public view virtual returns (OperatorWithKeys[] memory);
}
