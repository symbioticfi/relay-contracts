// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {IMasterConfigProvider} from "../../../interfaces/implementations/settlement/IMasterConfigProvider.sol";

abstract contract MasterConfigProvider is PermissionManager, IMasterConfigProvider {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    /**
     * @inheritdoc IMasterConfigProvider
     */
    uint64 public constant MasterConfigProvider_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.MasterConfigProvider")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant MasterConfigProviderStorageLocation =
        0x9873e25410bff4429fbc0a7b25e9af86ce0e61fa160ab8bd5f9c6688c41af900;

    function _getMasterConfigProviderStorage() internal pure returns (MasterConfigProviderStorage storage $) {
        bytes32 location = MasterConfigProviderStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __MasterConfigProvider_init(
        MasterConfigProviderInitParams memory masterConfigProviderInitParams
    ) internal virtual onlyInitializing {
        for (uint256 i; i < masterConfigProviderInitParams.votingPowerProviders.length; ++i) {
            _addVotingPowerProvider(masterConfigProviderInitParams.votingPowerProviders[i]);
        }

        _setKeysProvider(masterConfigProviderInitParams.keysProvider);

        for (uint256 i; i < masterConfigProviderInitParams.replicas.length; ++i) {
            _addReplica(masterConfigProviderInitParams.replicas[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    // function isVotingPowerProviderActiveAt(
    //     CrossChainAddress memory votingPowerProvider,
    //     uint48 timestamp,
    //     bytes memory hint
    // ) public view virtual returns (bool) {
    //     return _getMasterConfigProviderStorage()._votingPowerProviders.contains(
    //         timestamp, _serializeCrossChainAddress(votingPowerProvider), hint
    //     );
    // }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    // function isVotingPowerProviderActive(
    //     CrossChainAddress memory votingPowerProvider
    // ) public view virtual returns (bool) {
    //     return _getMasterConfigProviderStorage()._votingPowerProviders.contains(
    //         _serializeCrossChainAddress(votingPowerProvider)
    //     );
    // }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    function getActiveVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (CrossChainAddress[] memory activeVotingPowerProviders) {
        bytes32[] memory activeVotingPowerProvidersRaw =
            _getMasterConfigProviderStorage()._votingPowerProviders.valuesAt(timestamp, hints);
        activeVotingPowerProviders = new CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = _deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    function getActiveVotingPowerProviders()
        internal
        view
        virtual
        returns (CrossChainAddress[] memory activeVotingPowerProviders)
    {
        bytes32[] memory activeVotingPowerProvidersRaw =
            _getMasterConfigProviderStorage()._votingPowerProviders.values();
        activeVotingPowerProviders = new CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = _deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    function getKeysProviderAt(
        uint48 timestamp,
        bytes memory hint
    ) internal view virtual returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(
            bytes32(_getMasterConfigProviderStorage()._keysProvider.upperLookupRecent(timestamp, hint))
        );
    }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    function getKeysProvider() internal view virtual returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(bytes32(_getMasterConfigProviderStorage()._keysProvider.latest()));
    }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    // function isReplicaActiveAt(
    //     CrossChainAddress memory replica,
    //     uint48 timestamp,
    //     bytes memory hint
    // ) public view virtual returns (bool) {
    //     return
    //         _getMasterConfigProviderStorage()._replicas.contains(timestamp, _serializeCrossChainAddress(replica), hint);
    // }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    // function isReplicaActive(
    //     CrossChainAddress memory replica
    // ) public view virtual returns (bool) {
    //     return _getMasterConfigProviderStorage()._replicas.contains(_serializeCrossChainAddress(replica));
    // }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    function getActiveReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getMasterConfigProviderStorage()._replicas.valuesAt(timestamp, hints);
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    // /**
    //  * @inheritdoc IMasterConfigProvider
    //  */
    function getActiveReplicas() internal view virtual returns (CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getMasterConfigProviderStorage()._replicas.values();
        activeReplicas = new CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = _deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    /**
     * @inheritdoc IMasterConfigProvider
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
     * @inheritdoc IMasterConfigProvider
     */
    function getMasterConfig() public view virtual returns (MasterConfig memory) {
        return MasterConfig({
            votingPowerProviders: getActiveVotingPowerProviders(),
            keysProvider: getKeysProvider(),
            replicas: getActiveReplicas()
        });
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _addVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _removeVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public virtual checkPermission {
        _setKeysProvider(keysProvider);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function addReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        _addReplica(replica);
    }

    /**
     * @inheritdoc IMasterConfigProvider
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
            !_getMasterConfigProviderStorage()._votingPowerProviders.add(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert MasterConfigProvider_AlreadyAdded();
        }
    }

    function _removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) internal virtual {
        if (
            !_getMasterConfigProviderStorage()._votingPowerProviders.remove(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert MasterConfigProvider_NotAdded();
        }
    }

    function _setKeysProvider(
        CrossChainAddress memory keysProvider
    ) internal virtual {
        _getMasterConfigProviderStorage()._keysProvider.push(
            Time.timestamp(), uint256(_serializeCrossChainAddress(keysProvider))
        );
    }

    function _addReplica(
        CrossChainAddress memory replica
    ) internal virtual {
        if (!_getMasterConfigProviderStorage()._replicas.add(Time.timestamp(), _serializeCrossChainAddress(replica))) {
            revert MasterConfigProvider_AlreadyAdded();
        }
    }

    function _removeReplica(
        CrossChainAddress memory replica
    ) internal virtual {
        if (!_getMasterConfigProviderStorage()._replicas.remove(Time.timestamp(), _serializeCrossChainAddress(replica)))
        {
            revert MasterConfigProvider_NotAdded();
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
