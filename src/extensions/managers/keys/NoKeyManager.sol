// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";

import {INoKeyManager} from "../../../interfaces/extensions/managers/keys/INoKeyManager.sol";
import {IKeyManager} from "../../../interfaces/managers/extendable/IKeyManager.sol";

/**
 * @title NoKeyManager
 * @notice A middleware extension that provides no key storage functionality
 * @dev This contract implements the KeyManager interface but does not provide any key storage functionality.
 */
abstract contract NoKeyManager is KeyManager, INoKeyManager {
    /**
     * @inheritdoc INoKeyManager
     */
    uint64 public constant NoKeyManager_VERSION = 1;

    /**
     * @inheritdoc IKeyManager
     */
    function operatorByKey(
        bytes memory key
    ) public view override returns (address) {}

    /**
     * @inheritdoc IKeyManager
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {}

    /**
     * @inheritdoc IKeyManager
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key) public view override returns (bool) {}

    /**
     * @inheritdoc KeyManager
     */
    function _updateKey(address operator, bytes memory key) internal virtual override {}
}
