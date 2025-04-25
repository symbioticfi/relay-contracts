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

    struct VaultManagerInitParams {
        uint48 slashingWindow;
    }
}
