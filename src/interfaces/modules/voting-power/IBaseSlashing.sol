// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBaseSlashing {
    error BaseSlashing_UnregisteredOperatorSlash();
    error BaseSlashing_UnregisteredVaultSlash();
    error BaseSlashing_UnknownSlasherType();
    error BaseSlashing_NonVetoSlasher();
    error BaseSlashing_NoSlasher();
    error BaseSlashing_InvalidSharedVault();
    error BaseSlashing_InvalidVault();
    error BaseSlashing_InvalidOperatorVault();
    error BaseSlashing_SharedVaultAlreadyIsRegistered();
    error BaseSlashing_OperatorVaultAlreadyIsRegistered();
    error BaseSlashing_TokenAlreadyIsRegistered();
    error BaseSlashing_TokenNotRegistered();
    error BaseSlashing_OperatorNotRegistered();
    error BaseSlashing_SharedVaultNotRegistered();
    error BaseSlashing_OperatorVaultNotRegistered();
    error BaseSlashing_InvalidToken();
    error BaseSlashing_SlashingWindowTooLarge();
    error BaseSlashing_NotSlasher();
    error BaseSlashing_InvalidSlasher();

    /// @custom:storage-location erc7201:symbiotic.storage.BaseSlashing
    struct BaseSlashingStorage {
        address _slasher;
    }

    struct BaseSlashingInitParams {
        address slasher;
    }

    struct SlashVaultHints {
        bytes operatorRegisteredHint;
        bytes operatorVaultRegisteredHint;
        bytes sharedVaultRegisteredHint;
        bytes slashHints;
    }

    event SetSlasher(address slasher);

    event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount);

    event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex);

    event ExecuteSlash(
        address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount
    );

    function BaseSlashing_VERSION() external view returns (uint64);

    function getSlasher() external view returns (address);

    function setSlasher(
        address slasher
    ) external;

    function slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) external returns (bool success, bytes memory response);

    function executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) external returns (bool success, uint256 slashedAmount);
}
