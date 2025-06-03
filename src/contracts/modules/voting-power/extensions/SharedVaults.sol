// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ISharedVaults} from "../../../../interfaces/modules/voting-power/extensions/ISharedVaults.sol";
import {VotingPowerProvider} from "../VotingPowerProvider.sol";

abstract contract SharedVaults is VotingPowerProvider, ISharedVaults {
    /**
     * @inheritdoc ISharedVaults
     */
    uint64 public constant SharedVaults_VERSION = 1;

    function __SharedVaults_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc ISharedVaults
     */
    function registerSharedVault(
        address sharedVault
    ) public virtual checkPermission {
        _registerSharedVault(sharedVault);
    }

    /**
     * @inheritdoc ISharedVaults
     */
    function unregisterSharedVault(
        address sharedVault
    ) public virtual checkPermission {
        _unregisterSharedVault(sharedVault);
    }
}
