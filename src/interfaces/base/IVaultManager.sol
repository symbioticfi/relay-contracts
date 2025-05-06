// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PersistentSet} from "../../contracts/libraries/structs/PersistentSet.sol";

interface IVaultManager {
    error VaultManager_InactiveOperatorSlash();
    error VaultManager_InactiveVaultSlash();
    error VaultManager_UnknownSlasherType();
    error VaultManager_NonVetoSlasher();
    error VaultManager_NoSlasher();
    error VaultManager_InvalidSharedVault();
    error VaultManager_InvalidVault();
    error VaultManager_InvalidOperatorVault();
    error VaultManager_SharedVaultAlreadyIsActive();
    error VaultManager_OperatorVaultAlreadyIsActive();
    error VaultManager_TokenAlreadyIsActive();
    error VaultManager_TokenNotActive();
    error VaultManager_OperatorNotRegistered();
    error VaultManager_SharedVaultNotActive();
    error VaultManager_OperatorVaultNotActive();
    error VaultManager_InvalidToken();

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

    /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
    struct VaultManagerStorage {
        PersistentSet.AddressSet _tokens;
        PersistentSet.AddressSet _sharedVaults;
        PersistentSet.AddressSet _allOperatorVaults;
        mapping(address operator => PersistentSet.AddressSet) _operatorVaults;
        uint48 _slashingWindow;
    }

    struct VaultManagerInitParams {
        uint48 slashingWindow;
    }

    struct VaultVotingPower {
        address vault;
        uint256 votingPower;
    }

    struct OperatorVotingPower {
        address operator;
        VaultVotingPower[] vaults;
    }

    struct OperatorVaultVotingPowerHints {
        bytes isTokenActiveHint;
        bytes stakeHints;
    }

    struct OperatorVotingPowersHints {
        bytes[] activeSharedVaultsHints;
        bytes[] sharedVaultsVotingPowerHints;
        bytes[] activeOperatorVaultsHints;
        bytes[] operatorVaultsVotingPowerHints;
    }

    struct OperatorVotingPowersExtraData {
        bytes[] sharedVaultsExtraData;
        bytes[] operatorVaultsExtraData;
    }

    struct VotingPowersHints {
        bytes[] activeOperatorsHints;
        bytes[] operatorVotingPowersHints;
    }

    struct SlashVaultHints {
        bytes operatorActiveHint;
        bytes operatorVaultActiveHint;
        bytes sharedVaultActiveHint;
        bytes slashHints;
    }

    event InstantSlash(address vault, address operator, uint256 slashedAmount);

    event VetoSlash(address vault, address operator, uint256 slashIndex);

    function VaultManager_VERSION() external view returns (uint64);

    function VAULT_FACTORY() external view returns (address);

    function getSlashingWindow() external view returns (uint48);

    function isTokenRegistered(
        address token
    ) external view returns (bool);

    function isTokenActive(
        address token
    ) external view returns (bool);

    function isTokenActiveAt(address token, uint48 timestamp, bytes memory hint) external view returns (bool);

    function getAllTokensLength() external view returns (uint256);

    function getAllTokens() external view returns (address[] memory);

    function getActiveTokensAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory);

    function getActiveTokens() external view returns (address[] memory);

    function getActiveTokensLength() external view returns (uint256);

    function getActiveTokensLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function isSharedVaultRegistered(
        address vault
    ) external view returns (bool);

    function isSharedVaultActive(
        address vault
    ) external view returns (bool);

    function isSharedVaultActiveAt(address vault, uint48 timestamp, bytes memory hint) external view returns (bool);

    function getAllSharedVaultsLength() external view returns (uint256);

    function getAllSharedVaults() external view returns (address[] memory);

    function getActiveSharedVaultsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory);

    function getActiveSharedVaults() external view returns (address[] memory);

    function getActiveSharedVaultsLength() external view returns (uint256);

    function getActiveSharedVaultsLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function isOperatorVaultRegistered(address operator, address vault) external view returns (bool);

    function isOperatorVaultActive(address operator, address vault) external view returns (bool);

    function isOperatorVaultActiveAt(
        address operator,
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function getAllOperatorVaultsLength(
        address operator
    ) external view returns (uint256);

    function getAllOperatorVaults(
        address operator
    ) external view returns (address[] memory);

    function getActiveOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) external view returns (address[] memory);

    function getActiveOperatorVaults(
        address operator
    ) external view returns (address[] memory);

    function getActiveOperatorVaultsLength(
        address operator
    ) external view returns (uint256);

    function getActiveOperatorVaultsLengthAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (uint256);

    function getOperatorVotingPowerAt(
        address operator,
        address vault,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (uint256);

    function getOperatorVotingPower(
        address operator,
        address vault,
        bytes memory extraData
    ) external view returns (uint256);

    function getOperatorVotingPowerAt(
        address operator,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (uint256);

    function getOperatorVotingPower(address operator, bytes memory extraData) external view returns (uint256);

    function getOperatorVotingPowersAt(
        address operator,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (VaultVotingPower[] memory);

    function getOperatorVotingPowers(
        address operator,
        bytes memory extraData
    ) external view returns (VaultVotingPower[] memory);

    function getTotalVotingPowerAt(
        bytes[] memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (uint256);

    function getTotalVotingPower(
        bytes[] memory extraData
    ) external view returns (uint256);

    function getVotingPowersAt(
        bytes[] memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (OperatorVotingPower[] memory);

    function getVotingPowers(
        bytes[] memory extraData
    ) external view returns (OperatorVotingPower[] memory);
}
