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

/**
 * @title VaultManager
 * @notice Abstract contract for managing vaults and their relationships with operators
 * @dev Extends BaseManager and provides functionality for registering, pausing, and managing vaults
 */
abstract contract VaultManager is OperatorManager, StakeVotingPowerManager {
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

    struct VaultVotingPower {
        address vault;
        uint256 votingPower;
    }

    struct OperatorVotingPower {
        address operator;
        VaultVotingPower[] vaults;
    }

    struct OperatorVotingPowerHints {
        bytes[] activeSharedVaultsHints;
        bytes[] sharedVaultsVotingPowerHints;
        bytes[] activeOperatorVaultsHints;
        bytes[] operatorVaultsVotingPowerHints;
    }

    struct OperatorVotingPowersHints {
        bytes[] activeSharedVaultsHints;
        bytes[] sharedVaultsVotingPowerHints;
        bytes[] activeOperatorVaultsHints;
        bytes[] operatorVaultsVotingPowerHints;
    }

    struct VotingPowersHints {
        bytes[] activeOperatorsHints;
        bytes[] operatorVotingPowersHints;
    }

    struct SlashVaultHints {
        bytes operatorUnpausedHint;
        bytes vaultUnpausedHint;
        bytes slashHints;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
    struct VaultManagerStorage {
        EnumerableSet.AddressSet _sharedVaults;
        mapping(address operator => EnumerableSet.AddressSet) _operatorVaults;
        EnumerableSet.AddressSet _allOperatorVaults;
        mapping(address vault => Checkpoints.Trace208) _vaultStatuses;
        uint48 _slashingWindow;
    }

    event InstantSlash(address vault, address operator, uint256 slashedAmount);
    event VetoSlash(address vault, address operator, uint256 slashIndex);

    enum SlasherType {
        INSTANT, // Instant slasher type
        VETO // Veto slasher type

    }

    enum DelegatorType {
        NETWORK_RESTAKE,
        FULL_RESTAKE,
        OPERATOR_SPECIFIC,
        OPERATOR_NETWORK_SPECIFIC
    }

    address public immutable VAULT_FACTORY;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.VaultManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant VaultManagerStorageLocation =
        0x485f0695561726d087d0cb5cf546efed37ef61dfced21455f1ba7eb5e5b3db00;

    constructor(
        address operatorRegistry,
        address operatorNetworkOptInService,
        address vaultFactory
    ) OperatorManager(operatorRegistry, operatorNetworkOptInService) {
        VAULT_FACTORY = vaultFactory;
    }

    /**
     * @notice Internal helper to access the VaultManager storage struct
     * @dev Uses assembly to load storage location from a constant slot
     * @return $ Storage pointer to the VaultManagerStorage struct
     */
    function _getVaultManagerStorage() internal pure returns (VaultManagerStorage storage $) {
        assembly {
            $.slot := VaultManagerStorageLocation
        }
    }

    /**
     * @notice Initializes the VaultManager with required parameters
     */
    function __VaultManager_init_private(
        uint48 slashingWindow
    ) internal onlyInitializing {
        _getVaultManagerStorage()._slashingWindow = slashingWindow;
    }

    function _getSlashingWindow() internal view returns (uint48) {
        return _getVaultManagerStorage()._slashingWindow;
    }

    function _isVaultUnpaused(
        address vault
    ) internal view returns (bool) {
        return _getVaultManagerStorage()._vaultStatuses[vault].latest() > 0;
    }

    function _isVaultUnpausedAt(address vault, uint48 timestamp, bytes memory hint) internal view returns (bool) {
        return _getVaultManagerStorage()._vaultStatuses[vault].upperLookupRecent(timestamp, hint) > 0;
    }

    function _isSharedVaultRegistered(
        address vault
    ) internal view returns (bool) {
        return _getVaultManagerStorage()._sharedVaults.contains(vault);
    }

    /**
     * @notice Gets the total number of shared vaults
     * @return uint256 The count of shared vaults
     */
    function _sharedVaultsLength() internal view returns (uint256) {
        return _getVaultManagerStorage()._sharedVaults.length();
    }

    function _getSharedVaults() internal view returns (address[] memory) {
        return _getVaultManagerStorage()._sharedVaults.values();
    }

    function _getActiveSharedVaultsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view returns (address[] memory activeSharedVaults) {
        address[] memory registeredSharedVaults = _getSharedVaults();
        uint256 registeredSharedVaultsLength = registeredSharedVaults.length;
        activeSharedVaults = new address[](registeredSharedVaultsLength);
        hints = hints.normalize(registeredSharedVaultsLength);
        uint256 length;
        for (uint256 i; i < registeredSharedVaultsLength; ++i) {
            if (_isVaultUnpausedAt(registeredSharedVaults[i], timestamp, hints[i])) {
                activeSharedVaults[length++] = registeredSharedVaults[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeSharedVaults, length)
        }
    }

    function _isOperatorVaultRegistered(address operator, address vault) internal view returns (bool) {
        return _getVaultManagerStorage()._operatorVaults[operator].contains(vault);
    }

    function _getOperatorVaultsLength(
        address operator
    ) internal view returns (uint256) {
        return _getVaultManagerStorage()._operatorVaults[operator].length();
    }

    function _getOperatorVaults(
        address operator
    ) internal view returns (address[] memory) {
        return _getVaultManagerStorage()._operatorVaults[operator].values();
    }

    function _getActiveOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) internal view returns (address[] memory activeOperatorVaults) {
        address[] memory registeredOperatorVaults = _getOperatorVaults(operator);
        uint256 registeredOperatorVaultsLength = registeredOperatorVaults.length;
        activeOperatorVaults = new address[](registeredOperatorVaultsLength);
        hints = hints.normalize(registeredOperatorVaultsLength);
        uint256 length;
        for (uint256 i; i < registeredOperatorVaultsLength; ++i) {
            if (_isVaultUnpausedAt(registeredOperatorVaults[i], timestamp, hints[i])) {
                activeOperatorVaults[length++] = registeredOperatorVaults[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeOperatorVaults, length)
        }
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
    ) internal view returns (uint256) {
        return IBaseDelegator(IVault(vault).delegator()).stakeAt(_SUBNETWORK(), operator, timestamp, hints);
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
    ) internal view returns (uint256) {
        return _stakeToVotingPower(vault, _getOperatorStakeAt(vault, operator, timestamp, hints));
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
    ) internal view returns (uint256 votingPower) {
        OperatorVotingPowerHints memory operatorVotingPowerHints;
        if (hints.length > 0) {
            operatorVotingPowerHints = abi.decode(hints, (OperatorVotingPowerHints));
        }

        address[] memory sharedVaults =
            _getActiveSharedVaultsAt(timestamp, operatorVotingPowerHints.activeSharedVaultsHints);
        for (uint256 i; i < sharedVaults.length; ++i) {
            votingPower += _getOperatorVotingPowerAt(
                sharedVaults[i], operator, timestamp, operatorVotingPowerHints.sharedVaultsVotingPowerHints[i]
            );
        }
        address[] memory operatorVaults =
            _getActiveOperatorVaultsAt(operator, timestamp, operatorVotingPowerHints.activeOperatorVaultsHints);
        for (uint256 i; i < operatorVaults.length; ++i) {
            votingPower += _getOperatorVotingPowerAt(
                operatorVaults[i], operator, timestamp, operatorVotingPowerHints.operatorVaultsVotingPowerHints[i]
            );
        }
    }

    function _getOperatorVotingPowersAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) internal view returns (VaultVotingPower[] memory vaultVotingPowers) {
        OperatorVotingPowersHints memory operatorVotingPowersHints;
        if (hints.length > 0) {
            operatorVotingPowersHints = abi.decode(hints, (OperatorVotingPowersHints));
        }

        uint256 length;
        address[] memory sharedVaults =
            _getActiveSharedVaultsAt(timestamp, operatorVotingPowersHints.activeSharedVaultsHints);
        address[] memory operatorVaults =
            _getActiveOperatorVaultsAt(operator, timestamp, operatorVotingPowersHints.activeOperatorVaultsHints);
        vaultVotingPowers = new VaultVotingPower[](sharedVaults.length + operatorVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            uint256 votingPower_ = _getOperatorVotingPowerAt(
                sharedVaults[i], operator, timestamp, operatorVotingPowersHints.sharedVaultsVotingPowerHints[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] = VaultVotingPower({vault: sharedVaults[i], votingPower: votingPower_});
            }
        }
        for (uint256 i; i < operatorVaults.length; ++i) {
            uint256 votingPower_ = _getOperatorVotingPowerAt(
                operatorVaults[i], operator, timestamp, operatorVotingPowersHints.operatorVaultsVotingPowerHints[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] = VaultVotingPower({vault: operatorVaults[i], votingPower: votingPower_});
            }
        }

        assembly ("memory-safe") {
            mstore(vaultVotingPowers, length)
        }
    }

    function _getVotingPowersAt(
        uint48 timestamp,
        bytes memory hints
    ) internal view returns (OperatorVotingPower[] memory operatorVotingPowers) {
        VotingPowersHints memory votingPowersHints;
        if (hints.length > 0) {
            votingPowersHints = abi.decode(hints, (VotingPowersHints));
        }

        uint256 length;
        address[] memory operators = _getActiveOperatorsAt(timestamp, votingPowersHints.activeOperatorsHints);
        operatorVotingPowers = new OperatorVotingPower[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            VaultVotingPower[] memory votingPowers =
                _getOperatorVotingPowersAt(operators[i], timestamp, votingPowersHints.operatorVotingPowersHints[i]);
            if (votingPowers.length > 0) {
                operatorVotingPowers[length++] = OperatorVotingPower({operator: operators[i], vaults: votingPowers});
            }
        }
        assembly ("memory-safe") {
            mstore(operatorVotingPowers, length)
        }
    }

    /**
     * @notice Registers a new shared vault
     * @param vault The vault address to register
     */
    function _registerSharedVault(
        address vault
    ) internal {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(vault)) {
            revert InvalidVault();
        }
        if (!_validateSharedVault(vault)) {
            revert InvalidSharedVault();
        }
        if ($._allOperatorVaults.contains(vault)) {
            revert VaultAlreadyRegistered();
        }
        if (!$._sharedVaults.add(vault)) {
            revert VaultAlreadyRegistered();
        }
        $._vaultStatuses[vault].push(Time.timestamp(), 1);
    }

    /**
     * @notice Registers a new operator vault
     * @param operator The operator address
     * @param vault The vault address to register
     */
    function _registerOperatorVault(address operator, address vault) internal {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(vault)) {
            revert InvalidVault();
        }
        if (!_validateOperatorVault(operator, vault)) {
            revert InvalidOperatorVault();
        }
        if (!_isOperatorRegistered(operator)) {
            revert OperatorNotAdded();
        }
        if ($._sharedVaults.contains(vault)) {
            revert VaultAlreadyRegistered();
        }
        if (!$._allOperatorVaults.add(vault)) {
            revert VaultAlreadyRegistered();
        }
        $._operatorVaults[operator].add(vault);
        $._vaultStatuses[vault].push(Time.timestamp(), 1);
    }

    /**
     * @notice Pauses a vault
     * @param vault The vault address to pause
     */
    function _pauseVault(
        address vault
    ) internal {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!$._sharedVaults.contains(vault) && !$._allOperatorVaults.contains(vault)) {
            revert VaultNotRegistered();
        }
        $._vaultStatuses[vault].push(Time.timestamp(), 0);
    }

    /**
     * @notice Unpauses a vault
     * @param vault The vault address to unpause
     */
    function _unpauseVault(
        address vault
    ) internal {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!$._sharedVaults.contains(vault) && !$._allOperatorVaults.contains(vault)) {
            revert VaultNotRegistered();
        }
        $._vaultStatuses[vault].push(Time.timestamp(), 1);
    }

    /**
     * @notice Unregisters a shared vault
     * @param vault The vault address to unregister
     */
    function _unregisterSharedVault(
        address vault
    ) internal {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        (bool exists, uint48 timestamp, uint208 value) = $._vaultStatuses[vault].latestCheckpoint();
        if (!exists || timestamp >= _getOldestNeededTimestamp() || value > 0) {
            revert UnregisterNotAllowed();
        }
        $._sharedVaults.remove(vault);
        delete $._vaultStatuses[vault];
    }

    /**
     * @notice Unregisters an operator vault
     * @param operator The operator address
     * @param vault The vault address to unregister
     */
    function _unregisterOperatorVault(address operator, address vault) internal {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        (bool exists, uint48 timestamp, uint208 value) = $._vaultStatuses[vault].latestCheckpoint();
        if (!exists || timestamp >= _getOldestNeededTimestamp() || value > 0) {
            revert UnregisterNotAllowed();
        }
        $._operatorVaults[operator].remove(vault);
        $._allOperatorVaults.remove(vault);
        delete $._vaultStatuses[vault];
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
        SlashVaultHints memory slashVaultHints;
        if (hints.length > 0) {
            slashVaultHints = abi.decode(hints, (SlashVaultHints));
        }

        if (!_isOperatorUnpausedAt(operator, timestamp, slashVaultHints.operatorUnpausedHint)) {
            revert InactiveOperatorSlash();
        }

        if (!_isVaultUnpausedAt(vault, timestamp, slashVaultHints.vaultUnpausedHint)) {
            revert InactiveVaultSlash();
        }

        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert NoSlasher();
        }

        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(SlasherType.INSTANT)) {
            try ISlasher(slasher).slash(_SUBNETWORK(), operator, amount, timestamp, slashVaultHints.slashHints)
            returns (uint256 slashedAmount) {
                emit InstantSlash(vault, operator, slashedAmount);
                success = true;
                response = abi.encode(slashedAmount);
            } catch {
                success = false;
            }
        } else if (slasherType == uint64(SlasherType.VETO)) {
            try IVetoSlasher(slasher).requestSlash(
                _SUBNETWORK(), operator, amount, timestamp, slashVaultHints.slashHints
            ) returns (uint256 slashIndex) {
                emit VetoSlash(vault, operator, slashIndex);
                success = true;
                response = abi.encode(slashIndex);
            } catch {
                success = false;
            }
        } else {
            revert UnknownSlasherType();
        }
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
        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert NoSlasher();
        }

        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(SlasherType.VETO)) {
            try IVetoSlasher(slasher).executeSlash(slashIndex, hints) returns (uint256 slashedAmount_) {
                success = true;
                slashedAmount = slashedAmount_;
            } catch {
                success = false;
            }
        } else {
            revert NonVetoSlasher();
        }
    }

    /**
     * @notice Validates if a vault is properly initialized and registered
     * @param vault The vault address to validate
     */
    function _validateVault(
        address vault
    ) internal view virtual returns (bool) {
        if (!IRegistry(VAULT_FACTORY).isEntity(vault)) {
            return false;
        }

        if (!IVault(vault).isInitialized()) {
            return false;
        }

        if (!_validateVaultEpochDuration(vault)) {
            return false;
        }

        return true;
    }

    function _validateSharedVault(
        address vault
    ) internal view virtual returns (bool) {
        address delegator = IVault(vault).delegator();
        uint64 delegatorType = IEntity(delegator).TYPE();
        if (
            (
                delegatorType != uint64(DelegatorType.FULL_RESTAKE)
                    && delegatorType != uint64(DelegatorType.NETWORK_RESTAKE)
            )
        ) {
            return false;
        }

        return true;
    }

    function _validateOperatorVault(address operator, address vault) internal view virtual returns (bool) {
        address delegator = IVault(vault).delegator();
        uint64 delegatorType = IEntity(delegator).TYPE();
        if (
            (
                delegatorType != uint64(DelegatorType.OPERATOR_SPECIFIC)
                    && delegatorType != uint64(DelegatorType.OPERATOR_NETWORK_SPECIFIC)
            ) || IOperatorSpecificDelegator(delegator).operator() != operator
        ) {
            return false;
        }

        if (
            delegatorType == uint64(DelegatorType.OPERATOR_NETWORK_SPECIFIC)
                && IOperatorNetworkSpecificDelegator(delegator).network() != _NETWORK()
        ) {
            return false;
        }

        return true;
    }

    function _validateVaultEpochDuration(
        address vault
    ) internal view virtual returns (bool) {
        uint48 vaultEpochDuration = IVault(vault).epochDuration();
        uint48 slashingWindow = _getSlashingWindow();
        address slasher = IVault(vault).slasher();

        if (slasher != address(0)) {
            uint64 slasherType = IEntity(slasher).TYPE();
            if (slasherType == uint64(SlasherType.VETO)) {
                vaultEpochDuration -= IVetoSlasher(slasher).vetoDuration();
            } else if (slasherType > uint64(SlasherType.VETO)) {
                return false;
            }

            return slashingWindow <= vaultEpochDuration;
        } else if (slashingWindow > 0) {
            return false;
        }

        return true;
    }
}
