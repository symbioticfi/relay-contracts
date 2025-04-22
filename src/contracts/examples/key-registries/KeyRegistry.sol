// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../base/KeyManager.sol";
import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

contract KeyRegistry is KeyManager, OzAccessControl {
    constructor() {
        _disableInitializers();
    }

    function getOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getOperatorsLengthAt(timestamp, hint);
    }

    function getOperatorsLength() public view returns (uint256) {
        return _getOperatorsLength();
    }

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) public view returns (address[] memory) {
        return _getOperatorsAt(timestamp, hints);
    }

    function getOperators() public view returns (address[] memory) {
        return _getOperators();
    }

    function initialize(string memory name, string memory version, uint8[] memory requiredKeyTags) public initializer {
        __KeyManager_init(name, version, requiredKeyTags);
        __OzAccessControl_init();
    }

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public checkPermission {
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
