// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../base/INetworkManager.sol";
import {IOzEIP712} from "../base/IOzEIP712.sol";

import {PersistentSet} from "../../../contracts/libraries/structs/PersistentSet.sol";

interface IVotingPowerProvider {
    error VotingPowerProvider_InvalidSignature();
    error VotingPowerProvider_UnregisteredOperatorSlash();
    error VotingPowerProvider_UnregisteredVaultSlash();
    error VotingPowerProvider_UnknownSlasherType();
    error VotingPowerProvider_NonVetoSlasher();
    error VotingPowerProvider_NoSlasher();
    error VotingPowerProvider_InvalidSharedVault();
    error VotingPowerProvider_InvalidVault();
    error VotingPowerProvider_InvalidOperatorVault();
    error VotingPowerProvider_SharedVaultAlreadyIsRegistered();
    error VotingPowerProvider_OperatorVaultAlreadyIsRegistered();
    error VotingPowerProvider_TokenAlreadyIsRegistered();
    error VotingPowerProvider_TokenNotRegistered();
    error VotingPowerProvider_OperatorNotRegistered();
    error VotingPowerProvider_SharedVaultNotRegistered();
    error VotingPowerProvider_OperatorVaultNotRegistered();
    error VotingPowerProvider_InvalidToken();
    error VotingPowerProvider_SlashingWindowTooLarge();
    error VotingPowerProvider_InvalidOperator();
    error VotingPowerProvider_OperatorNotOptedIn();
    error VotingPowerProvider_OperatorAlreadyRegistered();

    enum DelegatorType {
        NETWORK_RESTAKE,
        FULL_RESTAKE,
        OPERATOR_SPECIFIC,
        OPERATOR_NETWORK_SPECIFIC
    }

    enum SlasherType {
        INSTANT,
        VETO
    }

    /// @custom:storage-location erc7201:symbiotic.storage.VotingPowerProvider
    struct VotingPowerProviderStorage {
        PersistentSet.AddressSet _tokens;
        PersistentSet.AddressSet _operators;
        PersistentSet.AddressSet _sharedVaults;
        PersistentSet.AddressSet _allOperatorVaults;
        mapping(address operator => PersistentSet.AddressSet) _operatorVaults;
        uint48 _slashingWindow;
    }

    struct VotingPowerProviderInitParams {
        INetworkManager.NetworkManagerInitParams networkManagerInitParams;
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
        uint48 slashingWindow;
        address token;
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
        bytes isTokenRegisteredHint;
        bytes stakeHints;
    }

    struct OperatorVotingPowersExtraData {
        bytes[] sharedVaultsExtraData;
        bytes[] operatorVaultsExtraData;
    }

    event SetSlashingWindow(uint48 slashingWindow);

    event RegisterToken(address indexed token);

    event UnregisterToken(address indexed token);

    event RegisterOperator(address indexed operator);

    event UnregisterOperator(address indexed operator);

    event RegisterSharedVault(address indexed vault);

    event UnregisterSharedVault(address indexed vault);

    event RegisterOperatorVault(address indexed operator, address indexed vault);

    event UnregisterOperatorVault(address indexed operator, address indexed vault);

    function OPERATOR_REGISTRY() external view returns (address);

    function VAULT_FACTORY() external view returns (address);

    function getSlashingWindow() external view returns (uint48);

    function isTokenRegistered(
        address token
    ) external view returns (bool);

    function isTokenRegisteredAt(address token, uint48 timestamp, bytes memory hint) external view returns (bool);

    function getTokensAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    function getTokens() external view returns (address[] memory);

    function getTokensLength() external view returns (uint256);

    function isOperatorRegistered(
        address operator
    ) external view returns (bool);

    function isOperatorRegisteredAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function getOperatorsAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    function getOperators() external view returns (address[] memory);

    function getOperatorsLength() external view returns (uint256);

    function isSharedVaultRegistered(
        address vault
    ) external view returns (bool);

    function isSharedVaultRegisteredAt(
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function getSharedVaultsAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    function getSharedVaults() external view returns (address[] memory);

    function getSharedVaultsLength() external view returns (uint256);

    function isOperatorVaultRegisteredAt(
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function isOperatorVaultRegistered(
        address vault
    ) external view returns (bool);

    function isOperatorVaultRegisteredAt(
        address operator,
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function isOperatorVaultRegistered(address operator, address vault) external view returns (bool);

    function getOperatorVaultsAt(address operator, uint48 timestamp) external view returns (address[] memory);

    function getOperatorVaults(
        address operator
    ) external view returns (address[] memory);

    function getOperatorVaultsLength(
        address operator
    ) external view returns (uint256);

    function getOperatorStakeAt(
        address vault,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (uint256);

    function getOperatorStake(address vault, address operator) external view returns (uint256);

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

    function getOperatorVotingPowersAt(
        address operator,
        bytes memory extraData,
        uint48 timestamp
    ) external view returns (VaultVotingPower[] memory);

    function getOperatorVotingPowers(
        address operator,
        bytes memory extraData
    ) external view returns (VaultVotingPower[] memory);

    function getVotingPowersAt(
        bytes[] memory extraData,
        uint48 timestamp
    ) external view returns (OperatorVotingPower[] memory);

    function getVotingPowers(
        bytes[] memory extraData
    ) external view returns (OperatorVotingPower[] memory);

    function registerOperator() external;

    function registerOperatorWithSignature(address operator, bytes memory signature) external;

    function unregisterOperator() external;

    function unregisterOperatorWithSignature(address operator, bytes memory signature) external;

    function invalidateOldSignatures() external;
}
