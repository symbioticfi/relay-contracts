// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbiotic/interfaces/common/IEntity.sol";
import {IVetoSlasher} from "@symbiotic/interfaces/slasher/IVetoSlasher.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";
import {ISlasher} from "@symbiotic/interfaces/slasher/ISlasher.sol";
import {IOperatorSpecificDelegator} from "@symbiotic/interfaces/delegator/IOperatorSpecificDelegator.sol";
import {IOperatorNetworkSpecificDelegator} from "@symbiotic/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";

import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {OperatorManager} from "./OperatorManager.sol";

import {StakeVotingPowerManager} from "./extendable/StakeVotingPowerManager.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {Hints} from "../libraries/utils/Hints.sol";
import {VaultManagerLogic} from "../libraries/logic/VaultManagerLogic.sol";

import {IVaultManager} from "../interfaces/managers/IVaultManager.sol";

/**
 * @title VaultManager
 * @notice Abstract contract for managing vaults and their relationships with operators
 * @dev Extends BaseManager and provides functionality for registering, pausing, and managing vaults
 */
abstract contract VaultManager is OperatorManager, StakeVotingPowerManager, IVaultManager {
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    using EnumerableMap for EnumerableMap.AddressToAddressMap;
    using EnumerableSet for EnumerableSet.AddressSet;
    using Subnetwork for address;
    using Subnetwork for bytes32;
    using Checkpoints for Checkpoints.Trace208;
    using Hints for bytes[];

    error NotVault();
    error NotOperatorVault();
    error VaultNotInitialized();
    error VaultAlreadyRegistered();
    error VaultEpochTooShort();
    error InactiveOperatorSlash();
    error InactiveVaultSlash();
    error UnknownSlasherType();
    error NonVetoSlasher();
    error NoSlasher();
    error TooOldTimestampSlash();
    error NotSharedVault();
    error NotOperatorSpecificVault();
    error InvalidOperatorNetwork();
    error InvalidSharedVault();
    error InvalidVault();
    error InvalidOperatorVault();
    error OperatorNotAdded();
    error VaultNotRegistered();
    error OperatorVaultNotRegistered();
    error VaultNotPaused();

    address public immutable VAULT_FACTORY;

    constructor(
        address operatorRegistry,
        address operatorNetworkOptInService,
        address vaultFactory
    ) OperatorManager(operatorRegistry, operatorNetworkOptInService) {
        VAULT_FACTORY = vaultFactory;
    }

    /**
     * @notice Initializes the VaultManager with required parameters
     */
    function __VaultManager_init_private(
        uint48 slashingWindow
    ) internal virtual onlyInitializing {
        VaultManagerLogic.initialize(slashingWindow);
    }

    function _getSlashingWindow() internal view virtual returns (uint48) {
        return VaultManagerLogic.getSlashingWindow();
    }

    function _isVaultUnpaused(
        address vault
    ) internal view virtual returns (bool) {
        return VaultManagerLogic.isVaultUnpaused(vault);
    }

    function _isVaultUnpausedAt(
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) internal view virtual returns (bool) {
        return VaultManagerLogic.isVaultUnpausedAt(vault, timestamp, hint);
    }

    function _isSharedVaultRegistered(
        address vault
    ) internal view virtual returns (bool) {
        return VaultManagerLogic.isSharedVaultRegistered(vault);
    }

    /**
     * @notice Gets the total number of shared vaults
     * @return uint256 The count of shared vaults
     */
    function _sharedVaultsLength() internal view virtual returns (uint256) {
        return VaultManagerLogic.sharedVaultsLength();
    }

    function _getSharedVaults() internal view virtual returns (address[] memory) {
        return VaultManagerLogic.getSharedVaults();
    }

    function _getActiveSharedVaultsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (address[] memory activeSharedVaults) {
        return VaultManagerLogic.getActiveSharedVaultsAt(timestamp, hints);
    }

    function _getActiveSharedVaults() internal view virtual returns (address[] memory activeSharedVaults) {
        return VaultManagerLogic.getActiveSharedVaults();
    }

    function _isOperatorVaultRegistered(address operator, address vault) internal view virtual returns (bool) {
        return VaultManagerLogic.isOperatorVaultRegistered(operator, vault);
    }

    function _getOperatorVaultsLength(
        address operator
    ) internal view virtual returns (uint256) {
        return VaultManagerLogic.operatorVaultsLength(operator);
    }

    function _getOperatorVaults(
        address operator
    ) internal view virtual returns (address[] memory) {
        return VaultManagerLogic.getOperatorVaults(operator);
    }

    function _getActiveOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (address[] memory activeOperatorVaults) {
        return VaultManagerLogic.getActiveOperatorVaultsAt(operator, timestamp, hints);
    }

    function _getActiveOperatorVaults(
        address operator
    ) internal view virtual returns (address[] memory activeOperatorVaults) {
        return VaultManagerLogic.getActiveOperatorVaults(operator);
    }

    /**
     * @notice Gets the stake amount for an operator in a vault at a specific timestamp
     * @param timestamp The timestamp to check
     * @param operator The operator address
     * @param vault The vault address
     * @return uint256 The stake amount at the timestamp
     */
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

    /**
     * @notice Gets the votingPower amount for an operator in a vault at a specific timestamp
     * @param timestamp The timestamp to check
     * @param operator The operator address
     * @param vault The vault address
     * @return uint256 The votingPower amount at the timestamp
     * @dev Doesn't consider active statuses.
     */
    function _getOperatorVotingPowerAt(
        address vault,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) internal view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorVotingPowerAt(this.stakeToVotingPower, vault, operator, timestamp, hints);
    }

    function _getOperatorVotingPower(address vault, address operator) internal view virtual returns (uint256) {
        return VaultManagerLogic.getOperatorVotingPower(this.stakeToVotingPower, vault, operator);
    }

    /**
     * @notice Gets the total votingPower amount for an operator across all vaults
     * @param operator The operator address
     * @return votingPower The total votingPower amount
     */
    function _getOperatorVotingPowerAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) internal view virtual returns (uint256 votingPower) {
        return VaultManagerLogic.getOperatorVotingPowerAt(this.stakeToVotingPower, operator, timestamp, hints);
    }

    function _getOperatorVotingPower(
        address operator
    ) internal view virtual returns (uint256 votingPower) {
        return VaultManagerLogic.getOperatorVotingPower(this.stakeToVotingPower, operator);
    }

    function _getOperatorVotingPowersAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) internal view virtual returns (VaultVotingPower[] memory vaultVotingPowers) {
        return VaultManagerLogic.getOperatorVotingPowersAt(this.stakeToVotingPower, operator, timestamp, hints);
    }

    function _getOperatorVotingPowers(
        address operator
    ) internal view virtual returns (VaultVotingPower[] memory vaultVotingPowers) {
        return VaultManagerLogic.getOperatorVotingPowers(this.stakeToVotingPower, operator);
    }

    function _getVotingPowersAt(
        uint48 timestamp,
        bytes memory hints
    ) internal view virtual returns (OperatorVotingPower[] memory operatorVotingPowers) {
        return VaultManagerLogic.getVotingPowersAt(this.stakeToVotingPower, timestamp, hints);
    }

    function _getVotingPowers() internal view virtual returns (OperatorVotingPower[] memory operatorVotingPowers) {
        return VaultManagerLogic.getVotingPowers(this.stakeToVotingPower);
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
     * @notice Pauses a vault
     * @param vault The vault address to pause
     */
    function _pauseVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.pauseVault(vault);
    }

    /**
     * @notice Unpauses a vault
     * @param vault The vault address to unpause
     */
    function _unpauseVault(
        address vault
    ) internal virtual {
        VaultManagerLogic.unpauseVault(vault);
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
}
