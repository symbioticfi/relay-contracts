// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PersistentSet} from "../../../contracts/libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";

interface IMasterConfigManager {
    error MasterConfigManager_AlreadyAdded();
    error MasterConfigManager_NotAdded();

    /// @custom:storage-location erc7201:symbiotic.storage.MasterConfigManager
    struct MasterConfigManagerStorage {
        PersistentSet.Bytes32Set _votingPowerProviders;
        Checkpoints.Trace256 _keysProvider;
        PersistentSet.Bytes32Set _replicas;
    }

    struct MasterConfigManagerInitParams {
        CrossChainAddress[] votingPowerProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] replicas;
    }

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
    }

    struct MasterConfig {
        CrossChainAddress[] votingPowerProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] replicas;
    }

    struct MasterConfigHints {
        bytes[] votingPowerProvidersHints;
        bytes keysProviderHint;
        bytes[] replicasHints;
    }

    function MasterConfigManager_VERSION() external pure returns (uint64);

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

    function getMasterConfigAt(uint48 timestamp, bytes memory hints) external view returns (MasterConfig memory);

    function getMasterConfig() external view returns (MasterConfig memory);

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
}
