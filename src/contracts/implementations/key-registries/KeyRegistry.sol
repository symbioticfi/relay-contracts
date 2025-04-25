// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../base/KeyManager.sol";
import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

import {IKeyRegistry} from "../../../interfaces/implementations/key-registries/IKeyRegistry.sol";

contract KeyRegistry is KeyManager, OzAccessControl, IKeyRegistry {
    constructor() {
        _disableInitializers();
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function getOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return _getKeysOperatorsLengthAt(timestamp, hint);
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function getOperatorsLength() public view virtual returns (uint256) {
        return _getKeysOperatorsLength();
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) public view virtual returns (address[] memory) {
        return _getKeysOperatorsAt(timestamp, hints);
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function getOperators() public view virtual returns (address[] memory) {
        return _getKeysOperators();
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function initialize(
        KeyManagerInitParams memory keyManagerInitParams
    ) public virtual initializer {
        __KeyManager_init(keyManagerInitParams);
        __OzAccessControl_init();
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        _setRequiredKeyTags(requiredKeyTags);
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function registerKeys(address operator, KeyWithSignature[] memory keysWithSignatures) public virtual {
        _registerKeys(operator, keysWithSignatures);
    }

    /**
     * @inheritdoc IKeyRegistry
     */
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
