// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../managers/VaultManager.sol";
import {OperatorManager} from "../managers/OperatorManager.sol";
import {AccessManager} from "../managers/extendable/AccessManager.sol";

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
    // This constant aggregates changes of all not extendable managers
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
        __NetworkManager_init_private(network, subnetworkID);
        __OperatorManager_init_private();
        __VaultManager_init_private(slashingWindow);
    }

    /**
     * @notice Gets the network address
     * @return The network address
     */
    function NETWORK() external view returns (address) {
        return _NETWORK();
    }

    /**
     * @notice Gets the subnetwork identifier
     * @return The subnetwork identifier
     */
    function SUBNETWORK_IDENTIFIER() external view returns (uint96) {
        return _SUBNETWORK_IDENTIFIER();
    }

    /**
     * @notice Gets the subnetwork
     * @return The subnetwork
     */
    function SUBNETWORK() external view returns (bytes32) {
        return _SUBNETWORK();
    }

    function getOldestNeededTimestamp() external view returns (uint48) {
        return _getOldestNeededTimestamp();
    }

    function getOperators() external view returns (address[] memory) {
        return _getOperators();
    }

    function isOperatorRegistered(
        address operator
    ) external view returns (bool) {
        return _isOperatorRegistered(operator);
    }

    function isOperatorUnpaused(
        address operator
    ) external view returns (bool) {
        return _isOperatorUnpaused(operator);
    }

    function isOperatorUnpausedAt(address operator, uint48 timestamp, bytes memory hint) external view returns (bool) {
        return _isOperatorUnpausedAt(operator, timestamp, hint);
    }

    function getActiveOperatorsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory) {
        return _getActiveOperatorsAt(timestamp, hints);
    }

    function getSlashingWindow() external view returns (uint48) {
        return _getSlashingWindow();
    }

    function isVaultUnpaused(
        address vault
    ) external view returns (bool) {
        return _isVaultUnpaused(vault);
    }

    function isVaultUnpausedAt(address vault, uint48 timestamp, bytes memory hint) external view returns (bool) {
        return _isVaultUnpausedAt(vault, timestamp, hint);
    }

    function isSharedVaultRegistered(
        address sharedVault
    ) external view returns (bool) {
        return _isSharedVaultRegistered(sharedVault);
    }

    function getSharedVaults() external view returns (address[] memory) {
        return _getSharedVaults();
    }

    function getActiveSharedVaultsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory) {
        return _getActiveSharedVaultsAt(timestamp, hints);
    }

    function isOperatorVaultRegistered(address operator, address vault) external view returns (bool) {
        return _isOperatorVaultRegistered(operator, vault);
    }

    function getOperatorVaults(
        address operator
    ) external view returns (address[] memory) {
        return _getOperatorVaults(operator);
    }

    function getActiveOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) external view returns (address[] memory) {
        return _getActiveOperatorVaultsAt(operator, timestamp, hints);
    }

    function getOperatorVotingPowerAt(
        address vault,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (uint256) {
        return _getOperatorVotingPowerAt(vault, operator, timestamp, hints);
    }

    function getOperatorVotingPowerAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (uint256) {
        return _getOperatorVotingPowerAt(operator, timestamp, hints);
    }

    function getOperatorVotingPowersAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (VaultVotingPower[] memory vaultVotingPowers) {
        return _getOperatorVotingPowersAt(operator, timestamp, hints);
    }

    function getVotingPowersAt(
        uint48 timestamp,
        bytes memory hints
    ) external view returns (OperatorVotingPower[] memory operatorVotingPowers) {
        return _getVotingPowersAt(timestamp, hints);
    }
}
