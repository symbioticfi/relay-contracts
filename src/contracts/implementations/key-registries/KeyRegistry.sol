// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../base/KeyManager.sol";

import {IKeyRegistry} from "../../../interfaces/implementations/key-registries/IKeyRegistry.sol";

contract KeyRegistry is KeyManager, IKeyRegistry {
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
        OzEIP712InitParams memory ozEip712InitParams
    ) public virtual initializer {
        __KeyManager_init();
        __OzEIP712_init(ozEip712InitParams);
    }
}
