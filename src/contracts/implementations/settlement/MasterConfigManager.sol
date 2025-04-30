// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {IMasterConfigManager} from "../../../interfaces/implementations/settlement/IMasterConfigManager.sol";

abstract contract MasterConfigManager is PermissionManager, IMasterConfigManager {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    /**
     * @inheritdoc IMasterConfigManager
     */
    uint64 public constant MasterConfigManager_VERSION = 1;

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
        MasterConfigManagerInitParams memory masterConfigManagerInitParams
    ) internal virtual onlyInitializing {
        for (uint256 i; i < masterConfigManagerInitParams.votingPowerProviders.length; ++i) {
            _addVotingPowerProvider(masterConfigManagerInitParams.votingPowerProviders[i]);
        }

        _setKeysProvider(masterConfigManagerInitParams.keysProvider);

        for (uint256 i; i < masterConfigManagerInitParams.replicas.length; ++i) {
            _addReplica(masterConfigManagerInitParams.replicas[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    // function isVotingPowerProviderActiveAt(
    //     CrossChainAddress memory votingPowerProvider,
    //     uint48 timestamp,
    //     bytes memory hint
    // ) public view virtual returns (bool) {
    //     return _getMasterConfigManagerStorage()._votingPowerProviders.contains(
    //         timestamp, _serializeCrossChainAddress(votingPowerProvider), hint
    //     );
    // }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    // function isVotingPowerProviderActive(
    //     CrossChainAddress memory votingPowerProvider
    // ) public view virtual returns (bool) {
    //     return _getMasterConfigManagerStorage()._votingPowerProviders.contains(
    //         _serializeCrossChainAddress(votingPowerProvider)
    //     );
    // }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    function getActiveVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (CrossChainAddress[] memory activeVotingPowerProviders) {
        bytes32[] memory activeVotingPowerProvidersRaw =
            _getMasterConfigManagerStorage()._votingPowerProviders.values(timestamp, hints);
        activeVotingPowerProviders = new CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = _deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    function getActiveVotingPowerProviders()
        internal
        view
        virtual
        returns (CrossChainAddress[] memory activeVotingPowerProviders)
    {
        bytes32[] memory activeVotingPowerProvidersRaw = _getMasterConfigManagerStorage()._votingPowerProviders.values();
        activeVotingPowerProviders = new CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = _deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    function getKeysProviderAt(
        uint48 timestamp,
        bytes memory hint
    ) internal view virtual returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(
            bytes32(_getMasterConfigManagerStorage()._keysProvider.upperLookupRecent(timestamp, hint))
        );
    }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    function getKeysProvider() internal view virtual returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(bytes32(_getMasterConfigManagerStorage()._keysProvider.latest()));
    }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    // function isReplicaActiveAt(
    //     CrossChainAddress memory replica,
    //     uint48 timestamp,
    //     bytes memory hint
    // ) public view virtual returns (bool) {
    //     return
    //         _getMasterConfigManagerStorage()._replicas.contains(timestamp, _serializeCrossChainAddress(replica), hint);
    // }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    // function isReplicaActive(
    //     CrossChainAddress memory replica
    // ) public view virtual returns (bool) {
    //     return _getMasterConfigManagerStorage()._replicas.contains(_serializeCrossChainAddress(replica));
    // }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    function getActiveReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getMasterConfigManagerStorage()._replicas.values(timestamp, hints);
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigManager
    //  */
    function getActiveReplicas() internal view virtual returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getMasterConfigManagerStorage()._replicas.values();
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    /**
     * @inheritdoc IMasterConfigManager
     */
    function getMasterConfigAt(
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (MasterConfig memory) {
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

    /**
     * @inheritdoc IMasterConfigManager
     */
    function getMasterConfig() public view virtual returns (MasterConfig memory) {
        return MasterConfig({
            votingPowerProviders: getActiveVotingPowerProviders(),
            keysProvider: getKeysProvider(),
            replicas: getActiveReplicas()
        });
    }

    /**
     * @inheritdoc IMasterConfigManager
     */
    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _addVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IMasterConfigManager
     */
    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _removeVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IMasterConfigManager
     */
    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public virtual checkPermission {
        _setKeysProvider(keysProvider);
    }

    /**
     * @inheritdoc IMasterConfigManager
     */
    function addReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        _addReplica(replica);
    }

    /**
     * @inheritdoc IMasterConfigManager
     */
    function removeReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        _removeReplica(replica);
    }

    function _addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) internal virtual {
        if (
            !_getMasterConfigManagerStorage()._votingPowerProviders.add(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert MasterConfigManager_AlreadyAdded();
        }
    }

    function _removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) internal virtual {
        if (
            !_getMasterConfigManagerStorage()._votingPowerProviders.remove(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert MasterConfigManager_NotAdded();
        }
    }

    function _setKeysProvider(
        CrossChainAddress memory keysProvider
    ) internal virtual {
        _getMasterConfigManagerStorage()._keysProvider.push(
            Time.timestamp(), uint256(_serializeCrossChainAddress(keysProvider))
        );
    }

    function _addReplica(
        CrossChainAddress memory replica
    ) internal virtual {
        if (!_getMasterConfigManagerStorage()._replicas.add(Time.timestamp(), _serializeCrossChainAddress(replica))) {
            revert MasterConfigManager_AlreadyAdded();
        }
    }

    function _removeReplica(
        CrossChainAddress memory replica
    ) internal virtual {
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
