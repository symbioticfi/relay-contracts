// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochManager} from "./EpochManager.sol";

import {Updatable} from "../libraries/structs/Updatable.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract SettlementConfigManager is EpochManager {
    using Updatable for Updatable.Uint48Value;
    using Updatable for Updatable.Bytes32Value;
    using EnumerableSet for EnumerableSet.Bytes32Set;

    error Duplicate();

    struct SettlementConfigManagerInitParams {
        bytes baseParams;
        SettlementConfig settlementConfig;
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

    EnumerableSet.Bytes32Set _stakeProviders;
    mapping(bytes32 compressedStakeProvider => Updatable.Uint48Value) _stakeProviderStatuses;
    Updatable.Bytes32Value _keysProvider;
    EnumerableSet.Bytes32Set _replicas;
    mapping(bytes32 compressedReplica => Updatable.Uint48Value) _replicaStatuses;

    constructor(
        address factory
    ) EpochManager(factory) {}

    function getAllStakeProviders() public view returns (CrossChainAddress[] memory allStakeProviders) {
        allStakeProviders = new CrossChainAddress[](_stakeProviders.length());
        for (uint256 i; i < allStakeProviders.length; ++i) {
            allStakeProviders[i] = _deserializeCrossChainAddress(_stakeProviders.at(i));
        }
    }

    function isStakeProviderActive(
        CrossChainAddress memory stakeProvider,
        uint48 timestamp
    ) public view returns (bool) {
        return _stakeProviderStatuses[_serializeCrossChainAddress(stakeProvider)].get(_getEpoch(timestamp)) == 1;
    }

    function isStakeProviderActive(
        CrossChainAddress memory stakeProvider
    ) public view returns (bool) {
        return isStakeProviderActive(stakeProvider, Time.timestamp());
    }

    function getActiveStakeProviders(
        uint48 timestamp
    ) public view returns (CrossChainAddress[] memory activeStakeProviders) {
        CrossChainAddress[] memory allStakeProviders = getAllStakeProviders();
        uint256 length;
        for (uint256 i; i < allStakeProviders.length; ++i) {
            if (isStakeProviderActive(allStakeProviders[i], timestamp)) {
                activeStakeProviders[length++] = allStakeProviders[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeStakeProviders, length)
        }
    }

    function getActiveStakeProviders() public view returns (CrossChainAddress[] memory) {
        return getActiveStakeProviders(Time.timestamp());
    }

    function getKeysProvider(
        uint48 timestamp
    ) public view returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(_keysProvider.get(_getEpoch(timestamp)));
    }

    function getKeysProvider() public view returns (CrossChainAddress memory) {
        return getKeysProvider(Time.timestamp());
    }

    function getAllReplicas() public view returns (CrossChainAddress[] memory allReplicas) {
        allReplicas = new CrossChainAddress[](_replicas.length());
        for (uint256 i; i < allReplicas.length; ++i) {
            allReplicas[i] = _deserializeCrossChainAddress(_replicas.at(i));
        }
    }

    function isReplicaActive(CrossChainAddress memory replica, uint48 timestamp) public view returns (bool) {
        return _replicaStatuses[_serializeCrossChainAddress(replica)].get(_getEpoch(timestamp)) == 1;
    }

    function isReplicaActive(
        CrossChainAddress memory replica
    ) public view returns (bool) {
        return isReplicaActive(replica, Time.timestamp());
    }

    function getActiveReplicas(
        uint48 timestamp
    ) public view returns (CrossChainAddress[] memory activeReplicas) {
        CrossChainAddress[] memory allReplicas = getAllReplicas();
        uint256 length;
        for (uint256 i; i < allReplicas.length; ++i) {
            if (isReplicaActive(allReplicas[i], timestamp)) {
                activeReplicas[length++] = allReplicas[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeReplicas, length)
        }
    }

    function getActiveReplicas() public view returns (CrossChainAddress[] memory) {
        return getActiveReplicas(Time.timestamp());
    }

    function getSettlementConfig(
        uint48 timestamp
    ) public view returns (SettlementConfig memory) {
        return SettlementConfig({
            stakeProviders: getActiveStakeProviders(timestamp),
            keysProvider: getKeysProvider(timestamp),
            replicas: getActiveReplicas(timestamp)
        });
    }

    function getSettlementConfig() public view returns (SettlementConfig memory) {
        return getSettlementConfig(Time.timestamp());
    }

    function _initialize(uint64 initialVersion, address owner, bytes memory data) internal virtual override {
        SettlementConfigManagerInitParams memory initParams = abi.decode(data, (SettlementConfigManagerInitParams));
        super._initialize(initialVersion, owner, initParams.baseParams);

        for (uint256 i; i < initParams.settlementConfig.stakeProviders.length; ++i) {
            bytes32 compressedStakeProvider = _serializeCrossChainAddress(initParams.settlementConfig.stakeProviders[i]);
            if (!_stakeProviders.add(compressedStakeProvider)) {
                revert Duplicate();
            }
            _stakeProviderStatuses[compressedStakeProvider].set(0, 1);
        }

        _keysProvider.set(0, _serializeCrossChainAddress(initParams.settlementConfig.keysProvider));

        for (uint256 i; i < initParams.settlementConfig.replicas.length; ++i) {
            bytes32 compressedReplica = _serializeCrossChainAddress(initParams.settlementConfig.replicas[i]);
            if (!_replicas.add(compressedReplica)) {
                revert Duplicate();
            }
            _replicaStatuses[compressedReplica].set(0, 1);
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
