// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBaseSlasher {
    error BaseSlasher_UnregisteredOperatorSlash();
    error BaseSlasher_UnregisteredVaultSlash();
    error BaseSlasher_UnknownSlasherType();
    error BaseSlasher_NonVetoSlasher();
    error BaseSlasher_NoSlasher();
    error BaseSlasher_InvalidSharedVault();
    error BaseSlasher_InvalidVault();
    error BaseSlasher_InvalidOperatorVault();
    error BaseSlasher_SharedVaultAlreadyIsRegistered();
    error BaseSlasher_OperatorVaultAlreadyIsRegistered();
    error BaseSlasher_TokenAlreadyIsRegistered();
    error BaseSlasher_TokenNotRegistered();
    error BaseSlasher_OperatorNotRegistered();
    error BaseSlasher_SharedVaultNotRegistered();
    error BaseSlasher_OperatorVaultNotRegistered();
    error BaseSlasher_InvalidToken();
    error BaseSlasher_SlashingWindowTooLarge();

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

    function BaseSlasher_VERSION() external view returns (uint64);
}
