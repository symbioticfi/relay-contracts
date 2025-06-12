// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PersistentSet} from "../../../contracts/libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";

interface IConfigProvider {
    error ConfigProvider_NotAdded();
    error ConfigProvider_ChainAlreadyAdded();
    error ConfigProvider_KeyTagAlreadyAdded();
    error ConfigProvider_InvalidQuorumThreshold();
    error ConfigProvider_InvalidCrossChainAddress();
    error ConfigProvider_InvalidMaxValidatorsCount();

    /// @custom:storage-location erc7201:symbiotic.storage.ConfigProvider
    struct ConfigProviderStorage {
        mapping(uint64 => bool) _isVotingPowerProviderChainAdded;
        PersistentSet.Bytes32Set _votingPowerProviders;
        Checkpoints.Trace256 _keysProvider;
        mapping(uint64 => bool) _isReplicaChainAdded;
        PersistentSet.Bytes32Set _replicas;
        Checkpoints.Trace208 _verificationType;
        Checkpoints.Trace256 _maxVotingPower;
        Checkpoints.Trace256 _minInclusionVotingPower;
        Checkpoints.Trace208 _maxValidatorsCount;
        Checkpoints.Trace208 _requiredKeyTags;
        Checkpoints.Trace208 _requiredHeaderKeyTag;
        mapping(uint8 => bool) _isQuorumThresholdKeyTagAdded;
        PersistentSet.Bytes32Set _quorumThresholds;
    }

    struct ConfigProviderInitParams {
        CrossChainAddress[] votingPowerProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] replicas;
        uint32 verificationType;
        uint256 maxVotingPower;
        uint256 minInclusionVotingPower;
        uint208 maxValidatorsCount;
        uint8[] requiredKeyTags;
        uint8 requiredHeaderKeyTag;
        QuorumThreshold[] quorumThresholds;
    }

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
    }

    struct QuorumThreshold {
        uint8 keyTag;
        uint248 quorumThreshold;
    }

    struct Config {
        CrossChainAddress[] votingPowerProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] replicas;
        uint32 verificationType;
        uint256 maxVotingPower;
        uint256 minInclusionVotingPower;
        uint208 maxValidatorsCount;
        uint8[] requiredKeyTags;
        uint8 requiredHeaderKeyTag;
        QuorumThreshold[] quorumThresholds;
    }

    event AddVotingPowerProvider(CrossChainAddress votingPowerProvider);

    event RemoveVotingPowerProvider(CrossChainAddress votingPowerProvider);

    event SetKeysProvider(CrossChainAddress keysProvider);

    event AddReplica(CrossChainAddress replica);

    event RemoveReplica(CrossChainAddress replica);

    event SetVerificationType(uint32 verificationType);

    event SetMaxVotingPower(uint256 maxVotingPower);

    event SetMinInclusionVotingPower(uint256 minInclusionVotingPower);

    event SetMaxValidatorsCount(uint208 maxValidatorsCount);

    event SetRequiredKeyTags(uint8[] requiredKeyTags);

    event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag);

    event AddQuorumThreshold(QuorumThreshold quorumThreshold);

    event RemoveQuorumThreshold(QuorumThreshold quorumThreshold);

    function MAX_QUORUM_THRESHOLD() external view returns (uint248);

    function isVotingPowerProviderRegisteredAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp
    ) external view returns (bool);

    function isVotingPowerProviderRegistered(
        CrossChainAddress memory votingPowerProvider
    ) external view returns (bool);

    function getVotingPowerProvidersAt(
        uint48 timestamp
    ) external view returns (CrossChainAddress[] memory);

    function getVotingPowerProviders() external view returns (CrossChainAddress[] memory);

    function getKeysProviderAt(
        uint48 timestamp
    ) external view returns (CrossChainAddress memory);

    function getKeysProvider() external view returns (CrossChainAddress memory);

    function isReplicaRegisteredAt(CrossChainAddress memory replica, uint48 timestamp) external view returns (bool);

    function isReplicaRegistered(
        CrossChainAddress memory replica
    ) external view returns (bool);

    function getReplicasAt(
        uint48 timestamp
    ) external view returns (CrossChainAddress[] memory);

    function getReplicas() external view returns (CrossChainAddress[] memory);

    function getVerificationTypeAt(
        uint48 timestamp
    ) external view returns (uint32);

    function getVerificationType() external view returns (uint32);

    function getMaxVotingPowerAt(
        uint48 timestamp
    ) external view returns (uint256);

    function getMaxVotingPower() external view returns (uint256);

    function getMinInclusionVotingPowerAt(
        uint48 timestamp
    ) external view returns (uint256);

    function getMinInclusionVotingPower() external view returns (uint256);

    function getMaxValidatorsCountAt(
        uint48 timestamp
    ) external view returns (uint208);

    function getMaxValidatorsCount() external view returns (uint208);

    function getRequiredKeyTagsAt(
        uint48 timestamp
    ) external view returns (uint8[] memory);

    function getRequiredKeyTags() external view returns (uint8[] memory);

    function getRequiredHeaderKeyTagAt(
        uint48 timestamp
    ) external view returns (uint8);

    function getRequiredHeaderKeyTag() external view returns (uint8);

    function getQuorumThresholdsAt(
        uint48 timestamp
    ) external view returns (QuorumThreshold[] memory);

    function getQuorumThresholds() external view returns (QuorumThreshold[] memory);

    function getConfigAt(
        uint48 timestamp
    ) external view returns (Config memory);

    function getConfig() external view returns (Config memory);

    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) external;

    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) external;

    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) external;

    function addReplica(
        CrossChainAddress memory replica
    ) external;

    function removeReplica(
        CrossChainAddress memory replica
    ) external;

    function setVerificationType(
        uint32 verificationType
    ) external;

    function setMaxVotingPower(
        uint256 maxVotingPower
    ) external;

    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) external;

    function setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) external;

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) external;

    function setRequiredHeaderKeyTag(
        uint8 requiredHeaderKeyTag
    ) external;

    function addQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) external;

    function removeQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) external;
}
