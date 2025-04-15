// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVaultManager} from "../managers/IVaultManager.sol";
import {IPermissionManager} from "../managers/extendable/IPermissionManager.sol";
import {IKeyManager} from "../managers/extendable/IKeyManager.sol";

interface IBaseMiddleware {
    /**
     * @notice Returns the version of the BaseMiddleware contract
     * @return The version number
     * @dev This version aggregates changes of all not extendable managers
     */
    function BaseMiddleware_VERSION() external view returns (uint64);
}
