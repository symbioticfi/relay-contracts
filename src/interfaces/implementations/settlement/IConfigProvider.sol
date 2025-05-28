// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PersistentSet} from "../../../contracts/libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";

interface IConfigProvider {
    error ConfigProvider_AlreadyAdded();
    error ConfigProvider_NotAdded();

    /// @custom:storage-location erc7201:symbiotic.storage.ConfigProvider
    struct ConfigProviderStorage {
        PersistentSet.Bytes32Set _votingPowerProviders;
        Checkpoints.Trace256 _keysProvider;
        PersistentSet.Bytes32Set _replicas;
        Checkpoints.Trace208 _verificationType;
        Checkpoints.Trace256 _maxVotingPower;
        Checkpoints.Trace256 _minInclusionVotingPower;
        Checkpoints.Trace208 _maxValidatorsCount;
        Checkpoints.Trace208 _requiredKeyTags;
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
    }

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
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
    }

    struct ConfigHints {
        bytes[] votingPowerProvidersHints;
        bytes keysProviderHint;
        bytes[] replicasHints;
        bytes verificationTypeHint;
        bytes maxVotingPowerHint;
        bytes minInclusionVotingPowerHint;
        bytes maxValidatorsCountHint;
        bytes requiredKeyTagsHint;
    }

    function ConfigProvider_VERSION() external pure returns (uint64);

    function isVotingPowerProviderActiveAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function isVotingPowerProviderActive(
        CrossChainAddress memory votingPowerProvider
    ) external view returns (bool);

    function getActiveVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) external view returns (CrossChainAddress[] memory);

    function getActiveVotingPowerProviders() external view returns (CrossChainAddress[] memory);

    function getKeysProviderAt(uint48 timestamp, bytes memory hint) external view returns (CrossChainAddress memory);

    function getKeysProvider() external view returns (CrossChainAddress memory);

    function isReplicaActiveAt(
        CrossChainAddress memory replica,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function isReplicaActive(
        CrossChainAddress memory replica
    ) external view returns (bool);

    function getActiveReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) external view returns (CrossChainAddress[] memory);

    function getActiveReplicas() external view returns (CrossChainAddress[] memory);

    function getVerificationTypeAt(uint48 timestamp, bytes memory hint) external view returns (uint32);

    function getVerificationType() external view returns (uint32);

    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function getMaxVotingPower() external view returns (uint256);

    function getMinInclusionVotingPowerAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function getMinInclusionVotingPower() external view returns (uint256);

    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) external view returns (uint208);

    function getMaxValidatorsCount() external view returns (uint208);

    function getRequiredKeyTagsAt(uint48 timestamp, bytes memory hint) external view returns (uint8[] memory);

    function getRequiredKeyTags() external view returns (uint8[] memory);

    function getConfigAt(uint48 timestamp, bytes memory hints) external view returns (Config memory);

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
}
