// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbioticfi/core/src/interfaces/common/IEntity.sol";
import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";
import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";
import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IOperatorSpecificDelegator} from "@symbioticfi/core/src/interfaces/delegator/IOperatorSpecificDelegator.sol";
import {IOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";

import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {NetworkManager} from "./NetworkManager.sol";

import {VotingPowerCalcManager} from "./VotingPowerCalcManager.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {VaultManagerLogic} from "./logic/VaultManagerLogic.sol";

import {IVaultManager} from "../../interfaces/base/IVaultManager.sol";

abstract contract VaultManager is NetworkManager, VotingPowerCalcManager, IVaultManager {
    /**
     * @inheritdoc IVaultManager
     */
    function VaultManager_VERSION() public pure returns (uint64) {
        return VaultManagerLogic.VaultManager_VERSION;
    }

    /**
     * @inheritdoc IVaultManager
     */
    address public immutable OPERATOR_REGISTRY;

    /**
     * @inheritdoc IVaultManager
     */
    address public immutable VAULT_FACTORY;

    constructor(address operatorRegistry, address vaultFactory) {
        OPERATOR_REGISTRY = operatorRegistry;
        VAULT_FACTORY = vaultFactory;
    }

    function __VaultManager_init(
        VaultManagerInitParams memory initParams
    ) internal virtual onlyInitializing {
        VaultManagerLogic.initialize(initParams);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getSlashingWindow() public view virtual returns (uint48) {
        return VaultManagerLogic.getSlashingWindow();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isTokenRegisteredAt(
        address token,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isTokenRegisteredAt(token, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isTokenRegistered(
        address token
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isTokenRegistered(token);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getTokensAt(
        uint48 timestamp
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getTokensAt(timestamp);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getTokens() public view virtual returns (address[] memory) {
        return VaultManagerLogic.getTokens();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getTokensLength() public view virtual returns (uint256) {
        return VaultManagerLogic.getTokensLength();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isOperatorRegisteredAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorRegisteredAt(operator, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isOperatorRegistered(
        address operator
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorRegistered(operator);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorsAt(
        uint48 timestamp
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getOperatorsAt(timestamp);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperators() public view virtual returns (address[] memory) {
        return VaultManagerLogic.getOperators();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorsLength() public view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorsLength();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isSharedVaultRegisteredAt(
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isSharedVaultRegisteredAt(vault, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isSharedVaultRegistered(
        address vault
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isSharedVaultRegistered(vault);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getSharedVaultsAt(
        uint48 timestamp
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getSharedVaultsAt(timestamp);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getSharedVaults() public view virtual returns (address[] memory) {
        return VaultManagerLogic.getSharedVaults();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getSharedVaultsLength() public view virtual returns (uint256) {
        return VaultManagerLogic.getSharedVaultsLength();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isOperatorVaultRegisteredAt(
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorVaultRegisteredAt(vault, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isOperatorVaultRegistered(
        address vault
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorVaultRegistered(vault);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isOperatorVaultRegisteredAt(
        address operator,
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorVaultRegisteredAt(operator, vault, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isOperatorVaultRegistered(address operator, address vault) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorVaultRegistered(operator, vault);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVaultsAt(address operator, uint48 timestamp) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getOperatorVaultsAt(operator, timestamp);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVaults(
        address operator
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getOperatorVaults(operator);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVaultsLength(
        address operator
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorVaultsLength(operator);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPowerAt(
        address operator,
        address vault,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorVotingPowerAt(operator, vault, extraData, timestamp, hints);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPower(
        address operator,
        address vault,
        bytes memory extraData
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorVotingPower(operator, vault, extraData);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPowersAt(
        address operator,
        bytes memory extraData,
        uint48 timestamp
    ) public view virtual returns (VaultVotingPower[] memory) {
        return VaultManagerLogic.getOperatorVotingPowersAt(operator, extraData, timestamp);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPowers(
        address operator,
        bytes memory extraData
    ) public view virtual returns (VaultVotingPower[] memory) {
        return VaultManagerLogic.getOperatorVotingPowers(operator, extraData);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getVotingPowersAt(
        bytes[] memory extraData,
        uint48 timestamp
    ) public view virtual returns (OperatorVotingPower[] memory) {
        return VaultManagerLogic.getVotingPowersAt(extraData, timestamp);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getVotingPowers(
        bytes[] memory extraData
    ) public view virtual returns (OperatorVotingPower[] memory) {
        return VaultManagerLogic.getVotingPowers(extraData);
    }

    function _getOperatorStakeAt(
        address vault,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) internal view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorStakeAt(vault, operator, timestamp, hints);
    }

    function _getOperatorStake(address vault, address operator) internal view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorStake(vault, operator);
    }

    function _setSlashingWindow(
        uint48 slashingWindow
    ) internal virtual {
        VaultManagerLogic.setSlashingWindow(slashingWindow);
    }

    function _registerToken(
        address token
    ) internal virtual {
        VaultManagerLogic.registerToken(token);
    }

    function _unregisterToken(
        address token
    ) internal virtual {
        VaultManagerLogic.unregisterToken(token);
    }

    function _registerOperator(
        address operator
    ) internal virtual {
        VaultManagerLogic.registerOperator(operator);
    }

    function _unregisterOperator(
        address operator
    ) internal virtual {
        VaultManagerLogic.unregisterOperator(operator);
    }

    function _registerSharedVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.registerSharedVault(vault);
    }

    function _registerOperatorVault(address operator, address vault) internal virtual {
        VaultManagerLogic.registerOperatorVault(operator, vault);
    }

    function _unregisterSharedVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.unregisterSharedVault(vault);
    }

    function _unregisterOperatorVault(address operator, address vault) internal virtual {
        VaultManagerLogic.unregisterOperatorVault(operator, vault);
    }
}
