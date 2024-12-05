// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../managers/base/VaultManager.sol";
import {OperatorManager} from "../managers/base/OperatorManager.sol";
import {AccessManager} from "../managers/base/AccessManager.sol";
import {KeyManager} from "../managers/base/KeyManager.sol";

/**
 * @title BaseMiddleware
 * @notice Abstract base contract that combines core manager functionality for building middleware
 * @dev Inherits from VaultManager, OperatorManager, AccessManager, and KeyManager to provide:
 *      - Vault management and registration
 *      - Operator management and registration
 *      - Access management
 *      - Key management
 *
 * This contract serves as a foundation for building custom middleware by providing essential
 * management capabilities that can be extended with additional functionality.
 */
abstract contract BaseMiddleware is VaultManager, OperatorManager, AccessManager, KeyManager {}
