// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../managers/VaultManager.sol";
import {OperatorManager} from "../managers/OperatorManager.sol";
import {AccessManager} from "../managers/AccessManager.sol";
import {KeyManager} from "../managers/KeyManager.sol";

/**
 * @title BaseMiddleware
 * @notice Abstract base contract that combines core manager functionality
 * @dev Inherits from VaultManager, OperatorManager, AccessManager and KeyManager to provide
 *      comprehensive middleware capabilities for vault and operator management, access control,
 *      and key management
 */
abstract contract BaseMiddleware is VaultManager, OperatorManager, AccessManager, KeyManager {}
