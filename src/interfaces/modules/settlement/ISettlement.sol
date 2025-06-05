// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INetworkManager} from "../../base/INetworkManager.sol";
import {IEpochManager} from "../../base/IEpochManager.sol";
import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";

interface ISettlement {
    error Settlement_InvalidVersion();
    error Settlement_Duplicate();
    error Settlement_VerificationFailed();
    error Settlement_InvalidKey();
    error Settlement_ValSetHeaderAlreadySubmitted();
    error Settlement_InvalidEpoch();
    error Settlement_InvalidCaptureTimestamp();
    error Settlement_InvalidSigVerifier();
    error Settlement_InvalidPreviousHeaderHash();
    error Settlement_NoCheckpoint();

    /// @custom:storage-location erc7201:symbiotic.storage.Settlement
    struct SettlementStorage {
        uint48 _lastCommittedHeaderEpoch;
        Checkpoints.Trace208 _requiredKeyTag;
        Checkpoints.Trace208 _sigVerifier;
        mapping(uint48 epoch => ValSetHeader) _valSetHeader;
        mapping(uint48 epoch => mapping(bytes32 key => bytes32 value)) _extraData;
    }

    struct SettlementInitParams {
        INetworkManager.NetworkManagerInitParams networkManagerInitParams;
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
        uint8 requiredKeyTag;
        address sigVerifier;
    }

    struct ValSetHeader {
        uint8 version;
        uint8 requiredKeyTag;
        uint48 epoch;
        uint48 captureTimestamp;
        uint256 quorumThreshold;
        bytes32 validatorsSszMRoot;
        bytes32 previousHeaderHash;
    }

    struct ExtraData {
        bytes32 key;
        bytes32 value;
    }

    event InitRequiredKeyTag(uint8 requiredKeyTag);

    event InitSigVerifier(address sigVerifier);

    event SetRequiredKeyTag(uint8 requiredKeyTag);

    event SetSigVerifier(address sigVerifier);

    event SetGenesis(ValSetHeader valSetHeader, ExtraData[] extraData);

    event CommitValSetHeader(ValSetHeader valSetHeader, ExtraData[] extraData);

    function Settlement_VERSION() external view returns (uint64);

    function VALIDATOR_SET_VERSION() external view returns (uint8);

    function getRequiredKeyTagAt(uint48 epoch, bytes memory hint) external view returns (uint8);

    function getRequiredKeyTag() external view returns (uint8);

    function getSigVerifierAt(uint48 epoch, bytes memory hint) external view returns (address);

    function getSigVerifier() external view returns (address);

    function getLastCommittedHeaderEpoch() external view returns (uint48);

    function isValSetHeaderCommittedAt(
        uint48 epoch
    ) external view returns (bool);

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

    function getCaptureTimestampFromValSetHeaderAt(
        uint48 epoch
    ) external view returns (uint48);

    function getCaptureTimestampFromValSetHeader() external view returns (uint48);

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
        bytes calldata proof,
        bytes memory hint
    ) external view returns (bool);

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) external;

    function setSigVerifier(
        address sigVerifier
    ) external;

    function setGenesis(ValSetHeader calldata valSetHeader, ExtraData[] calldata extraData) external;

    function commitValSetHeader(
        ValSetHeader calldata header,
        ExtraData[] calldata extraData,
        bytes calldata proof,
        bytes memory hint
    ) external;
}
