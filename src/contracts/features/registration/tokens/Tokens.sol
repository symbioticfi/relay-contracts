// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../base/VaultManager.sol";
import {PermissionManager} from "../../../base/PermissionManager.sol";

import {ITokens} from "../../../../interfaces/features/registration/tokens/ITokens.sol";

abstract contract Tokens is VaultManager, PermissionManager, ITokens {
    /**
     * @inheritdoc ITokens
     */
    uint64 public constant Tokens_VERSION = 1;

    function __Tokens_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc ITokens
     */
    function registerToken(
        address token
    ) public virtual checkPermission {
        _registerToken(token);
    }

    /**
     * @inheritdoc ITokens
     */
    function unregisterToken(
        address token
    ) public virtual checkPermission {
        _unregisterToken(token);
    }
}
