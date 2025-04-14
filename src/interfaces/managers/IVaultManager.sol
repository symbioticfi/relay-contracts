// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IVaultManager {
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
}
