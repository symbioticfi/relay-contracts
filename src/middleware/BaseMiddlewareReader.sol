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
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return BaseMiddleware(_getMiddleware()).getCaptureTimestamp();
    }

    function stakeToPower(address vault, uint256 stake) public view override returns (uint256 power) {
        return BaseMiddleware(_getMiddleware()).stakeToPower(vault, stake);
    }

    function NETWORK() external view returns (address) {
        return _NETWORK();
    }

    function SLASHING_WINDOW() external view returns (uint48) {
        return _SLASHING_WINDOW();
    }

    function VAULT_REGISTRY() external view returns (address) {
        return _VAULT_REGISTRY();
    }

    function OPERATOR_REGISTRY() external view returns (address) {
        return _OPERATOR_REGISTRY();
    }

    function OPERATOR_NET_OPTIN() external view returns (address) {
        return _OPERATOR_NET_OPTIN();
    }

    function operatorsLength() external view returns (uint256) {
        return _operatorsLength();
    }

    function operatorWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48) {
        return _operatorWithTimesAt(pos);
    }

    function activeOperators() external view returns (address[] memory) {
        return _activeOperators();
    }

    function activeOperatorsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeOperatorsAt(timestamp);
    }

    function operatorWasActiveAt(uint48 timestamp, address operator) external view returns (bool) {
        return _operatorWasActiveAt(timestamp, operator);
    }

    function isOperatorRegistered(
        address operator
    ) external view returns (bool) {
        return _isOperatorRegistered(operator);
    }

    function subnetworksLength() external view returns (uint256) {
        return _subnetworksLength();
    }

    function subnetworkWithTimesAt(
        uint256 pos
    ) external view returns (uint160, uint48, uint48) {
        return _subnetworkWithTimesAt(pos);
    }

    function activeSubnetworks() external view returns (uint160[] memory) {
        return _activeSubnetworks();
    }

    function activeSubnetworksAt(
        uint48 timestamp
    ) external view returns (uint160[] memory) {
        return _activeSubnetworksAt(timestamp);
    }

    function subnetworkWasActiveAt(uint48 timestamp, uint96 subnetwork) external view returns (bool) {
        return _subnetworkWasActiveAt(timestamp, subnetwork);
    }

    function sharedVaultsLength() external view returns (uint256) {
        return _sharedVaultsLength();
    }

    function sharedVaultWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48) {
        return _sharedVaultWithTimesAt(pos);
    }

    function activeSharedVaults() external view returns (address[] memory) {
        return _activeSharedVaults();
    }

    function activeSharedVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeSharedVaultsAt(timestamp);
    }

    function operatorVaultsLength(
        address operator
    ) external view returns (uint256) {
        return _operatorVaultsLength(operator);
    }

    function operatorVaultWithTimesAt(address operator, uint256 pos) external view returns (address, uint48, uint48) {
        return _operatorVaultWithTimesAt(operator, pos);
    }

    function activeOperatorVaults(
        address operator
    ) external view returns (address[] memory) {
        return _activeOperatorVaults(operator);
    }

    function activeOperatorVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory) {
        return _activeOperatorVaultsAt(timestamp, operator);
    }

    function activeVaults() external view returns (address[] memory) {
        return _activeVaults();
    }

    function activeVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeVaultsAt(timestamp);
    }

    function activeVaults(
        address operator
    ) external view returns (address[] memory) {
        return _activeVaults(operator);
    }

    function activeVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory) {
        return _activeVaultsAt(timestamp, operator);
    }

    function vaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool) {
        return _vaultWasActiveAt(timestamp, operator, vault);
    }

    function sharedVaultWasActiveAt(uint48 timestamp, address vault) external view returns (bool) {
        return _sharedVaultWasActiveAt(timestamp, vault);
    }

    function operatorVaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool) {
        return _operatorVaultWasActiveAt(timestamp, operator, vault);
    }

    function getOperatorPower(address operator, address vault, uint96 subnetwork) external view returns (uint256) {
        return _getOperatorPower(operator, vault, subnetwork);
    }

    function getOperatorPowerAt(
        uint48 timestamp,
        address operator,
        address vault,
        uint96 subnetwork
    ) external view returns (uint256) {
        return _getOperatorPowerAt(timestamp, operator, vault, subnetwork);
    }

    function getOperatorPower(
        address operator
    ) external view returns (uint256) {
        return _getOperatorPower(operator);
    }

    function getOperatorPowerAt(uint48 timestamp, address operator) external view returns (uint256) {
        return _getOperatorPowerAt(timestamp, operator);
    }

    function getOperatorPower(
        address operator,
        address[] memory vaults,
        uint160[] memory subnetworks
    ) external view returns (uint256) {
        return _getOperatorPower(operator, vaults, subnetworks);
    }

    function getOperatorPowerAt(
        uint48 timestamp,
        address operator,
        address[] memory vaults,
        uint160[] memory subnetworks
    ) external view returns (uint256) {
        return _getOperatorPowerAt(timestamp, operator, vaults, subnetworks);
    }

    function totalPower(
        address[] memory operators
    ) external view returns (uint256) {
        return _totalPower(operators);
    }

    function _getMiddleware() private view returns (address) {
        address middleware;
        assembly {
            middleware := shr(96, calldataload(sub(calldatasize(), 20)))
        }
        return middleware;
    }
}
