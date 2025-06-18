// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "./BaseMiddleware.sol";
import {NoPermissionManager} from "../extensions/managers/permissions/NoPermissionManager.sol";
import {NoKeyManager} from "../extensions/managers/keys/NoKeyManager.sol";

import {IBaseMiddlewareReader} from "../interfaces/middleware/IBaseMiddlewareReader.sol";
import {ICaptureTimestampManager} from "../interfaces/managers/extendable/ICaptureTimestampManager.sol";
import {IStakePowerManager} from "../interfaces/managers/extendable/IStakePowerManager.sol";

/**
 * @title BaseMiddlewareReader
 * @notice A helper contract for view functions that combines core manager functionality
 * @dev This contract serves as a foundation for building custom middleware by providing essential
 * management capabilities that can be extended with additional functionality.
 */
contract BaseMiddlewareReader is BaseMiddleware, NoPermissionManager, NoKeyManager, IBaseMiddlewareReader {
    /**
     * @inheritdoc ICaptureTimestampManager
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return BaseMiddleware(address(this)).getCaptureTimestamp();
    }

    /**
     * @inheritdoc IStakePowerManager
     */
    function stakeToPower(address vault, uint256 stake) public view override returns (uint256 power) {
        return BaseMiddleware(address(this)).stakeToPower(vault, stake);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function NETWORK() external view returns (address) {
        return _NETWORK();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function SLASHING_WINDOW() external view returns (uint48) {
        return _SLASHING_WINDOW();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function VAULT_REGISTRY() external view returns (address) {
        return _VAULT_REGISTRY();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function OPERATOR_REGISTRY() external view returns (address) {
        return _OPERATOR_REGISTRY();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function OPERATOR_NET_OPTIN() external view returns (address) {
        return _OPERATOR_NET_OPTIN();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function operatorsLength() external view returns (uint256) {
        return _operatorsLength();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function operatorWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48) {
        return _operatorWithTimesAt(pos);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeOperators() external view returns (address[] memory) {
        return _activeOperators();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeOperatorsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeOperatorsAt(timestamp);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function operatorWasActiveAt(uint48 timestamp, address operator) external view returns (bool) {
        return _operatorWasActiveAt(timestamp, operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function isOperatorRegistered(
        address operator
    ) external view returns (bool) {
        return _isOperatorRegistered(operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function subnetworksLength() external view returns (uint256) {
        return _subnetworksLength();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function subnetworkWithTimesAt(
        uint256 pos
    ) external view returns (uint160, uint48, uint48) {
        return _subnetworkWithTimesAt(pos);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeSubnetworks() external view returns (uint160[] memory) {
        return _activeSubnetworks();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeSubnetworksAt(
        uint48 timestamp
    ) external view returns (uint160[] memory) {
        return _activeSubnetworksAt(timestamp);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function subnetworkWasActiveAt(uint48 timestamp, uint96 subnetwork) external view returns (bool) {
        return _subnetworkWasActiveAt(timestamp, subnetwork);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function sharedVaultsLength() external view returns (uint256) {
        return _sharedVaultsLength();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function sharedVaultWithTimesAt(
        uint256 pos
    ) external view returns (address, uint48, uint48) {
        return _sharedVaultWithTimesAt(pos);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeSharedVaults() external view returns (address[] memory) {
        return _activeSharedVaults();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeSharedVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeSharedVaultsAt(timestamp);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function operatorVaultsLength(
        address operator
    ) external view returns (uint256) {
        return _operatorVaultsLength(operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function operatorVaultWithTimesAt(address operator, uint256 pos) external view returns (address, uint48, uint48) {
        return _operatorVaultWithTimesAt(operator, pos);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeOperatorVaults(
        address operator
    ) external view returns (address[] memory) {
        return _activeOperatorVaults(operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeOperatorVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory) {
        return _activeOperatorVaultsAt(timestamp, operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeVaults() external view returns (address[] memory) {
        return _activeVaults();
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory) {
        return _activeVaultsAt(timestamp);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeVaults(
        address operator
    ) external view returns (address[] memory) {
        return _activeVaults(operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function activeVaultsAt(uint48 timestamp, address operator) external view returns (address[] memory) {
        return _activeVaultsAt(timestamp, operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function vaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool) {
        return _vaultWasActiveAt(timestamp, operator, vault);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function sharedVaultWasActiveAt(uint48 timestamp, address vault) external view returns (bool) {
        return _sharedVaultWasActiveAt(timestamp, vault);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function operatorVaultWasActiveAt(uint48 timestamp, address operator, address vault) external view returns (bool) {
        return _operatorVaultWasActiveAt(timestamp, operator, vault);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function getOperatorPower(address operator, address vault, uint96 subnetwork) external view returns (uint256) {
        return _getOperatorPower(operator, vault, subnetwork);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
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
     * @inheritdoc IBaseMiddlewareReader
     */
    function getOperatorPower(
        address operator
    ) external view returns (uint256) {
        return _getOperatorPower(operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function getOperatorPowerAt(uint48 timestamp, address operator) external view returns (uint256) {
        return _getOperatorPowerAt(timestamp, operator);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
     */
    function getOperatorPower(
        address operator,
        address[] memory vaults,
        uint160[] memory subnetworks
    ) external view returns (uint256) {
        return _getOperatorPower(operator, vaults, subnetworks);
    }

    /**
     * @inheritdoc IBaseMiddlewareReader
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
     * @inheritdoc IBaseMiddlewareReader
     */
    function totalPower(
        address[] memory operators
    ) external view returns (uint256) {
        return _totalPower(operators);
    }
}
