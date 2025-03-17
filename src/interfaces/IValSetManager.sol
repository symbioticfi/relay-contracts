// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Updatable} from "../contracts/libraries/utils/Updatable.sol";

import {IVaultManager} from "./IVaultManager.sol";

interface IValSetManager {
    /// @custom:storage-location erc7201:symbiotic.storage.ValSetManager
    struct ValSetManagerStorage {
        Updatable.Uint104Value _quorumThreshold;
        uint8 _requiredKeyTag;
        uint48 _commit_duration;
        uint48 _accept_duration;
        Updatable.Bytes32Value _minInclusionPower;
        Updatable.Uint104Value _maxValidatorsCount;
        Updatable.Uint208Value _forceCommitVerifier;
        Updatable.Uint208Value _commitVerifier;
        mapping(uint48 => ValidatorSetHeaderStorage) _valSetHeader;
    }

    struct ValSetManagerInitParams {
        IVaultManager.VaultManagerInitParams baseParams;
        ValidatorSetHeader valSetHeader;
        uint104 quorumThreshold;
        uint8 requiredKeyTag;
        uint48 commit_duration;
        uint48 accept_duration;
        uint256 minInclusionPower;
        uint104 maxValidatorsCount;
        address forceCommitVerifier;
        address commitVerifier;
    }

    struct Key {
        uint8 tag;
        bytes payload;
    }

    struct Vault {
        address vault;
        uint256 votingPower;
    }

    struct Validator {
        address operator;
        uint256 votingPower;
        bool isActive;
        Key[] keys;
        Vault[] vaults;
    }

    struct ValidatorSet {
        uint256 totalActiveVotingPower;
        Validator[] validators;
    }

    struct ValidatorSetHeader {
        uint8 version;
        uint256 totalActiveVotingPower;
        uint8 valSetKeyTag;
        Key[] activeAggregatedKeys;
        bytes32 validatorsSszMRoot;
        bytes32 extraData;
    }

    struct ValidatorSetHeaderStorage {
        uint8 version;
        uint256 totalActiveVotingPower;
        uint8 valSetKeyTag;
        uint8[] keyTags;
        mapping(uint8 => bytes) activeAggregatedKeysByTag;
        bytes32 validatorsSszMRoot;
        bytes32 extraData;
    }

    enum ValSetPhase {
        IDLE,
        COMMIT,
        ACCEPT,
        FAIL
    }
}
