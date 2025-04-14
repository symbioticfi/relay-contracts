// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "./KeyManager.sol";
import {OzAccessControl} from "../SDK/extensions/managers/access/OzAccessControl.sol";

contract KeyRegistry is KeyManager, OzAccessControl {
    constructor() {
        _disableInitializers();
    }

    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (uint8[] memory requiredKeyTags) {
        return _getRequiredKeyTagsAt(timestamp, hint);
    }

    function getRequiredKeyTags() public view returns (uint8[] memory requiredKeyTags) {
        return _getRequiredKeyTags();
    }

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bytes memory) {
        return _getKeyAt(operator, tag, timestamp, hint);
    }

    function getKey(address operator, uint8 tag) public view returns (bytes memory) {
        return _getKey(operator, tag);
    }

    function getOperator(
        bytes memory key
    ) public view returns (address) {
        return _getOperator(key);
    }

    function getRequiredKeysAt(
        address[] memory operators,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (Key[] memory requiredKeys) {
        return _getRequiredKeysAt(operators, timestamp, hint);
    }

    function getRequiredKeys(
        address[] memory operators
    ) public view returns (Key[] memory requiredKeys) {
        return _getRequiredKeys(operators);
    }

    function initialize(
        string memory name,
        string memory version,
        uint8[] memory requiredKeyTags,
        address defaultAdmin
    ) public initializer {
        __KeyManager_init(name, version, requiredKeyTags);
        __OzAccessControl_init(defaultAdmin);
    }

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public checkAccess {
        _setRequiredKeyTags(requiredKeyTags);
    }

    function registerKeys(address operator, KeyWithSignature[] memory keysWithSignatures) public {
        _registerKeys(operator, keysWithSignatures);
    }

    function updateKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) public {
        _setKey(operator, tag, key, signature, extraData);
    }
}
