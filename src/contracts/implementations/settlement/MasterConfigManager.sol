// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

abstract contract MasterConfigManager is PermissionManager {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    uint64 public constant MasterConfigManager_VERSION = 1;

    error MasterConfigManager_AlreadyAdded();
    error MasterConfigManager_NotAdded();

    struct MasterConfigHints {
        bytes[] votingPowerProvidersHints;
        bytes keysProviderHint;
        bytes[] replicasHints;
    }

    struct MasterConfig {
        CrossChainAddress[] votingPowerProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] replicas;
    }

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
    }

    struct MasterConfigManagerStorage {
        PersistentSet.Bytes32Set _votingPowerProviders;
        Checkpoints.Trace256 _keysProvider;
        PersistentSet.Bytes32Set _replicas;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.MasterConfigManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant MasterConfigManagerStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _getMasterConfigManagerStorage() internal pure returns (MasterConfigManagerStorage storage $) {
        bytes32 location = MasterConfigManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __MasterConfigManager_init(
        MasterConfig memory masterConfig
    ) internal virtual onlyInitializing {
        MasterConfigManagerStorage storage $ = _getMasterConfigManagerStorage();

        for (uint256 i; i < masterConfig.votingPowerProviders.length; ++i) {
            if (
                !$._votingPowerProviders.add(
                    Time.timestamp(), _serializeCrossChainAddress(masterConfig.votingPowerProviders[i])
                )
            ) {
                revert MasterConfigManager_AlreadyAdded();
            }
        }

        $._keysProvider.push(Time.timestamp(), uint256(_serializeCrossChainAddress(masterConfig.keysProvider)));

        for (uint256 i; i < masterConfig.replicas.length; ++i) {
            if (!$._replicas.add(Time.timestamp(), _serializeCrossChainAddress(masterConfig.replicas[i]))) {
                revert MasterConfigManager_AlreadyAdded();
            }
        }
    }

    function isVotingPowerProviderActiveAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getMasterConfigManagerStorage()._votingPowerProviders.contains(
            timestamp, _serializeCrossChainAddress(votingPowerProvider), hint
        );
    }

    function isVotingPowerProviderActive(
        CrossChainAddress memory votingPowerProvider
    ) public view returns (bool) {
        return _getMasterConfigManagerStorage()._votingPowerProviders.contains(
            _serializeCrossChainAddress(votingPowerProvider)
        );
    }

    function getActiveVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (CrossChainAddress[] memory activeVotingPowerProviders) {
        bytes32[] memory activeVotingPowerProvidersRaw =
            _getMasterConfigManagerStorage()._votingPowerProviders.values(timestamp, hints);
        activeVotingPowerProviders = new CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = _deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    function getActiveVotingPowerProviders()
        public
        view
        returns (CrossChainAddress[] memory activeVotingPowerProviders)
    {
        bytes32[] memory activeVotingPowerProvidersRaw = _getMasterConfigManagerStorage()._votingPowerProviders.values();
        activeVotingPowerProviders = new CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = _deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    function getKeysProviderAt(uint48 timestamp, bytes memory hint) public view returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(
            bytes32(_getMasterConfigManagerStorage()._keysProvider.upperLookupRecent(timestamp, hint))
        );
    }

    function getKeysProvider() public view returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(bytes32(_getMasterConfigManagerStorage()._keysProvider.latest()));
    }

    function isReplicaActiveAt(
        CrossChainAddress memory replica,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return
            _getMasterConfigManagerStorage()._replicas.contains(timestamp, _serializeCrossChainAddress(replica), hint);
    }

    function isReplicaActive(
        CrossChainAddress memory replica
    ) public view returns (bool) {
        return _getMasterConfigManagerStorage()._replicas.contains(_serializeCrossChainAddress(replica));
    }

    function getActiveReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getMasterConfigManagerStorage()._replicas.values(timestamp, hints);
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    function getActiveReplicas() public view returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getMasterConfigManagerStorage()._replicas.values();
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    function getMasterConfigAt(uint48 timestamp, bytes memory hints) public view returns (MasterConfig memory) {
        MasterConfigHints memory masterConfigHints;
        if (hints.length > 0) {
            masterConfigHints = abi.decode(hints, (MasterConfigHints));
        }

        return MasterConfig({
            votingPowerProviders: getActiveVotingPowerProvidersAt(timestamp, masterConfigHints.votingPowerProvidersHints),
            keysProvider: getKeysProviderAt(timestamp, masterConfigHints.keysProviderHint),
            replicas: getActiveReplicasAt(timestamp, masterConfigHints.replicasHints)
        });
    }

    function getMasterConfig() public view returns (MasterConfig memory) {
        return MasterConfig({
            votingPowerProviders: getActiveVotingPowerProviders(),
            keysProvider: getKeysProvider(),
            replicas: getActiveReplicas()
        });
    }

    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public checkPermission {
        if (
            !_getMasterConfigManagerStorage()._votingPowerProviders.add(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert MasterConfigManager_AlreadyAdded();
        }
    }

    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public checkPermission {
        if (
            !_getMasterConfigManagerStorage()._votingPowerProviders.remove(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert MasterConfigManager_NotAdded();
        }
    }

    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public checkPermission {
        _getMasterConfigManagerStorage()._keysProvider.push(
            Time.timestamp(), uint256(_serializeCrossChainAddress(keysProvider))
        );
    }

    function addReplica(
        CrossChainAddress memory replica
    ) public checkPermission {
        if (!_getMasterConfigManagerStorage()._replicas.add(Time.timestamp(), _serializeCrossChainAddress(replica))) {
            revert MasterConfigManager_AlreadyAdded();
        }
    }

    function removeReplica(
        CrossChainAddress memory replica
    ) public checkPermission {
        if (!_getMasterConfigManagerStorage()._replicas.remove(Time.timestamp(), _serializeCrossChainAddress(replica)))
        {
            revert MasterConfigManager_NotAdded();
        }
    }

    function _deserializeCrossChainAddress(
        bytes32 compressedAddress
    ) internal pure returns (CrossChainAddress memory) {
        return CrossChainAddress({
            addr: address(uint160(uint256(compressedAddress))),
            chainId: uint64(uint256(compressedAddress) >> 160)
        });
    }

    function _serializeCrossChainAddress(
        CrossChainAddress memory crossChainAddress
    ) internal pure returns (bytes32) {
        return bytes32(uint256(crossChainAddress.chainId) << 160 | uint160(crossChainAddress.addr));
    }
}
