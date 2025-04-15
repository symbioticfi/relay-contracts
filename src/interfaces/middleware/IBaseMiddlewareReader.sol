// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBaseMiddleware} from "./IBaseMiddleware.sol";

interface IBaseMiddlewareReader {
    /**
     * @notice Gets the network address
     * @return The network address
     */
    function NETWORK() external view returns (address);

    /**
     * @notice Gets the slashing window
     * @return The slashing window
     */
    function SLASHING_WINDOW() external view returns (uint48);

    /**
     * @notice Gets the vault registry address
     * @return The vault registry address
     */
    function VAULT_REGISTRY() external view returns (address);

    /**
     * @notice Gets the operator registry address
     * @return The operator registry address
     */
    function OPERATOR_REGISTRY() external view returns (address);

    /**
     * @notice Gets the operator net opt-in address
     * @return The operator net opt-in address
     */
    function OPERATOR_NET_OPTIN() external view returns (address);

    /**
     * @notice Gets the number of operators
     * @return The number of operators
     */
    function operatorsLength() external view returns (uint256);

    /**
     * @notice Gets the operator and its times at a specific position
     * @param pos The position
     * @return The operator address, start time, and end time
     */
    function operatorWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48);

    /**
     * @notice Gets the list of active operators
     * @return The list of active operators
     */
    function activeOperators() external view returns (address[] memory);

    /**
     * @notice Gets the list of active operators at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active operators
     */
    function activeOperatorsAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    /**
     * @notice Checks if an operator was active at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return True if the operator was active at the timestamp, false otherwise
     */
    function operatorWasActiveAt(uint48 timestamp, address operator) external view returns (bool);

    /**
     * @notice Checks if an operator is registered
     * @param operator The operator address
     * @return True if the operator is registered, false otherwise
     */
    function isOperatorRegistered(
        address operator
    ) external view returns (bool);

    /**
     * @notice Gets the number of subnetworks
     * @return The number of subnetworks
     */
    function subnetworksLength() external view returns (uint256);

    /**
     * @notice Gets the subnetwork and its times at a specific position
     * @param pos The position
     * @return The subnetwork address, start time, and end time
     */
    function subnetworkWithTimesAt(
        uint256 pos
    ) external view returns (uint160, uint48, uint48);

    /**
     * @notice Gets the list of active subnetworks
     * @return The list of active subnetworks
     */
    function activeSubnetworks() external view returns (uint160[] memory);

    /**
     * @notice Gets the list of active subnetworks at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active subnetworks
     */
    function activeSubnetworksAt(
        uint48 timestamp
    ) external view returns (uint160[] memory);

    /**
     * @notice Checks if a subnetwork was active at a specific timestamp
     * @param timestamp The timestamp
     * @param subnetwork The subnetwork address
     * @return True if the subnetwork was active at the timestamp, false otherwise
     */
    function subnetworkWasActiveAt(uint48 timestamp, uint96 subnetwork) external view returns (bool);

    /**
     * @notice Gets the number of shared vaults
     * @return The number of shared vaults
     */
    function sharedVaultsLength() external view returns (uint256);

    /**
     * @notice Gets the shared vault and its times at a specific position
     * @param pos The position
     * @return The shared vault address, start time, and end time
     */
    function sharedVaultWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48);

    /**
     * @notice Gets the list of active shared vaults
     * @return The list of active shared vaults
     */
    function activeSharedVaults() external view returns (address[] memory);

    /**
     * @notice Gets the list of active shared vaults at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active shared vaults
     */
    function activeSharedVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    /**
     * @notice Gets the number of operator vaults
     * @param operator The operator address
     * @return The number of operator vaults
     */
    function operatorVaultsLength(
        address operator
    ) external view returns (uint256);

    /**
     * @notice Gets the operator vault and its times at a specific position
     * @param operator The operator address
     * @param pos The position
     * @return The operator vault address, start time, and end time
     */
    function operatorVaultWithTimesAt(address operator, uint256 pos) external view returns (address, uint48, uint48);

    /**
     * @notice Gets the list of active operator vaults
     * @param operator The operator address
     * @return The list of active operator vaults
     */
    function activeOperatorVaults(
        address operator
    ) external view returns (address[] memory);

    /**
     * @notice Gets the list of active operator vaults at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return The list of active operator vaults
     */
    function activeOperatorVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory);

    /**
     * @notice Gets the list of active vaults
     * @return The list of active vaults
     */
    function activeVaults() external view returns (address[] memory);

    /**
     * @notice Gets the list of active vaults at a specific timestamp
     * @param timestamp The timestamp
     * @return The list of active vaults
     */
    function activeVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    /**
     * @notice Gets the list of active vaults for a specific operator
     * @param operator The operator address
     * @return The list of active vaults
     */
    function activeVaults(
        address operator
    ) external view returns (address[] memory);

    /**
     * @notice Gets the list of active vaults for a specific operator at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return The list of active vaults
     */
    function activeVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory);

    /**
     * @notice Checks if a vault was active at a specific timestamp for a specific operator
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vault The vault address
     * @return True if the vault was active at the timestamp for the operator, false otherwise
     */
    function vaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool);

    /**
     * @notice Checks if a shared vault was active at a specific timestamp
     * @param timestamp The timestamp
     * @param vault The shared vault address
     * @return True if the shared vault was active at the timestamp, false otherwise
     */
    function sharedVaultWasActiveAt(uint48 timestamp, address vault) external view returns (bool);

    /**
     * @notice Checks if an operator vault was active at a specific timestamp for a specific operator
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vault The vault address
     * @return True if the operator vault was active at the timestamp for the operator, false otherwise
     */
    function operatorVaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool);

    /**
     * @notice Gets the power of an operator for a specific vault and subnetwork
     * @param operator The operator address
     * @param vault The vault address
     * @param subnetwork The subnetwork address
     * @return The power of the operator for the vault and subnetwork
     */
    function getOperatorPower(address operator, address vault, uint96 subnetwork) external view returns (uint256);

    /**
     * @notice Gets the power of an operator for a specific vault and subnetwork at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vault The vault address
     * @param subnetwork The subnetwork address
     * @return The power of the operator for the vault and subnetwork at the timestamp
     */
    function getOperatorPowerAt(
        uint48 timestamp,
        address operator,
        address vault,
        uint96 subnetwork
    ) external view returns (uint256);

    /**
     * @notice Gets the power of an operator
     * @param operator The operator address
     * @return The power of the operator
     */
    function getOperatorPower(
        address operator
    ) external view returns (uint256);

    /**
     * @notice Gets the power of an operator at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @return The power of the operator at the timestamp
     */
    function getOperatorPowerAt(uint48 timestamp, address operator) external view returns (uint256);

    /**
     * @notice Gets the power of an operator for a list of vaults and subnetworks
     * @param operator The operator address
     * @param vaults The list of vault addresses
     * @param subnetworks The list of subnetwork addresses
     * @return The power of the operator for the list of vaults and subnetworks
     */
    function getOperatorPower(
        address operator,
        address[] memory vaults,
        uint160[] memory subnetworks
    ) external view returns (uint256);

    /**
     * @notice Gets the power of an operator for a list of vaults and subnetworks at a specific timestamp
     * @param timestamp The timestamp
     * @param operator The operator address
     * @param vaults The list of vault addresses
     * @param subnetworks The list of subnetwork addresses
     * @return The power of the operator for the list of vaults and subnetworks at the timestamp
     */
    function getOperatorPowerAt(
        uint48 timestamp,
        address operator,
        address[] memory vaults,
        uint160[] memory subnetworks
    ) external view returns (uint256);

    /**
     * @notice Gets the total power of a list of operators
     * @param operators The list of operator addresses
     * @return The total power of the list of operators
     */
    function totalPower(
        address[] memory operators
    ) external view returns (uint256);
}
