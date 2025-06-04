// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PersistentSet} from "../../contracts/libraries/structs/PersistentSet.sol";

interface IMiddlewareBindings {
    error MiddlewareBindings_UnregisteredOperatorSlash();
    error MiddlewareBindings_UnregisteredVaultSlash();
    error MiddlewareBindings_UnknownSlasherType();
    error MiddlewareBindings_NonVetoSlasher();
    error MiddlewareBindings_NoSlasher();
    error MiddlewareBindings_InvalidSharedVault();
    error MiddlewareBindings_InvalidVault();
    error MiddlewareBindings_InvalidOperatorVault();
    error MiddlewareBindings_SharedVaultAlreadyIsRegistered();
    error MiddlewareBindings_OperatorVaultAlreadyIsRegistered();
    error MiddlewareBindings_TokenAlreadyIsRegistered();
    error MiddlewareBindings_TokenNotRegistered();
    error MiddlewareBindings_OperatorNotRegistered();
    error MiddlewareBindings_SharedVaultNotRegistered();
    error MiddlewareBindings_OperatorVaultNotRegistered();
    error MiddlewareBindings_InvalidToken();
    error MiddlewareBindings_SlashingWindowTooLarge();

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

    event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data);

    event DistributeOperatorRewards(
        address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root
    );

    function MiddlewareBindings_VERSION() external view returns (uint64);
}
