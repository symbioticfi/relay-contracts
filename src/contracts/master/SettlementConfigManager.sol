// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManager} from "../SDK/managers/extendable/AccessManager.sol";

import {PersistentSet} from "../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

abstract contract SettlementConfigManager is AccessManager {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    error AlreadyAdded();
    error NotAdded();

    struct SettlementConfigHints {
        bytes[] stakeProvidersHints;
        bytes keysProviderHint;
        bytes[] replicasHints;
    }

    struct SettlementConfig {
        CrossChainAddress[] stakeProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] replicas;
    }

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
    }

    struct SettlementConfigManagerStorage {
        PersistentSet.Bytes32Set _stakeProviders;
        Checkpoints.Trace256 _keysProvider;
        PersistentSet.Bytes32Set _replicas;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SettlementConfigManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementConfigManagerStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _getSettlementConfigManagerStorage() internal pure returns (SettlementConfigManagerStorage storage $) {
        bytes32 location = SettlementConfigManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __SettlementConfigManager_init(
        SettlementConfig memory settlementConfig
    ) internal virtual onlyInitializing {
        SettlementConfigManagerStorage storage $ = _getSettlementConfigManagerStorage();

        for (uint256 i; i < settlementConfig.stakeProviders.length; ++i) {
            if (
                !$._stakeProviders.add(Time.timestamp(), _serializeCrossChainAddress(settlementConfig.stakeProviders[i]))
            ) {
                revert AlreadyAdded();
            }
        }

        $._keysProvider.push(Time.timestamp(), uint256(_serializeCrossChainAddress(settlementConfig.keysProvider)));

        for (uint256 i; i < settlementConfig.replicas.length; ++i) {
            if (!$._replicas.add(Time.timestamp(), _serializeCrossChainAddress(settlementConfig.replicas[i]))) {
                revert AlreadyAdded();
            }
        }
    }

    function isStakeProviderActive(
        CrossChainAddress memory stakeProvider,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getSettlementConfigManagerStorage()._stakeProviders.contains(
            timestamp, _serializeCrossChainAddress(stakeProvider), hint
        );
    }

    function isStakeProviderActive(
        CrossChainAddress memory stakeProvider
    ) public view returns (bool) {
        return _getSettlementConfigManagerStorage()._stakeProviders.contains(_serializeCrossChainAddress(stakeProvider));
    }

    function getActiveStakeProviders(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (CrossChainAddress[] memory activeStakeProviders) {
        bytes32[] memory activeStakeProvidersRaw =
            _getSettlementConfigManagerStorage()._stakeProviders.values(timestamp, hints);
        activeStakeProviders = new CrossChainAddress[](activeStakeProvidersRaw.length);
        for (uint256 i; i < activeStakeProvidersRaw.length; ++i) {
            activeStakeProviders[i] = _deserializeCrossChainAddress(activeStakeProvidersRaw[i]);
        }
    }

    function getActiveStakeProviders() public view returns (CrossChainAddress[] memory activeStakeProviders) {
        bytes32[] memory activeStakeProvidersRaw = _getSettlementConfigManagerStorage()._stakeProviders.values();
        activeStakeProviders = new CrossChainAddress[](activeStakeProvidersRaw.length);
        for (uint256 i; i < activeStakeProvidersRaw.length; ++i) {
            activeStakeProviders[i] = _deserializeCrossChainAddress(activeStakeProvidersRaw[i]);
        }
    }

    function getKeysProvider(uint48 timestamp, bytes memory hint) public view returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(
            bytes32(_getSettlementConfigManagerStorage()._keysProvider.upperLookupRecent(timestamp, hint))
        );
    }

    function getKeysProvider() public view returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(bytes32(_getSettlementConfigManagerStorage()._keysProvider.latest()));
    }

    function isReplicaActive(
        CrossChainAddress memory replica,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getSettlementConfigManagerStorage()._replicas.contains(
            timestamp, _serializeCrossChainAddress(replica), hint
        );
    }

    function isReplicaActive(
        CrossChainAddress memory replica
    ) public view returns (bool) {
        return _getSettlementConfigManagerStorage()._replicas.contains(_serializeCrossChainAddress(replica));
    }

    function getActiveReplicas(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getSettlementConfigManagerStorage()._replicas.values(timestamp, hints);
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    function getActiveReplicas() public view returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getSettlementConfigManagerStorage()._replicas.values();
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    function getSettlementConfig(uint48 timestamp, bytes memory hints) public view returns (SettlementConfig memory) {
        SettlementConfigHints memory settlementConfigHints;
        if (hints.length > 0) {
            settlementConfigHints = abi.decode(hints, (SettlementConfigHints));
        }

        return SettlementConfig({
            stakeProviders: getActiveStakeProviders(timestamp, settlementConfigHints.stakeProvidersHints),
            keysProvider: getKeysProvider(timestamp, settlementConfigHints.keysProviderHint),
            replicas: getActiveReplicas(timestamp, settlementConfigHints.replicasHints)
        });
    }

    function getSettlementConfig() public view returns (SettlementConfig memory) {
        return SettlementConfig({
            stakeProviders: getActiveStakeProviders(),
            keysProvider: getKeysProvider(),
            replicas: getActiveReplicas()
        });
    }

    function addStakeProvider(
        CrossChainAddress memory stakeProvider
    ) public checkAccess {
        if (
            !_getSettlementConfigManagerStorage()._stakeProviders.add(
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
            !_getSettlementConfigManagerStorage()._stakeProviders.remove(
                Time.timestamp(), _serializeCrossChainAddress(stakeProvider)
            )
        ) {
            revert NotAdded();
        }
    }

    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public checkAccess {
        _getSettlementConfigManagerStorage()._keysProvider.push(
            Time.timestamp(), uint256(_serializeCrossChainAddress(keysProvider))
        );
    }

    function addReplica(
        CrossChainAddress memory replica
    ) public checkAccess {
        if (!_getSettlementConfigManagerStorage()._replicas.add(Time.timestamp(), _serializeCrossChainAddress(replica)))
        {
            revert AlreadyAdded();
        }
    }

    function removeReplica(
        CrossChainAddress memory replica
    ) public checkAccess {
        if (
            !_getSettlementConfigManagerStorage()._replicas.remove(
                Time.timestamp(), _serializeCrossChainAddress(replica)
            )
        ) {
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
