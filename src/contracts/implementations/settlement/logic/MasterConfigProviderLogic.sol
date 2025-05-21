// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PersistentSet} from "../../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {IMasterConfigProvider} from "../../../../interfaces/implementations/settlement/IMasterConfigProvider.sol";

library MasterConfigProviderLogic {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    uint64 public constant MasterConfigProvider_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.MasterConfigProvider")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant MasterConfigProviderStorageLocation =
        0x3b25976de016b97f279165d4656d567d2e016e58c5d4ca9db65295c2ee815b00;

    function _getMasterConfigProviderStorage()
        internal
        pure
        returns (IMasterConfigProvider.MasterConfigProviderStorage storage $)
    {
        bytes32 location = MasterConfigProviderStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function initialize(
        IMasterConfigProvider.MasterConfigProviderInitParams memory masterConfigProviderInitParams
    ) public {
        for (uint256 i; i < masterConfigProviderInitParams.votingPowerProviders.length; ++i) {
            addVotingPowerProvider(masterConfigProviderInitParams.votingPowerProviders[i]);
        }

        setKeysProvider(masterConfigProviderInitParams.keysProvider);

        for (uint256 i; i < masterConfigProviderInitParams.replicas.length; ++i) {
            addReplica(masterConfigProviderInitParams.replicas[i]);
        }
    }

    function isVotingPowerProviderActiveAt(
        IMasterConfigProvider.CrossChainAddress memory votingPowerProvider,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getMasterConfigProviderStorage()._votingPowerProviders.containsAt(
            timestamp, serializeCrossChainAddress(votingPowerProvider), hint
        );
    }

    function isVotingPowerProviderActive(
        IMasterConfigProvider.CrossChainAddress memory votingPowerProvider
    ) public view returns (bool) {
        return _getMasterConfigProviderStorage()._votingPowerProviders.contains(
            serializeCrossChainAddress(votingPowerProvider)
        );
    }

    function getActiveVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (IMasterConfigProvider.CrossChainAddress[] memory activeVotingPowerProviders) {
        bytes32[] memory activeVotingPowerProvidersRaw =
            _getMasterConfigProviderStorage()._votingPowerProviders.valuesAt(timestamp, hints);
        activeVotingPowerProviders = new IMasterConfigProvider.CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    function getActiveVotingPowerProviders()
        public
        view
        returns (IMasterConfigProvider.CrossChainAddress[] memory activeVotingPowerProviders)
    {
        bytes32[] memory activeVotingPowerProvidersRaw =
            _getMasterConfigProviderStorage()._votingPowerProviders.values();
        activeVotingPowerProviders = new IMasterConfigProvider.CrossChainAddress[](activeVotingPowerProvidersRaw.length);
        for (uint256 i; i < activeVotingPowerProvidersRaw.length; ++i) {
            activeVotingPowerProviders[i] = deserializeCrossChainAddress(activeVotingPowerProvidersRaw[i]);
        }
    }

    function getKeysProviderAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (IMasterConfigProvider.CrossChainAddress memory) {
        return deserializeCrossChainAddress(
            bytes32(_getMasterConfigProviderStorage()._keysProvider.upperLookupRecent(timestamp, hint))
        );
    }

    function getKeysProvider() public view returns (IMasterConfigProvider.CrossChainAddress memory) {
        return deserializeCrossChainAddress(bytes32(_getMasterConfigProviderStorage()._keysProvider.latest()));
    }

    function isReplicaActiveAt(
        IMasterConfigProvider.CrossChainAddress memory replica,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return
            _getMasterConfigProviderStorage()._replicas.containsAt(timestamp, serializeCrossChainAddress(replica), hint);
    }

    function isReplicaActive(
        IMasterConfigProvider.CrossChainAddress memory replica
    ) public view returns (bool) {
        return _getMasterConfigProviderStorage()._replicas.contains(serializeCrossChainAddress(replica));
    }

    function getActiveReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (IMasterConfigProvider.CrossChainAddress[] memory activeReplicas) {
        bytes32[] memory activeReplicasRaw = _getMasterConfigProviderStorage()._replicas.valuesAt(timestamp, hints);
        activeReplicas = new IMasterConfigProvider.CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    function getActiveReplicas()
        public
        view
        returns (IMasterConfigProvider.CrossChainAddress[] memory activeReplicas)
    {
        bytes32[] memory activeReplicasRaw = _getMasterConfigProviderStorage()._replicas.values();
        activeReplicas = new IMasterConfigProvider.CrossChainAddress[](activeReplicasRaw.length);
        for (uint256 i; i < activeReplicasRaw.length; ++i) {
            activeReplicas[i] = deserializeCrossChainAddress(activeReplicasRaw[i]);
        }
    }

    function getMasterConfigAt(
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IMasterConfigProvider.MasterConfig memory) {
        IMasterConfigProvider.MasterConfigHints memory masterConfigHints;
        if (hints.length > 0) {
            masterConfigHints = abi.decode(hints, (IMasterConfigProvider.MasterConfigHints));
        }

        return IMasterConfigProvider.MasterConfig({
            votingPowerProviders: getActiveVotingPowerProvidersAt(timestamp, masterConfigHints.votingPowerProvidersHints),
            keysProvider: getKeysProviderAt(timestamp, masterConfigHints.keysProviderHint),
            replicas: getActiveReplicasAt(timestamp, masterConfigHints.replicasHints)
        });
    }

    function getMasterConfig() public view returns (IMasterConfigProvider.MasterConfig memory) {
        return IMasterConfigProvider.MasterConfig({
            votingPowerProviders: getActiveVotingPowerProviders(),
            keysProvider: getKeysProvider(),
            replicas: getActiveReplicas()
        });
    }

    function addVotingPowerProvider(
        IMasterConfigProvider.CrossChainAddress memory votingPowerProvider
    ) public {
        if (
            !_getMasterConfigProviderStorage()._votingPowerProviders.add(
                Time.timestamp(), serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert IMasterConfigProvider.MasterConfigProvider_AlreadyAdded();
        }
    }

    function removeVotingPowerProvider(
        IMasterConfigProvider.CrossChainAddress memory votingPowerProvider
    ) public {
        if (
            !_getMasterConfigProviderStorage()._votingPowerProviders.remove(
                Time.timestamp(), serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert IMasterConfigProvider.MasterConfigProvider_NotAdded();
        }
    }

    function setKeysProvider(
        IMasterConfigProvider.CrossChainAddress memory keysProvider
    ) public {
        _getMasterConfigProviderStorage()._keysProvider.push(
            Time.timestamp(), uint256(serializeCrossChainAddress(keysProvider))
        );
    }

    function addReplica(
        IMasterConfigProvider.CrossChainAddress memory replica
    ) public {
        if (!_getMasterConfigProviderStorage()._replicas.add(Time.timestamp(), serializeCrossChainAddress(replica))) {
            revert IMasterConfigProvider.MasterConfigProvider_AlreadyAdded();
        }
    }

    function removeReplica(
        IMasterConfigProvider.CrossChainAddress memory replica
    ) public {
        if (!_getMasterConfigProviderStorage()._replicas.remove(Time.timestamp(), serializeCrossChainAddress(replica)))
        {
            revert IMasterConfigProvider.MasterConfigProvider_NotAdded();
        }
    }

    function deserializeCrossChainAddress(
        bytes32 compressedAddress
    ) public pure returns (IMasterConfigProvider.CrossChainAddress memory) {
        return IMasterConfigProvider.CrossChainAddress({
            addr: address(uint160(uint256(compressedAddress))),
            chainId: uint64(uint256(compressedAddress) >> 160)
        });
    }

    function serializeCrossChainAddress(
        IMasterConfigProvider.CrossChainAddress memory crossChainAddress
    ) public pure returns (bytes32) {
        return bytes32(uint256(crossChainAddress.chainId) << 160 | uint160(crossChainAddress.addr));
    }
}
