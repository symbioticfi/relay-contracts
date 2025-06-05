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

    struct SlashVaultHints {
        bytes operatorRegisteredHint;
        bytes operatorVaultRegisteredHint;
        bytes sharedVaultRegisteredHint;
        bytes slashHints;
    }

    event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount);

    event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex);

    event ExecuteSlash(
        address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount
    );

    function BaseSlashing_VERSION() external view returns (uint64);
}
