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

import {OperatorManager} from "../../managers/OperatorManager.sol";

import {StakeVotingPowerManager} from "../../managers/extendable/StakeVotingPowerManager.sol";

import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {CheckpointsEnumerableMap} from "../../../libraries/structs/CheckpointsEnumerableMap.sol";
import {Hints} from "../../../libraries/utils/Hints.sol";
import {NetworkManagerLogic} from "./NetworkManagerLogic.sol";
import {OperatorManagerLogic} from "./OperatorManagerLogic.sol";

import {IVaultManager} from "../../../../interfaces/SDK/managers/IVaultManager.sol";

/**
 * @title VaultManager
 * @notice Abstract contract for managing vaults and their relationships with operators
 * @dev Extends BaseManager and provides functionality for registering, pausing, and managing vaults
 */
library VaultManagerLogic {
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    using EnumerableMap for EnumerableMap.AddressToAddressMap;
    using EnumerableSet for EnumerableSet.AddressSet;
    using Subnetwork for address;
    using Subnetwork for bytes32;
    using Checkpoints for Checkpoints.Trace208;
    using CheckpointsEnumerableMap for CheckpointsEnumerableMap.AddressToTrace208Map;
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
    error UnregisterNotAllowed();

    /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
    struct VaultManagerStorage {
        CheckpointsEnumerableMap.AddressToTrace208Map _tokens;
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

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.VaultManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant VaultManagerStorageLocation =
        0x485f0695561726d087d0cb5cf546efed37ef61dfced21455f1ba7eb5e5b3db00;

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
    function initialize(
        uint48 slashingWindow
    ) public {
        _getVaultManagerStorage()._slashingWindow = slashingWindow;
    }

    function getSlashingWindow() public view returns (uint48) {
        return _getVaultManagerStorage()._slashingWindow;
    }

    function isTokenUnpaused(
        address token
    ) public view returns (bool) {
        (bool exists, Checkpoints.Trace208 storage checkpoints) = _getVaultManagerStorage()._tokens.tryGet(token);
        return exists && checkpoints.latest() > 0;
    }

    function isTokenUnpausedAt(address token, uint48 timestamp, bytes memory hint) public view returns (bool) {
        (bool exists, Checkpoints.Trace208 storage checkpoints) = _getVaultManagerStorage()._tokens.tryGet(token);
        return exists && checkpoints.upperLookupRecent(timestamp, hint) > 0;
    }

    function isTokenRegistered(
        address token
    ) public view returns (bool) {
        return _getVaultManagerStorage()._tokens.contains(token);
    }

    function tokensLength() public view returns (uint256) {
        return _getVaultManagerStorage()._tokens.length();
    }

    function getTokens() public view returns (address[] memory) {
        return _getVaultManagerStorage()._tokens.keys();
    }

    function getActiveTokensAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory activeTokens) {
        address[] memory registeredTokens = _getVaultManagerStorage()._tokens.keys();
        uint256 registeredTokensLength = registeredTokens.length;
        activeTokens = new address[](registeredTokensLength);
        hints = hints.normalize(registeredTokensLength);
        uint256 length;
        for (uint256 i; i < registeredTokensLength; ++i) {
            if (isTokenUnpausedAt(registeredTokens[i], timestamp, hints[i])) {
                activeTokens[length++] = registeredTokens[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeTokens, length)
        }
    }

    function getActiveTokens() public view returns (address[] memory activeTokens) {
        address[] memory registeredTokens = _getVaultManagerStorage()._tokens.keys();
        uint256 registeredTokensLength = registeredTokens.length;
        activeTokens = new address[](registeredTokensLength);
        uint256 length;
        for (uint256 i; i < registeredTokensLength; ++i) {
            if (isTokenUnpaused(registeredTokens[i])) {
                activeTokens[length++] = registeredTokens[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeTokens, length)
        }
    }

    function isVaultUnpaused(
        address vault
    ) public view returns (bool) {
        return _getVaultManagerStorage()._vaultStatuses[vault].latest() > 0;
    }

    function isVaultUnpausedAt(address vault, uint48 timestamp, bytes memory hint) public view returns (bool) {
        return _getVaultManagerStorage()._vaultStatuses[vault].upperLookupRecent(timestamp, hint) > 0;
    }

    function isSharedVaultRegistered(
        address vault
    ) public view returns (bool) {
        return _getVaultManagerStorage()._sharedVaults.contains(vault);
    }

    /**
     * @notice Gets the total number of shared vaults
     * @return uint256 The count of shared vaults
     */
    function sharedVaultsLength() public view returns (uint256) {
        return _getVaultManagerStorage()._sharedVaults.length();
    }

    function getSharedVaults() public view returns (address[] memory) {
        return _getVaultManagerStorage()._sharedVaults.values();
    }

    function getActiveSharedVaultsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory activeSharedVaults) {
        address[] memory registeredSharedVaults = getSharedVaults();
        uint256 registeredSharedVaultsLength = registeredSharedVaults.length;
        activeSharedVaults = new address[](registeredSharedVaultsLength);
        hints = hints.normalize(registeredSharedVaultsLength);
        uint256 length;
        for (uint256 i; i < registeredSharedVaultsLength; ++i) {
            if (isVaultUnpausedAt(registeredSharedVaults[i], timestamp, hints[i])) {
                activeSharedVaults[length++] = registeredSharedVaults[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeSharedVaults, length)
        }
    }

    function getActiveSharedVaults() public view returns (address[] memory activeSharedVaults) {
        address[] memory registeredSharedVaults = getSharedVaults();
        uint256 registeredSharedVaultsLength = registeredSharedVaults.length;
        activeSharedVaults = new address[](registeredSharedVaultsLength);
        uint256 length;
        for (uint256 i; i < registeredSharedVaultsLength; ++i) {
            if (isVaultUnpaused(registeredSharedVaults[i])) {
                activeSharedVaults[length++] = registeredSharedVaults[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeSharedVaults, length)
        }
    }

    function isOperatorVaultRegistered(address operator, address vault) public view returns (bool) {
        return _getVaultManagerStorage()._operatorVaults[operator].contains(vault);
    }

    function operatorVaultsLength(
        address operator
    ) public view returns (uint256) {
        return _getVaultManagerStorage()._operatorVaults[operator].length();
    }

    function getOperatorVaults(
        address operator
    ) public view returns (address[] memory) {
        return _getVaultManagerStorage()._operatorVaults[operator].values();
    }

    function getActiveOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory activeOperatorVaults) {
        address[] memory registeredOperatorVaults = getOperatorVaults(operator);
        uint256 registeredOperatorVaultsLength = registeredOperatorVaults.length;
        activeOperatorVaults = new address[](registeredOperatorVaultsLength);
        hints = hints.normalize(registeredOperatorVaultsLength);
        uint256 length;
        for (uint256 i; i < registeredOperatorVaultsLength; ++i) {
            if (isVaultUnpausedAt(registeredOperatorVaults[i], timestamp, hints[i])) {
                activeOperatorVaults[length++] = registeredOperatorVaults[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeOperatorVaults, length)
        }
    }

    function getActiveOperatorVaults(
        address operator
    ) public view returns (address[] memory activeOperatorVaults) {
        address[] memory registeredOperatorVaults = getOperatorVaults(operator);
        uint256 registeredOperatorVaultsLength = registeredOperatorVaults.length;
        activeOperatorVaults = new address[](registeredOperatorVaultsLength);
        uint256 length;
        for (uint256 i; i < registeredOperatorVaultsLength; ++i) {
            if (isVaultUnpaused(registeredOperatorVaults[i])) {
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
    function getOperatorStakeAt(
        address vault,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (uint256) {
        return IBaseDelegator(IVault(vault).delegator()).stakeAt(
            NetworkManagerLogic.SUBNETWORK(), operator, timestamp, hints
        );
    }

    function getOperatorStake(address vault, address operator) public view returns (uint256) {
        return IBaseDelegator(IVault(vault).delegator()).stake(NetworkManagerLogic.SUBNETWORK(), operator);
    }

    /**
     * @notice Gets the votingPower amount for an operator in a vault at a specific timestamp
     * @param timestamp The timestamp to check
     * @param operator The operator address
     * @param vault The vault address
     * @return uint256 The votingPower amount at the timestamp
     * @dev Doesn't consider active statuses.
     */
    function getOperatorVotingPowerAt(
        function (address, uint256) external view returns (uint256) stakeToVotingPower,
        address operator,
        address vault,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (uint256) {
        IVaultManager.OperatorVaultVotingPowerHints memory operatorVaultVotingPowerHints;
        if (hints.length > 0) {
            operatorVaultVotingPowerHints = abi.decode(hints, (IVaultManager.OperatorVaultVotingPowerHints));
        }

        if (
            !isTokenUnpausedAt(IVault(vault).collateral(), timestamp, operatorVaultVotingPowerHints.isTokenUnpausedHint)
        ) {
            return 0;
        }
        if (!_validateVaultEpochDuration(vault)) {
            // TODO
            return 0;
        }
        return stakeToVotingPower(
            vault, getOperatorStakeAt(vault, operator, timestamp, operatorVaultVotingPowerHints.stakeHints)
        );
    }

    function getOperatorVotingPower(
        function (address, uint256) external view returns (uint256) stakeToVotingPower,
        address operator,
        address vault
    ) public view returns (uint256) {
        if (!isTokenUnpaused(IVault(vault).collateral())) {
            return 0;
        }
        if (!_validateVaultEpochDuration(vault)) {
            // TODO
            return 0;
        }
        return stakeToVotingPower(operator, getOperatorStake(vault, operator));
    }

    /**
     * @notice Gets the total votingPower amount for an operator across all vaults
     * @param operator The operator address
     * @return votingPower The total votingPower amount
     */
    function getOperatorVotingPowerAt(
        function (address, uint256) external view returns (uint256) stakeToVotingPower,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (uint256 votingPower) {
        IVaultManager.OperatorVotingPowerHints memory operatorVotingPowerHints;
        if (hints.length > 0) {
            operatorVotingPowerHints = abi.decode(hints, (IVaultManager.OperatorVotingPowerHints));
        }

        address[] memory sharedVaults =
            getActiveSharedVaultsAt(timestamp, operatorVotingPowerHints.activeSharedVaultsHints);
        for (uint256 i; i < sharedVaults.length; ++i) {
            votingPower += getOperatorVotingPowerAt(
                stakeToVotingPower,
                sharedVaults[i],
                operator,
                timestamp,
                operatorVotingPowerHints.sharedVaultsVotingPowerHints[i]
            );
        }
        address[] memory operatorVaults =
            getActiveOperatorVaultsAt(operator, timestamp, operatorVotingPowerHints.activeOperatorVaultsHints);
        for (uint256 i; i < operatorVaults.length; ++i) {
            votingPower += getOperatorVotingPowerAt(
                stakeToVotingPower,
                operatorVaults[i],
                operator,
                timestamp,
                operatorVotingPowerHints.operatorVaultsVotingPowerHints[i]
            );
        }
    }

    function getOperatorVotingPower(
        function (address, uint256) external view returns (uint256) stakeToVotingPower,
        address operator
    ) public view returns (uint256 votingPower) {
        address[] memory sharedVaults = getActiveSharedVaults();
        for (uint256 i; i < sharedVaults.length; ++i) {
            votingPower += getOperatorVotingPower(stakeToVotingPower, operator, sharedVaults[i]);
        }
        address[] memory operatorVaults = getActiveOperatorVaults(operator);
        for (uint256 i; i < operatorVaults.length; ++i) {
            votingPower += getOperatorVotingPower(stakeToVotingPower, operator, operatorVaults[i]);
        }
    }

    function getOperatorVotingPowersAt(
        function (address, uint256) external view returns (uint256) stakeToVotingPower,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IVaultManager.VaultVotingPower[] memory vaultVotingPowers) {
        IVaultManager.OperatorVotingPowersHints memory operatorVotingPowersHints;
        if (hints.length > 0) {
            operatorVotingPowersHints = abi.decode(hints, (IVaultManager.OperatorVotingPowersHints));
        }

        uint256 length;
        address[] memory sharedVaults =
            getActiveSharedVaultsAt(timestamp, operatorVotingPowersHints.activeSharedVaultsHints);
        address[] memory operatorVaults =
            getActiveOperatorVaultsAt(operator, timestamp, operatorVotingPowersHints.activeOperatorVaultsHints);
        vaultVotingPowers = new IVaultManager.VaultVotingPower[](sharedVaults.length + operatorVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPowerAt(
                stakeToVotingPower,
                sharedVaults[i],
                operator,
                timestamp,
                operatorVotingPowersHints.sharedVaultsVotingPowerHints[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: sharedVaults[i], votingPower: votingPower_});
            }
        }
        for (uint256 i; i < operatorVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPowerAt(
                stakeToVotingPower,
                operatorVaults[i],
                operator,
                timestamp,
                operatorVotingPowersHints.operatorVaultsVotingPowerHints[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: operatorVaults[i], votingPower: votingPower_});
            }
        }

        assembly ("memory-safe") {
            mstore(vaultVotingPowers, length)
        }
    }

    function getOperatorVotingPowers(
        function (address, uint256) external view returns (uint256) stakeToVotingPower,
        address operator
    ) public view returns (IVaultManager.VaultVotingPower[] memory vaultVotingPowers) {
        uint256 length;
        address[] memory sharedVaults = getActiveSharedVaults();
        address[] memory operatorVaults = getActiveOperatorVaults(operator);
        vaultVotingPowers = new IVaultManager.VaultVotingPower[](sharedVaults.length + operatorVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPower(stakeToVotingPower, operator, sharedVaults[i]);
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: sharedVaults[i], votingPower: votingPower_});
            }
        }
        for (uint256 i; i < operatorVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPower(stakeToVotingPower, operator, operatorVaults[i]);
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: operatorVaults[i], votingPower: votingPower_});
            }
        }

        assembly ("memory-safe") {
            mstore(vaultVotingPowers, length)
        }
    }

    function getVotingPowersAt(
        function (address, uint256) external view returns (uint256) stakeToVotingPower,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IVaultManager.OperatorVotingPower[] memory operatorVotingPowers) {
        IVaultManager.VotingPowersHints memory votingPowersHints;
        if (hints.length > 0) {
            votingPowersHints = abi.decode(hints, (IVaultManager.VotingPowersHints));
        }

        uint256 length;
        address[] memory operators =
            OperatorManagerLogic.getActiveOperatorsAt(timestamp, votingPowersHints.activeOperatorsHints);
        operatorVotingPowers = new IVaultManager.OperatorVotingPower[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            IVaultManager.VaultVotingPower[] memory votingPowers = getOperatorVotingPowersAt(
                stakeToVotingPower, operators[i], timestamp, votingPowersHints.operatorVotingPowersHints[i]
            );
            if (votingPowers.length > 0) {
                operatorVotingPowers[length++] =
                    IVaultManager.OperatorVotingPower({operator: operators[i], vaults: votingPowers});
            }
        }
        assembly ("memory-safe") {
            mstore(operatorVotingPowers, length)
        }
    }

    function getVotingPowers(
        function (address, uint256) external view returns (uint256) stakeToVotingPower
    ) public view returns (IVaultManager.OperatorVotingPower[] memory operatorVotingPowers) {
        uint256 length;
        address[] memory operators = OperatorManagerLogic.getActiveOperators();
        operatorVotingPowers = new IVaultManager.OperatorVotingPower[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            IVaultManager.VaultVotingPower[] memory votingPowers =
                getOperatorVotingPowers(stakeToVotingPower, operators[i]);
            if (votingPowers.length > 0) {
                operatorVotingPowers[length++] =
                    IVaultManager.OperatorVotingPower({operator: operators[i], vaults: votingPowers});
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
    function registerSharedVault(address VAULT_FACTORY, address vault) public {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(VAULT_FACTORY, vault)) {
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
    function registerOperatorVault(address VAULT_FACTORY, address operator, address vault) public {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(VAULT_FACTORY, vault)) {
            revert InvalidVault();
        }
        if (!_validateOperatorVault(operator, vault)) {
            revert InvalidOperatorVault();
        }
        if (!OperatorManagerLogic.isOperatorRegistered(operator)) {
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
    function pauseVault(
        address vault
    ) public {
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
    function unpauseVault(
        address vault
    ) public {
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
    function unregisterSharedVault(
        address vault
    ) public {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        (bool exists, uint48 timestamp, uint208 value) = $._vaultStatuses[vault].latestCheckpoint();
        if (!exists || timestamp >= OperatorManagerLogic.getOldestNeededTimestamp() || value > 0) {
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
    function unregisterOperatorVault(address operator, address vault) public {
        VaultManagerStorage storage $ = _getVaultManagerStorage();
        (bool exists, uint48 timestamp, uint208 value) = $._vaultStatuses[vault].latestCheckpoint();
        if (!exists || timestamp >= OperatorManagerLogic.getOldestNeededTimestamp() || value > 0) {
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
    function slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) public returns (bool success, bytes memory response) {
        IVaultManager.SlashVaultHints memory slashVaultHints;
        if (hints.length > 0) {
            slashVaultHints = abi.decode(hints, (IVaultManager.SlashVaultHints));
        }

        if (!OperatorManagerLogic.isOperatorUnpausedAt(operator, timestamp, slashVaultHints.operatorUnpausedHint)) {
            revert InactiveOperatorSlash();
        }

        if (!isVaultUnpausedAt(vault, timestamp, slashVaultHints.vaultUnpausedHint)) {
            revert InactiveVaultSlash();
        }

        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert NoSlasher();
        }

        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(SlasherType.INSTANT)) {
            try ISlasher(slasher).slash(
                NetworkManagerLogic.SUBNETWORK(), operator, amount, timestamp, slashVaultHints.slashHints
            ) returns (uint256 slashedAmount) {
                emit InstantSlash(vault, operator, slashedAmount);
                success = true;
                response = abi.encode(slashedAmount);
            } catch {
                success = false;
            }
        } else if (slasherType == uint64(SlasherType.VETO)) {
            try IVetoSlasher(slasher).requestSlash(
                NetworkManagerLogic.SUBNETWORK(), operator, amount, timestamp, slashVaultHints.slashHints
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
    function executeSlash(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) public returns (bool success, uint256 slashedAmount) {
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
    function _validateVault(address VAULT_FACTORY, address vault) public view returns (bool) {
        if (!IRegistry(VAULT_FACTORY).isEntity(vault)) {
            return false;
        }

        if (!IVault(vault).isInitialized()) {
            return false;
        }

        if (!_validateVaultEpochDuration(vault)) {
            return false;
        }

        if (!isTokenUnpaused(IVault(vault).collateral())) {
            return false;
        }

        return true;
    }

    function _validateSharedVault(
        address vault
    ) public view returns (bool) {
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

    function _validateOperatorVault(address operator, address vault) public view returns (bool) {
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
                && IOperatorNetworkSpecificDelegator(delegator).network() != NetworkManagerLogic.NETWORK()
        ) {
            return false;
        }

        return true;
    }

    function _validateVaultEpochDuration(
        address vault
    ) public view returns (bool) {
        uint48 vaultEpochDuration = IVault(vault).epochDuration();
        uint48 slashingWindow = getSlashingWindow();
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
