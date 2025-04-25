// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../base/KeyManager.sol";
import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

contract KeyRegistry is KeyManager, OzAccessControl {
    constructor() {
        _disableInitializers();
    }

    function getOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return _getKeysOperatorsLengthAt(timestamp, hint);
    }

    function getOperatorsLength() public view virtual returns (uint256) {
        return _getKeysOperatorsLength();
    }

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) public view virtual returns (address[] memory) {
        return _getKeysOperatorsAt(timestamp, hints);
    }

    function getOperators() public view virtual returns (address[] memory) {
        return _getKeysOperators();
    }

    function initialize(
        KeyManagerInitParams memory keyManagerInitParams
    ) public virtual initializer {
        __KeyManager_init(keyManagerInitParams);
        __OzAccessControl_init();
    }

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        _setRequiredKeyTags(requiredKeyTags);
    }

    function registerKeys(address operator, KeyWithSignature[] memory keysWithSignatures) public virtual {
        _registerKeys(operator, keysWithSignatures);
    }

    function updateKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) public virtual {
        _setKey(operator, tag, key, signature, extraData);
    }
}
