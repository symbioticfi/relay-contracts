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
        __NetworkManager_init(network, subnetworkID);
        __OperatorManager_init();
        __VaultManager_init(slashingWindow);
    }

    function getAllOperatorsLength() external view returns (uint256) {
        return _getAllOperatorsLength();
    }

    function getAllOperators() external view returns (address[] memory) {
        return _getAllOperators();
    }

    function isOperatorActive(
        address operator
    ) external view returns (bool) {
        return _isOperatorActive(operator);
    }

    function isOperatorRegistered(
        address operator
    ) external view returns (bool) {
        return _isOperatorRegistered(operator);
    }

    function isOperatorActiveAt(address operator, uint48 timestamp, bytes memory hint) external view returns (bool) {
        return _isOperatorActiveAt(operator, timestamp, hint);
    }

    function getActiveOperators() external view returns (address[] memory) {
        return _getActiveOperators();
    }

    function getActiveOperatorsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory) {
        return _getActiveOperatorsAt(timestamp, hints);
    }

    function getActiveOperatorsLength() external view returns (uint256) {
        return _getActiveOperatorsLength();
    }

    function getActiveOperatorsLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint256) {
        return _getActiveOperatorsLengthAt(timestamp, hint);
    }

    function getSlashingWindow() external view returns (uint48) {
        return _getSlashingWindow();
    }

    function isTokenRegistered(
        address token
    ) external view returns (bool) {
        return _isTokenRegistered(token);
    }

    function isTokenActive(
        address token
    ) external view returns (bool) {
        return _isTokenActive(token);
    }

    function isTokenActiveAt(address token, uint48 timestamp, bytes memory hint) external view returns (bool) {
        return _isTokenActiveAt(token, timestamp, hint);
    }

    function getAllTokensLength() external view returns (uint256) {
        return _getAllTokensLength();
    }

    function getAllTokens() external view returns (address[] memory) {
        return _getAllTokens();
    }

    function getActiveTokensAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory) {
        return _getActiveTokensAt(timestamp, hints);
    }

    function getActiveTokens() external view returns (address[] memory) {
        return _getActiveTokens();
    }

    function getActiveTokensLength() external view returns (uint256) {
        return _getActiveTokensLength();
    }

    function getActiveTokensLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint256) {
        return _getActiveTokensLengthAt(timestamp, hint);
    }

    function isSharedVaultRegistered(
        address vault
    ) external view returns (bool) {
        return _isSharedVaultRegistered(vault);
    }

    function isSharedVaultActive(
        address vault
    ) external view returns (bool) {
        return _isSharedVaultActive(vault);
    }

    function isSharedVaultActiveAt(address vault, uint48 timestamp, bytes memory hint) external view returns (bool) {
        return _isSharedVaultActiveAt(vault, timestamp, hint);
    }

    function getAllSharedVaultsLength() external view returns (uint256) {
        return _getAllSharedVaultsLength();
    }

    function getAllSharedVaults() external view returns (address[] memory) {
        return _getAllSharedVaults();
    }

    function getActiveSharedVaultsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory) {
        return _getActiveSharedVaultsAt(timestamp, hints);
    }

    function getActiveSharedVaults() external view returns (address[] memory) {
        return _getActiveSharedVaults();
    }

    function getActiveSharedVaultsLength() external view returns (uint256) {
        return _getActiveSharedVaultsLength();
    }

    function getActiveSharedVaultsLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint256) {
        return _getActiveSharedVaultsLengthAt(timestamp, hint);
    }

    function isOperatorVaultRegistered(address operator, address vault) external view returns (bool) {
        return _isOperatorVaultRegistered(operator, vault);
    }

    function isOperatorVaultActive(address operator, address vault) external view returns (bool) {
        return _isOperatorVaultActive(operator, vault);
    }

    function isOperatorVaultActiveAt(
        address operator,
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool) {
        return _isOperatorVaultActiveAt(operator, vault, timestamp, hint);
    }

    function getAllOperatorVaultsLength(
        address operator
    ) external view returns (uint256) {
        return _getAllOperatorVaultsLength(operator);
    }

    function getAllOperatorVaults(
        address operator
    ) external view returns (address[] memory) {
        return _getAllOperatorVaults(operator);
    }

    function getActiveOperatorVaults(
        address operator
    ) external view returns (address[] memory) {
        return _getActiveOperatorVaults(operator);
    }

    function getActiveOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) external view returns (address[] memory) {
        return _getActiveOperatorVaultsAt(operator, timestamp, hints);
    }

    function getActiveOperatorVaultsLength(
        address operator
    ) external view returns (uint256) {
        return _getActiveOperatorVaultsLength(operator);
    }

    function getActiveOperatorVaultsLengthAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (uint256) {
        return _getActiveOperatorVaultsLengthAt(operator, timestamp, hint);
    }

    function getOperatorStakeAt(
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
