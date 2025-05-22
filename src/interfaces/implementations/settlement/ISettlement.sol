// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../../base/INetworkManager.sol";
import {IEpochManager} from "../../base/IEpochManager.sol";
import {IBaseKeyManager} from "../../base/IBaseKeyManager.sol";
import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";

interface ISettlement {
    error Settlement_InvalidPhase();
    error Settlement_InvalidVersion();
    error Settlement_Duplicate();
    error Settlement_VerificationFailed();
    error Settlement_EpochDurationTooShort();
    error Settlement_InvalidKey();
    error Settlement_ValSetHeaderAlreadySubmitted();
    error Settlement_InvalidEpoch();
    error Settlement_InvalidEpochStart();

    enum ValSetPhase {
        IDLE,
        COMMIT,
        PROLONG,
        FAIL
    }

    /// @custom:storage-location erc7201:symbiotic.storage.Settlement
    struct SettlementStorage {
        uint48 _prolongDuration;
        uint48 _lastCommittedHeaderEpoch;
        uint48 _lastCommittedHeaderCaptureTimestamp;
        Checkpoints.Trace208 _requiredKeyTag;
        Checkpoints.Trace208 _commitDuration;
        Checkpoints.Trace208 _sigVerifier;
        Checkpoints.Trace208 _verificationType;
        mapping(uint48 epoch => ValSetHeader) _valSetHeader;
        mapping(uint48 epoch => mapping(bytes32 key => bytes32 value)) _extraData;
    }

    struct SettlementInitParams {
        INetworkManager.NetworkManagerInitParams networkManagerInitParams;
        IEpochManager.EpochManagerInitParams epochManagerInitParams;
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
        uint48 commitDuration;
        uint48 prolongDuration;
        uint8 requiredKeyTag;
        address sigVerifier;
        uint128 verificationType;
    }

    struct ValSetHeader {
        uint8 version;
        uint8 requiredKeyTag;
        uint48 epoch;
        uint48 epochStart;
        uint128 verificationType;
        uint256 quorumThreshold;
        bytes32 validatorsSszMRoot;
        bytes32 previousHeaderHash;
    }

    struct ExtraData {
        bytes32 key;
        bytes32 value;
    }

    function Settlement_VERSION() external pure returns (uint64);

    function VALIDATOR_SET_VERSION() external pure returns (uint8);

    function getCurrentValSetTimestamp(
        bytes memory hint
    ) external view returns (uint48);

    function getCurrentValSetEpoch() external view returns (uint48);

    function getCommitDurationAt(uint48 timestamp, bytes memory hint) external view returns (uint48);

    function getCommitDuration() external view returns (uint48);

    function getProlongDuration() external view returns (uint48);

    function getRequiredKeyTagAt(uint48 timestamp, bytes memory hint) external view returns (uint8);

    function getRequiredKeyTag() external view returns (uint8);

    function getSigVerifierAt(uint48 timestamp, bytes memory hint) external view returns (address);

    function getSigVerifier() external view returns (address);

    function getVerificationTypeAt(uint48 timestamp, bytes memory hint) external view returns (uint128);

    function getVerificationType() external view returns (uint128);

    function getLastCommittedHeaderCaptureTimestamp() external view returns (uint48);

    function isValSetHeaderCommittedAt(
        uint48 epoch
    ) external view returns (bool);

    function isValSetHeaderCommitted() external view returns (bool);

    function getCurrentPhase() external view returns (ValSetPhase);

    function getValSetHeaderAt(
        uint48 epoch
    ) external view returns (ValSetHeader memory);

    function getValSetHeader() external view returns (ValSetHeader memory);

    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint8);

    function getVersionFromValSetHeader() external view returns (uint8);

    function getRequiredKeyTagFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint8);

    function getRequiredKeyTagFromValSetHeader() external view returns (uint8);

    function getEpochStartFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint48);

    function getEpochStartFromValSetHeader() external view returns (uint48);

    function getVerificationTypeFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint128);

    function getVerificationTypeFromValSetHeader() external view returns (uint128);

    function getQuorumThresholdFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint256);

    function getQuorumThresholdFromValSetHeader() external view returns (uint256);

    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (bytes32);

    function getValidatorsSszMRootFromValSetHeader() external view returns (bytes32);

    function getPreviousHeaderHashFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (bytes32);

    function getPreviousHeaderHashFromValSetHeader() external view returns (bytes32);

    function getExtraDataAt(uint48 epoch, bytes32 key) external view returns (bytes32);

    function getExtraData(
        bytes32 key
    ) external view returns (bytes32);

    function verifyQuorumSig(
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint256 quorumThreshold,
        bytes calldata proof
    ) external view returns (bool);

    function setCommitDuration(
        uint48 commitDuration
    ) external;

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) external;

    function setSigVerifier(address sigVerifier, uint128 verificationType) external;

    function setGenesis(ValSetHeader calldata valSetHeader, ExtraData[] calldata extraData) external;

    function commitValSetHeader(
        ValSetHeader calldata header,
        ExtraData[] calldata extraData,
        bytes calldata proof
    ) external;
}
