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
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    using EnumerableMap for EnumerableMap.AddressToAddressMap;
    using EnumerableSet for EnumerableSet.AddressSet;
    using Subnetwork for address;
    using Subnetwork for bytes32;
    using Checkpoints for Checkpoints.Trace208;

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
    function isTokenRegistered(
        address token
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isTokenRegistered(token);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isTokenActive(
        address token
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isTokenActive(token);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isTokenActiveAt(address token, uint48 timestamp, bytes memory hint) public view virtual returns (bool) {
        return VaultManagerLogic.isTokenActiveAt(token, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getAllTokensLength() public view virtual returns (uint256) {
        return VaultManagerLogic.getAllTokensLength();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getAllTokens() public view virtual returns (address[] memory) {
        return VaultManagerLogic.getAllTokens();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveTokensAt(uint48 timestamp, bytes[] memory hints) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getActiveTokensAt(timestamp, hints);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveTokens() public view virtual returns (address[] memory) {
        return VaultManagerLogic.getActiveTokens();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveTokensLength() public view virtual returns (uint256) {
        return VaultManagerLogic.getActiveTokensLength();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveTokensLengthAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return VaultManagerLogic.getActiveTokensLengthAt(timestamp, hint);
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
    function isSharedVaultActive(
        address vault
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isSharedVaultActive(vault);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isSharedVaultActiveAt(
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isSharedVaultActiveAt(vault, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getAllSharedVaultsLength() public view virtual returns (uint256) {
        return VaultManagerLogic.getAllSharedVaultsLength();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getAllSharedVaults() public view virtual returns (address[] memory) {
        return VaultManagerLogic.getAllSharedVaults();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveSharedVaultsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getActiveSharedVaultsAt(timestamp, hints);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveSharedVaults() public view virtual returns (address[] memory) {
        return VaultManagerLogic.getActiveSharedVaults();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveSharedVaultsLength() public view virtual returns (uint256) {
        return VaultManagerLogic.getActiveSharedVaultsLength();
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveSharedVaultsLengthAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return VaultManagerLogic.getActiveSharedVaultsLengthAt(timestamp, hint);
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
    function isOperatorVaultActive(address operator, address vault) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorVaultActive(operator, vault);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function isOperatorVaultActiveAt(
        address operator,
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return VaultManagerLogic.isOperatorVaultActiveAt(operator, vault, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getAllOperatorVaultsLength(
        address operator
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getAllOperatorVaultsLength(operator);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getAllOperatorVaults(
        address operator
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getAllOperatorVaults(operator);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getActiveOperatorVaultsAt(operator, timestamp, hints);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveOperatorVaults(
        address operator
    ) public view virtual returns (address[] memory) {
        return VaultManagerLogic.getActiveOperatorVaults(operator);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveOperatorVaultsLengthAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getActiveOperatorVaultsLengthAt(operator, timestamp, hint);
    }

    /**
     * @inheritdoc IVaultManager
     */
    function getActiveOperatorVaultsLength(
        address operator
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getActiveOperatorVaultsLength(operator);
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
    ) public view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorStakeAt(vault, operator, timestamp, hints);
    }

    function _getOperatorStake(address vault, address operator) internal view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorStake(vault, operator);
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

    /**
     * @notice Registers a new shared vault
     * @param vault The vault address to register
     */
    function _registerSharedVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.registerSharedVault(VAULT_FACTORY, vault);
    }

    /**
     * @notice Registers a new operator vault
     * @param operator The operator address
     * @param vault The vault address to register
     */
    function _registerOperatorVault(address operator, address vault) internal virtual {
        VaultManagerLogic.registerOperatorVault(VAULT_FACTORY, operator, vault);
    }

    /**
     * @notice Unregisters a shared vault
     * @param vault The vault address to unregister
     */
    function _unregisterSharedVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.unregisterSharedVault(vault);
    }

    /**
     * @notice Unregisters an operator vault
     * @param operator The operator address
     * @param vault The vault address to unregister
     */
    function _unregisterOperatorVault(address operator, address vault) internal virtual {
        VaultManagerLogic.unregisterOperatorVault(operator, vault);
    }

    /**
     * @notice Slashes a vault based on provided conditions
     * @param timestamp The timestamp when the slash occurs
     * @param vault The vault address
     * @param operator The operator to slash
     * @param amount The amount to slash
     * @param hints Additional data for the slasher
     * @return success True if the slash was executed successfully, false otherwise
     * @return response index for veto slashing or amount for instant slashing
     */
    function _slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal virtual returns (bool success, bytes memory response) {
        return VaultManagerLogic.slashVault(timestamp, vault, operator, amount, hints);
    }

    /**
     * @notice Executes a veto-based slash for a vault
     * @param vault The vault address
     * @param slashIndex The index of the slash to execute
     * @param hints Additional data for the veto slasher
     * @return success True if the slash was executed successfully, false otherwise
     * @return slashedAmount The amount that was slashed
     */
    function _executeSlash(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) internal virtual returns (bool success, uint256 slashedAmount) {
        return VaultManagerLogic.executeSlash(vault, slashIndex, hints);
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
