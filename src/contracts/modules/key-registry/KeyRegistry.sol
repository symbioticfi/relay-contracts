// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../base/KeyManager.sol";

import {IKeyRegistry} from "../../../interfaces/modules/key-registry/IKeyRegistry.sol";

contract KeyRegistry is KeyManager, IKeyRegistry {
    /**
     * @inheritdoc IKeyRegistry
     */
    uint64 public constant KeyRegistry_VERSION = 1;

    function __KeyRegistry_init(
        KeyRegistryInitParams memory keyRegistryInitParams
    ) public virtual onlyInitializing {
        __KeyManager_init();
        __OzEIP712_init(keyRegistryInitParams.ozEip712InitParams);
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
    function getOperatorsAt(
        uint48 timestamp
    ) public view virtual returns (address[] memory) {
        return _getKeysOperatorsAt(timestamp);
    }

    /**
     * @inheritdoc IKeyRegistry
     */
    function getOperators() public view virtual returns (address[] memory) {
        return _getKeysOperators();
    }
}
