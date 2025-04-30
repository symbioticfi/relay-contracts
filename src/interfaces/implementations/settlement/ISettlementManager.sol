// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../../base/INetworkManager.sol";
import {IEpochManager} from "../../base/IEpochManager.sol";
import {IBaseKeyManager} from "../../base/IBaseKeyManager.sol";
import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";

interface ISettlementManager {
    error SettlementManager_InvalidPhase();
    error SettlementManager_InvalidVersion();
    error SettlementManager_Duplicate();
    error SettlementManager_VerificationFailed();
    error SettlementManager_EpochDurationTooShort();
    error SettlementManager_InvalidKey();

    enum ValSetPhase {
        IDLE,
        COMMIT,
        FAIL
    }

    /// @custom:storage-location erc7201:symbiotic.storage.SettlementManager
    struct SettlementManagerStorage {
        Checkpoints.Trace208 _requiredKeyTag;
        Checkpoints.Trace208 _commitDuration;
        mapping(uint8 => Checkpoints.Trace208) _quorumThreshold;
        Checkpoints.Trace208 _sigVerifier;
        mapping(uint48 epoch => ValSetHeaderStorage) _valSetHeader;
    }

    struct ValSetHeaderStorage {
        uint8 version;
        uint8 valSetKeyTag;
        ActiveAggregatedKeysStorage activeAggregatedKeys;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        bytes extraData;
    }

    struct ActiveAggregatedKeysStorage {
        uint8[] keyTags;
        mapping(uint8 => bytes) keyByTag;
    }

    struct SettlementManagerInitParams {
        INetworkManager.NetworkManagerInitParams networkManagerInitParams;
        IEpochManager.EpochManagerInitParams epochManagerInitParams;
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
        QuorumThreshold[] quorumThresholds;
        uint48 commitDuration;
        uint8 requiredKeyTag;
        address sigVerifier;
    }

    struct QuorumThreshold {
        uint8 keyTag;
        uint208 threshold;
    }

    struct ValSetHeader {
        uint8 version;
        IBaseKeyManager.Key[] activeAggregatedKeys;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        bytes extraData;
    }

    function SettlementManager_VERSION() external pure returns (uint64);

    function VALIDATOR_SET_VERSION() external pure returns (uint8);

    function getCurrentValSetTimestamp() external view returns (uint48);

    function getQuorumThresholdAt(uint8 keyTag, uint48 timestamp, bytes memory hint) external view returns (uint208);

    function getQuorumThreshold(
        uint8 keyTag
    ) external view returns (uint208);

    function getCommitDurationAt(uint48 timestamp, bytes memory hint) external view returns (uint48);

    function getCommitDuration() external view returns (uint48);

    function getRequiredKeyTagAt(uint48 timestamp, bytes memory hint) external view returns (uint8);

    function getRequiredKeyTag() external view returns (uint8);

    function getSigVerifierAt(uint48 timestamp, bytes memory hint) external view returns (address);

    function getSigVerifier() external view returns (address);

    function isValSetHeaderSubmittedAt(
        uint48 epoch
    ) external view returns (bool);

    function isValSetHeaderSubmitted() external view returns (bool);

    function getCurrentPhase() external view returns (ValSetPhase);

    function getValSetHeaderAt(
        uint48 epoch
    ) external view returns (ValSetHeader memory);

    function getValSetHeader() external view returns (ValSetHeader memory);

    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint8);

    function getVersionFromValSetHeader() external view returns (uint8);

    function getActiveAggregatedKeyFromValSetHeaderAt(
        uint48 epoch,
        uint8 keyTag
    ) external view returns (bytes memory);

    function getActiveAggregatedKeyFromValSetHeader(
        uint8 keyTag
    ) external view returns (bytes memory);

    function getTotalActiveVotingPowerFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint256);

    function getTotalActiveVotingPowerFromValSetHeader() external view returns (uint256);

    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (bytes32);

    function getValidatorsSszMRootFromValSetHeader() external view returns (bytes32);

    function getExtraDataFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (bytes memory);

    function getExtraDataFromValSetHeader() external view returns (bytes memory);

    function verifyQuorumSig(
        bytes memory message,
        uint8 keyTag,
        uint208 quorumThreshold,
        bytes calldata proof
    ) external view returns (bool);

    function setQuorumThreshold(uint8 keyTag, uint208 threshold) external;

    function setCommitDuration(
        uint48 commitDuration
    ) external;

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) external;

    function setSigVerifier(
        address sigVerifier
    ) external;

    function setGenesis(
        ValSetHeader memory valSetHeader
    ) external;

    function commitValSetHeader(ValSetHeader memory header, bytes calldata proof) external;
}
