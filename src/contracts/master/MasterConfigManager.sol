// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManager} from "../SDK/managers/extendable/AccessManager.sol";

import {PersistentSet} from "../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

abstract contract MasterConfigManager is AccessManager {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    uint64 public constant MasterConfigManager_VERSION = 1;

    error AlreadyAdded();
    error NotAdded();

    struct MasterConfigHints {
        bytes[] stakeProvidersHints;
        bytes keysProviderHint;
        bytes[] replicasHints;
    }

    struct MasterConfig {
        CrossChainAddress[] stakeProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] replicas;
    }

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
    }

    struct MasterConfigManagerStorage {
        PersistentSet.Bytes32Set _stakeProviders;
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

        for (uint256 i; i < masterConfig.stakeProviders.length; ++i) {
            if (!$._stakeProviders.add(Time.timestamp(), _serializeCrossChainAddress(masterConfig.stakeProviders[i]))) {
                revert AlreadyAdded();
            }
        }

        $._keysProvider.push(Time.timestamp(), uint256(_serializeCrossChainAddress(masterConfig.keysProvider)));

        for (uint256 i; i < masterConfig.replicas.length; ++i) {
            if (!$._replicas.add(Time.timestamp(), _serializeCrossChainAddress(masterConfig.replicas[i]))) {
                revert AlreadyAdded();
            }
        }
    }

    function isStakeProviderActiveAt(
        CrossChainAddress memory stakeProvider,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getMasterConfigManagerStorage()._stakeProviders.contains(
            timestamp, _serializeCrossChainAddress(stakeProvider), hint
        );
    }

    function isStakeProviderActive(
        CrossChainAddress memory stakeProvider
    ) public view returns (bool) {
        return _getMasterConfigManagerStorage()._stakeProviders.contains(_serializeCrossChainAddress(stakeProvider));
    }

    function getActiveStakeProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (CrossChainAddress[] memory activeStakeProviders) {
        bytes32[] memory activeStakeProvidersRaw =
            _getMasterConfigManagerStorage()._stakeProviders.values(timestamp, hints);
        activeStakeProviders = new CrossChainAddress[](activeStakeProvidersRaw.length);
        for (uint256 i; i < activeStakeProvidersRaw.length; ++i) {
            activeStakeProviders[i] = _deserializeCrossChainAddress(activeStakeProvidersRaw[i]);
        }
    }

    function getActiveStakeProviders() public view returns (CrossChainAddress[] memory activeStakeProviders) {
        bytes32[] memory activeStakeProvidersRaw = _getMasterConfigManagerStorage()._stakeProviders.values();
        activeStakeProviders = new CrossChainAddress[](activeStakeProvidersRaw.length);
        for (uint256 i; i < activeStakeProvidersRaw.length; ++i) {
            activeStakeProviders[i] = _deserializeCrossChainAddress(activeStakeProvidersRaw[i]);
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
            stakeProviders: getActiveStakeProvidersAt(timestamp, masterConfigHints.stakeProvidersHints),
            keysProvider: getKeysProviderAt(timestamp, masterConfigHints.keysProviderHint),
            replicas: getActiveReplicasAt(timestamp, masterConfigHints.replicasHints)
        });
    }

    function getMasterConfig() public view returns (MasterConfig memory) {
        return MasterConfig({
            stakeProviders: getActiveStakeProviders(),
            keysProvider: getKeysProvider(),
            replicas: getActiveReplicas()
        });
    }

    function addStakeProvider(
        CrossChainAddress memory stakeProvider
    ) public checkAccess {
        if (
            !_getMasterConfigManagerStorage()._stakeProviders.add(
                Time.timestamp(), _serializeCrossChainAddress(stakeProvider)
            )
        ) {
            revert AlreadyAdded();
        }
    }

    function removeStakeProvider(
        CrossChainAddress memory stakeProvider
    ) public checkAccess {
        if (
            !_getMasterConfigManagerStorage()._stakeProviders.remove(
                Time.timestamp(), _serializeCrossChainAddress(stakeProvider)
            )
        ) {
            revert NotAdded();
        }
    }

    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public checkAccess {
        _getMasterConfigManagerStorage()._keysProvider.push(
            Time.timestamp(), uint256(_serializeCrossChainAddress(keysProvider))
        );
    }

    function addReplica(
        CrossChainAddress memory replica
    ) public checkAccess {
        if (!_getMasterConfigManagerStorage()._replicas.add(Time.timestamp(), _serializeCrossChainAddress(replica))) {
            revert AlreadyAdded();
        }
    }

    function removeReplica(
        CrossChainAddress memory replica
    ) public checkAccess {
        if (!_getMasterConfigManagerStorage()._replicas.remove(Time.timestamp(), _serializeCrossChainAddress(replica)))
        {
            revert NotAdded();
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
