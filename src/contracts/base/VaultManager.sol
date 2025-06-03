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

import {OperatorManager} from "./OperatorManager.sol";

import {StakeToVotingPowerManager} from "./StakeToVotingPowerManager.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {VaultManagerLogic} from "./logic/VaultManagerLogic.sol";

import {IVaultManager} from "../../interfaces/base/IVaultManager.sol";

abstract contract VaultManager is OperatorManager, StakeToVotingPowerManager, IVaultManager {
    /**
     * @inheritdoc IVaultManager
     */
    function VaultManager_VERSION() public pure returns (uint64) {
        return VaultManagerLogic.VaultManager_VERSION;
    }

    /**
     * @inheritdoc IVaultManager
     */
    address public immutable VAULT_FACTORY;

    constructor(address operatorRegistry, address vaultFactory) OperatorManager(operatorRegistry) {
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
    function getTokensAt(uint48 timestamp, bytes[] memory hints) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getTokensAt(timestamp, hints);
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
    function getSharedVaultsAt(uint48 timestamp, bytes[] memory hints) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getSharedVaultsAt(timestamp, hints);
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
    function getOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getOperatorVaultsAt(operator, timestamp, hints);
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
        return VaultManagerLogic.getOperatorVotingPowerAt(
            this.stakeToVotingPowerAt, operator, vault, extraData, timestamp, hints
        );
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPower(
        address operator,
        address vault,
        bytes memory extraData
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorVotingPower(this.stakeToVotingPower, operator, vault, extraData);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPowerAt(
        address operator,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (uint256) {
        return
            VaultManagerLogic.getOperatorVotingPowerAt(this.stakeToVotingPowerAt, operator, extraData, timestamp, hints);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPower(address operator, bytes memory extraData) public view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorVotingPower(this.stakeToVotingPower, operator, extraData);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPowersAt(
        address operator,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (VaultVotingPower[] memory) {
        return VaultManagerLogic.getOperatorVotingPowersAt(
            this.stakeToVotingPowerAt, operator, extraData, timestamp, hints
        );
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getOperatorVotingPowers(
        address operator,
        bytes memory extraData
    ) public view virtual returns (VaultVotingPower[] memory) {
        return VaultManagerLogic.getOperatorVotingPowers(this.stakeToVotingPower, operator, extraData);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getTotalVotingPowerAt(
        bytes[] memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getTotalVotingPowerAt(this.stakeToVotingPowerAt, extraData, timestamp, hints);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getTotalVotingPower(
        bytes[] memory extraData
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getTotalVotingPower(this.stakeToVotingPower, extraData);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getVotingPowersAt(
        bytes[] memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (OperatorVotingPower[] memory) {
        return VaultManagerLogic.getVotingPowersAt(this.stakeToVotingPowerAt, extraData, timestamp, hints);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getVotingPowers(
        bytes[] memory extraData
    ) public view virtual returns (OperatorVotingPower[] memory) {
        return VaultManagerLogic.getVotingPowers(this.stakeToVotingPower, extraData);
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

    function _registerSharedVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.registerSharedVault(VAULT_FACTORY, vault);
    }

    function _registerOperatorVault(address operator, address vault) internal virtual {
        VaultManagerLogic.registerOperatorVault(VAULT_FACTORY, operator, vault);
    }

    function _unregisterSharedVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.unregisterSharedVault(vault);
    }

    function _unregisterOperatorVault(address operator, address vault) internal virtual {
        VaultManagerLogic.unregisterOperatorVault(operator, vault);
    }

    function _slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal virtual returns (bool success, bytes memory response) {
        return VaultManagerLogic.slashVault(timestamp, vault, operator, amount, hints);
    }

    function _slash(
        uint48 timestamp,
        address slasher,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal virtual returns (bool success, bytes memory response) {
        return VaultManagerLogic.slash(timestamp, slasher, operator, amount, hints);
    }

    function _executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) internal virtual returns (bool success, uint256 slashedAmount) {
        return VaultManagerLogic.executeSlashVault(vault, slashIndex, hints);
    }

    function _executeSlash(
        address slasher,
        uint256 slashIndex,
        bytes memory hints
    ) internal virtual returns (bool success, uint256 slashedAmount) {
        return VaultManagerLogic.executeSlash(slasher, slashIndex, hints);
    }

    function _distributeStakerRewards(
        address stakerRewards,
        address token,
        uint256 amount,
        bytes memory data
    ) internal virtual {
        VaultManagerLogic.distributeStakerRewards(stakerRewards, token, amount, data);
    }

    function _distributeOperatorRewards(
        address operatorRewards,
        address token,
        uint256 amount,
        bytes32 root
    ) internal virtual {
        VaultManagerLogic.distributeOperatorRewards(operatorRewards, token, amount, root);
    }
}
