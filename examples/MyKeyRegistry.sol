// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyRegistry} from "../src/modules/key-registry/KeyRegistry.sol";

/// @title MyKeyRegistry
/// @notice Example implementation of the KeyRegistry contract.
contract MyKeyRegistry is KeyRegistry {
    function initialize(KeyRegistryInitParams memory keyRegistryInitParams) public virtual initializer {
        __KeyRegistry_init(keyRegistryInitParams);
    }
}
