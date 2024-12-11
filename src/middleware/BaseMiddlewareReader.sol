// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "./BaseMiddleware.sol";
import {NoAccessManager} from "../extensions/managers/access/NoAccessManager.sol";
import {NoKeyManager} from "../extensions/managers/keys/NoKeyManager.sol";

/**
 * @title BaseMiddlewareReader
 * @notice A helper contract for view functions that combines core manager functionality
 * @dev This contract serves as a foundation for building custom middleware by providing essential
 * management capabilities that can be extended with additional functionality.
 */
contract BaseMiddlewareReader is BaseMiddleware, NoAccessManager, NoKeyManager {
    /**
     * @notice Gets the capture timestamp from the middleware
     * @return timestamp The capture timestamp
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return BaseMiddleware(_getMiddleware()).getCaptureTimestamp();
    }

    /**
     * @notice Converts stake amount to voting power using a 1:1 ratio
     * @param vault The vault address (unused in this implementation)
     * @param stake The stake amount
     * @return power The calculated voting power (equal to stake)
     */
    function stakeToPower(address vault, uint256 stake) public view override returns (uint256 power) {
        return BaseMiddleware(_getMiddleware()).stakeToPower(vault, stake);
    }

    /**
     * @notice Gets the network address
     * @return The network address
     */
    function NETWORK() external view returns (address) {
        return _NETWORK();
    }

    /**
     * @notice Gets the slashing window
     * @return The slashing window
     */
    function SLASHING_WINDOW() external view returns (uint48) {
        return _SLASHING_WINDOW();
    }

    /**
     * @notice Gets the vault registry address
     * @return The vault registry address
     */
    function VAULT_REGISTRY() external view returns (address) {
        return _VAULT_REGISTRY();
    }

    /**
     * @notice Gets the operator registry address
     * @return The operator registry address
     */
    function OPERATOR_REGISTRY() external view returns (address) {
        return _OPERATOR_REGISTRY();
    }

    /**
     * @notice Gets the operator net opt-in address
     * @return The operator net opt-in address
     */
    function OPERATOR_NET_OPTIN() external view returns (address) {
        return _OPERATOR_NET_OPTIN();
    }

    /**
     * @notice Gets the number of operators
     * @return The number of operators
     */
    function operatorsLength() external view returns (uint256) {
        return _operatorsLength();
    }

    /**
     * @notice Gets the operator and its times at a specific position
     * @param pos The position
     * @return The operator address, start time, and end time
     */
    function operatorWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48) {
        return _operatorWithTimesAt(pos);
    }

    /**
     * @notice Gets the list of active operators
     * @return The list of active operators
     */
    function activeOperators() external view returns (address[] memory) {
        return _activeOperators();
    }

    /**
     * @notice Gets the list of active operators at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active operators at the given timestamp
     */
    function activeOperatorsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeOperatorsAt(timestamp);
    }

    /**
     * @notice Checks if an operator was active at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return True if the operator was active at the given timestamp, false otherwise
     */
    function operatorWasActiveAt(uint48 timestamp, address operator) external view returns (bool) {
        return _operatorWasActiveAt(timestamp, operator);
    }

    /**
     * @notice Checks if an operator is registered
     * @param operator The operator address
     * @return True if the operator is registered, false otherwise
     */
    function isOperatorRegistered(
        address operator
    ) external view returns (bool) {
        return _isOperatorRegistered(operator);
    }

    /**
     * @notice Gets the number of subnetworks
     * @return The number of subnetworks
     */
    function subnetworksLength() external view returns (uint256) {
        return _subnetworksLength();
    }

    /**
     * @notice Gets the subnetwork and its times at a specific position
     * @param pos The position
     * @return The subnetwork address, start time, and end time
     */
    function subnetworkWithTimesAt(
        uint256 pos
    ) external view returns (uint160, uint48, uint48) {
        return _subnetworkWithTimesAt(pos);
    }

    /**
     * @notice Gets the list of active subnetworks
     * @return The list of active subnetworks
     */
    function activeSubnetworks() external view returns (uint160[] memory) {
        return _activeSubnetworks();
    }

    /**
     * @notice Gets the list of active subnetworks at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active subnetworks at the given timestamp
     */
    function activeSubnetworksAt(
        uint48 timestamp
    ) external view returns (uint160[] memory) {
        return _activeSubnetworksAt(timestamp);
    }

    /**
     * @notice Checks if a subnetwork was active at a specific timestamp
     * @param timestamp The timestamp
     * @param subnetwork The subnetwork address
     * @return True if the subnetwork was active at the given timestamp, false otherwise
     */
    function subnetworkWasActiveAt(uint48 timestamp, uint96 subnetwork) external view returns (bool) {
        return _subnetworkWasActiveAt(timestamp, subnetwork);
    }

    /**
     * @notice Gets the number of shared vaults
     * @return The number of shared vaults
     */
    function sharedVaultsLength() external view returns (uint256) {
        return _sharedVaultsLength();
    }

    /**
     * @notice Gets the shared vault and its times at a specific position
     * @param pos The position
     * @return The shared vault address, start time, and end time
     */
    function sharedVaultWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48) {
        return _sharedVaultWithTimesAt(pos);
    }

    /**
     * @notice Gets the list of active shared vaults
     * @return The list of active shared vaults
     */
    function activeSharedVaults() external view returns (address[] memory) {
        return _activeSharedVaults();
    }

    /**
     * @notice Gets the list of active shared vaults at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active shared vaults at the given timestamp
     */
    function activeSharedVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeSharedVaultsAt(timestamp);
    }

    /**
     * @notice Gets the number of vaults for a specific operator
     * @param operator The operator address
     * @return The number of vaults for the given operator
     */
    function operatorVaultsLength(
        address operator
    ) external view returns (uint256) {
        return _operatorVaultsLength(operator);
    }

    /**
     * @notice Gets the operator vault and its times at a specific position
     * @param operator The operator address
     * @param pos The position
     * @return The operator vault address, start time, and end time
     */
    function operatorVaultWithTimesAt(address operator, uint256 pos) external view returns (address, uint48, uint48) {
        return _operatorVaultWithTimesAt(operator, pos);
    }

    /**
     * @notice Gets the list of active vaults for a specific operator
     * @param operator The operator address
     * @return The list of active vaults for the given operator
     */
    function activeOperatorVaults(
        address operator
    ) external view returns (address[] memory) {
        return _activeOperatorVaults(operator);
    }

    /**
     * @notice Gets the list of active vaults for a specific operator at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return The list of active vaults for the given operator at the given timestamp
     */
    function activeOperatorVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory) {
        return _activeOperatorVaultsAt(timestamp, operator);
    }

    /**
     * @notice Gets the list of active vaults
     * @return The list of active vaults
     */
    function activeVaults() external view returns (address[] memory) {
        return _activeVaults();
    }

    /**
     * @notice Gets the list of active vaults at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active vaults at the given timestamp
     */
    function activeVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeVaultsAt(timestamp);
    }

    /**
     * @notice Gets the list of active vaults for a specific operator
     * @param operator The operator address
     * @return The list of active vaults for the given operator
     */
    function activeVaults(
        address operator
    ) external view returns (address[] memory) {
        return _activeVaults(operator);
    }

    /**
     * @notice Gets the list of active vaults for a specific operator at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return The list of active vaults for the given operator at the given timestamp
     */
    function activeVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory) {
        return _activeVaultsAt(timestamp, operator);
    }

    /**
     * @notice Checks if a vault was active at a specific timestamp for a specific operator
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vault The vault address
     * @return True if the vault was active at the given timestamp for the given operator, false otherwise
     */
    function vaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool) {
        return _vaultWasActiveAt(timestamp, operator, vault);
    }

    /**
     * @notice Checks if a shared vault was active at a specific timestamp
     * @param timestamp The timestamp
     * @param vault The shared vault address
     * @return True if the shared vault was active at the given timestamp, false otherwise
     */
    function sharedVaultWasActiveAt(uint48 timestamp, address vault) external view returns (bool) {
        return _sharedVaultWasActiveAt(timestamp, vault);
    }

    /**
     * @notice Checks if an operator vault was active at a specific timestamp for a specific operator
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vault The vault address
     * @return True if the operator vault was active at the given timestamp for the given operator, false otherwise
     */
    function operatorVaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool) {
        return _operatorVaultWasActiveAt(timestamp, operator, vault);
    }

    /**
     * @notice Gets the power of an operator for a specific vault and subnetwork
     * @param operator The operator address
     * @param vault The vault address
     * @param subnetwork The subnetwork address
     * @return The power of the operator for the given vault and subnetwork
     */
    function getOperatorPower(address operator, address vault, uint96 subnetwork) external view returns (uint256) {
        return _getOperatorPower(operator, vault, subnetwork);
    }

    /**
     * @notice Gets the power of an operator for a specific vault and subnetwork at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vault The vault address
     * @param subnetwork The subnetwork address
     * @return The power of the operator for the given vault and subnetwork at the given timestamp
     */
    function getOperatorPowerAt(
        uint48 timestamp,
        address operator,
        address vault,
        uint96 subnetwork
    ) external view returns (uint256) {
        return _getOperatorPowerAt(timestamp, operator, vault, subnetwork);
    }

    /**
     * @notice Gets the power of an operator
     * @param operator The operator address
     * @return The power of the operator
     */
    function getOperatorPower(
        address operator
    ) external view returns (uint256) {
        return _getOperatorPower(operator);
    }

    /**
     * @notice Gets the power of an operator at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return The power of the operator at the given timestamp
     */
    function getOperatorPowerAt(uint48 timestamp, address operator) external view returns (uint256) {
        return _getOperatorPowerAt(timestamp, operator);
    }

    /**
     * @notice Gets the power of an operator for specific vaults and subnetworks
     * @param operator The operator address
     * @param vaults The list of vault addresses
     * @param subnetworks The list of subnetwork addresses
     * @return The power of the operator for the given vaults and subnetworks
     */
    function getOperatorPower(
        address operator,
        address[] memory vaults,
        uint160[] memory subnetworks
    ) external view returns (uint256) {
        return _getOperatorPower(operator, vaults, subnetworks);
    }

    /**
     * @notice Gets the power of an operator for specific vaults and subnetworks at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vaults The list of vault addresses
     * @param subnetworks The list of subnetwork addresses
     * @return The power of the operator for the given vaults and subnetworks at the given timestamp
     */
    function getOperatorPowerAt(
        uint48 timestamp,
        address operator,
        address[] memory vaults,
        uint160[] memory subnetworks
    ) external view returns (uint256) {
        return _getOperatorPowerAt(timestamp, operator, vaults, subnetworks);
    }

    /**
     * @notice Gets the total power of a list of operators
     * @param operators The list of operator addresses
     * @return The total power of the given operators
     */
    function totalPower(
        address[] memory operators
    ) external view returns (uint256) {
        return _totalPower(operators);
    }

    /**
     * @notice Gets the middleware address from the calldata
     * @return The middleware address
     */
    function _getMiddleware() private pure returns (address) {
        address middleware;
        assembly {
            middleware := shr(96, calldataload(sub(calldatasize(), 20)))
        }
        return middleware;
    }
}
