// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "./base/VaultManager.sol";
import {OperatorManager} from "./base/OperatorManager.sol";
import {AccessManager} from "./base/abstracts/AccessManager.sol";

/**
 * @title BaseMiddleware
 * @notice Abstract base contract that combines core manager functionality for building middleware
 * @dev Inherits from VaultManager, OperatorManager, and AccessManager to provide:
 *      - Vault management and registration
 *      - Operator management and registration
 *      - Access management
 *
 * This contract serves as a foundation for building custom middleware by providing essential
 * management capabilities that can be extended with additional functionality.
 */
abstract contract BaseMiddleware is VaultManager, AccessManager {
    // This constant aggregates changes of all not abstracts managers
    uint64 public constant BaseMiddleware_VERSION = 1;

    constructor(
        address operatorRegistry,
        address operatorNetworkOptInService,
        address vaultFactory
    ) VaultManager(operatorRegistry, operatorNetworkOptInService, vaultFactory) {}

    /**
     * @notice Initializes the BaseMiddleware contract with required dependencies and parameters
     * @dev This internal initialization function sets up core storage and manager components
     * @param network The address of the network contract
     * @param slashingWindow The duration of the slashing window in blocks
     */
    function __BaseMiddleware_init(
        address network,
        uint96 subnetworkID,
        uint48 slashingWindow
    ) internal onlyInitializing {
        __NetworkManager_init(network, subnetworkID);
        __OperatorManager_init();
        __VaultManager_init(slashingWindow);
    }
}
