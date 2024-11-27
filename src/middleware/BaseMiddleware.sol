// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../managers/VaultManager.sol";
import {OperatorManager} from "../managers/OperatorManager.sol";
import {AccessManager} from "../managers/AccessManager.sol";
import {KeyManager} from "../managers/KeyManager.sol";

/**
 * @title BaseMiddleware
 * @notice Abstract base contract that combines core manager functionality for building middleware
 * @dev Inherits from VaultManager, OperatorManager, AccessManager and KeyManager to provide:
 *      - Vault management and registration
 *      - Operator management and registration
 *      - Access control and permissions
 *      - Key storage and management
 *
 * This contract serves as a foundation for building custom middleware by providing essential
 * management capabilities that can be extended with additional functionality.
 */
abstract contract BaseMiddleware is VaultManager, OperatorManager, AccessManager, KeyManager {}
