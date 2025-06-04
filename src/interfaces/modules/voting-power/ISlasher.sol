// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISlasher {
    error Slasher_UnregisteredOperatorSlash();
    error Slasher_UnregisteredVaultSlash();
    error Slasher_UnknownSlasherType();
    error Slasher_NonVetoSlasher();
    error Slasher_NoSlasher();
    error Slasher_InvalidSharedVault();
    error Slasher_InvalidVault();
    error Slasher_InvalidOperatorVault();
    error Slasher_SharedVaultAlreadyIsRegistered();
    error Slasher_OperatorVaultAlreadyIsRegistered();
    error Slasher_TokenAlreadyIsRegistered();
    error Slasher_TokenNotRegistered();
    error Slasher_OperatorNotRegistered();
    error Slasher_SharedVaultNotRegistered();
    error Slasher_OperatorVaultNotRegistered();
    error Slasher_InvalidToken();
    error Slasher_SlashingWindowTooLarge();

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

    function Slasher_VERSION() external view returns (uint64);
}
