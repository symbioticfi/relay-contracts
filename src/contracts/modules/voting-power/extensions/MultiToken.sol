// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../base/VaultManager.sol";
import {PermissionManager} from "../../../base/PermissionManager.sol";

import {IMultiToken} from "../../../../interfaces/modules/voting-power/extensions/IMultiToken.sol";

abstract contract MultiToken is VaultManager, PermissionManager, IMultiToken {
    /**
     * @inheritdoc IMultiToken
     */
    uint64 public constant MultiToken_VERSION = 1;

    function __MultiToken_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc IMultiToken
     */
    function registerToken(
        address token
    ) public virtual checkPermission {
        _registerToken(token);
    }

    /**
     * @inheritdoc IMultiToken
     */
    function unregisterToken(
        address token
    ) public virtual checkPermission {
        _unregisterToken(token);
    }
}
