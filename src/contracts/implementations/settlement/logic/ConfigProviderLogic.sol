// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PersistentSet} from "../../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {KeyTags} from "../../../libraries/utils/KeyTags.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {IConfigProvider} from "../../../../interfaces/implementations/settlement/IConfigProvider.sol";

library ConfigProviderLogic {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using Checkpoints for Checkpoints.Trace208;
    using PersistentSet for PersistentSet.Bytes32Set;
    using KeyTags for uint128;
    using KeyTags for uint8[];

    uint64 public constant ConfigProvider_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ConfigProvider")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ConfigProviderStorageLocation =
        0x69cc2103f98d9422293b17af4701294142032f76ec5b84d4141038932799fa00;

    function _getConfigProviderStorage() internal pure returns (IConfigProvider.ConfigProviderStorage storage $) {
        bytes32 location = ConfigProviderStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function initialize(
        IConfigProvider.ConfigProviderInitParams memory configProviderInitParams
    ) public {
        for (uint256 i; i < configProviderInitParams.votingPowerProviders.length; ++i) {
            addVotingPowerProvider(configProviderInitParams.votingPowerProviders[i]);
        }
        setKeysProvider(configProviderInitParams.keysProvider);
        for (uint256 i; i < configProviderInitParams.replicas.length; ++i) {
            addReplica(configProviderInitParams.replicas[i]);
        }
        setVerificationType(configProviderInitParams.verificationType);
        setMaxVotingPower(configProviderInitParams.maxVotingPower);
        setMinInclusionVotingPower(configProviderInitParams.minInclusionVotingPower);
        setMaxValidatorsCount(configProviderInitParams.maxValidatorsCount);
        setRequiredKeyTags(configProviderInitParams.requiredKeyTags);
    }

    function isVotingPowerProviderRegisteredAt(
        IConfigProvider.CrossChainAddress memory votingPowerProvider,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getConfigProviderStorage()._votingPowerProviders.containsAt(
            timestamp, serializeCrossChainAddress(votingPowerProvider), hint
        );
    }

    function isVotingPowerProviderRegistered(
        IConfigProvider.CrossChainAddress memory votingPowerProvider
    ) public view returns (bool) {
        return
            _getConfigProviderStorage()._votingPowerProviders.contains(serializeCrossChainAddress(votingPowerProvider));
    }

    function getVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (IConfigProvider.CrossChainAddress[] memory votingPowerProviders) {
        bytes32[] memory votingPowerProvidersRaw =
            _getConfigProviderStorage()._votingPowerProviders.valuesAt(timestamp, hints);
        votingPowerProviders = new IConfigProvider.CrossChainAddress[](votingPowerProvidersRaw.length);
        for (uint256 i; i < votingPowerProvidersRaw.length; ++i) {
            votingPowerProviders[i] = deserializeCrossChainAddress(votingPowerProvidersRaw[i]);
        }
    }

    function getVotingPowerProviders()
        public
        view
        returns (IConfigProvider.CrossChainAddress[] memory votingPowerProviders)
    {
        bytes32[] memory votingPowerProvidersRaw = _getConfigProviderStorage()._votingPowerProviders.values();
        votingPowerProviders = new IConfigProvider.CrossChainAddress[](votingPowerProvidersRaw.length);
        for (uint256 i; i < votingPowerProvidersRaw.length; ++i) {
            votingPowerProviders[i] = deserializeCrossChainAddress(votingPowerProvidersRaw[i]);
        }
    }

    function getKeysProviderAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (IConfigProvider.CrossChainAddress memory) {
        return deserializeCrossChainAddress(
            bytes32(_getConfigProviderStorage()._keysProvider.upperLookupRecent(timestamp, hint))
        );
    }

    function getKeysProvider() public view returns (IConfigProvider.CrossChainAddress memory) {
        return deserializeCrossChainAddress(bytes32(_getConfigProviderStorage()._keysProvider.latest()));
    }

    function isReplicaRegisteredAt(
        IConfigProvider.CrossChainAddress memory replica,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getConfigProviderStorage()._replicas.containsAt(timestamp, serializeCrossChainAddress(replica), hint);
    }

    function isReplicaRegistered(
        IConfigProvider.CrossChainAddress memory replica
    ) public view returns (bool) {
        return _getConfigProviderStorage()._replicas.contains(serializeCrossChainAddress(replica));
    }

    function getReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (IConfigProvider.CrossChainAddress[] memory replicas) {
        bytes32[] memory replicasRaw = _getConfigProviderStorage()._replicas.valuesAt(timestamp, hints);
        replicas = new IConfigProvider.CrossChainAddress[](replicasRaw.length);
        for (uint256 i; i < replicasRaw.length; ++i) {
            replicas[i] = deserializeCrossChainAddress(replicasRaw[i]);
        }
    }

    function getReplicas() public view returns (IConfigProvider.CrossChainAddress[] memory replicas) {
        bytes32[] memory replicasRaw = _getConfigProviderStorage()._replicas.values();
        replicas = new IConfigProvider.CrossChainAddress[](replicasRaw.length);
        for (uint256 i; i < replicasRaw.length; ++i) {
            replicas[i] = deserializeCrossChainAddress(replicasRaw[i]);
        }
    }

    function getVerificationTypeAt(uint48 timestamp, bytes memory hint) public view returns (uint32) {
        return uint32(_getConfigProviderStorage()._verificationType.upperLookupRecent(timestamp, hint));
    }

    function getVerificationType() public view returns (uint32) {
        return uint32(_getConfigProviderStorage()._verificationType.latest());
    }

    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getConfigProviderStorage()._maxVotingPower.upperLookupRecent(timestamp, hint);
    }

    function getMaxVotingPower() public view returns (uint256) {
        return _getConfigProviderStorage()._maxVotingPower.latest();
    }

    function getMinInclusionVotingPowerAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getConfigProviderStorage()._minInclusionVotingPower.upperLookupRecent(timestamp, hint);
    }

    function getMinInclusionVotingPower() public view returns (uint256) {
        return _getConfigProviderStorage()._minInclusionVotingPower.latest();
    }

    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) public view returns (uint208) {
        return _getConfigProviderStorage()._maxValidatorsCount.upperLookupRecent(timestamp, hint);
    }

    function getMaxValidatorsCount() public view returns (uint208) {
        return _getConfigProviderStorage()._maxValidatorsCount.latest();
    }

    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (uint8[] memory requiredKeyTags) {
        return uint128(_getConfigProviderStorage()._requiredKeyTags.upperLookupRecent(timestamp, hint)).deserialize();
    }

    function getRequiredKeyTags() public view returns (uint8[] memory requiredKeyTags) {
        return uint128(_getConfigProviderStorage()._requiredKeyTags.latest()).deserialize();
    }

    function getConfigAt(uint48 timestamp, bytes memory hints) public view returns (IConfigProvider.Config memory) {
        IConfigProvider.ConfigHints memory configHints;
        if (hints.length > 0) {
            configHints = abi.decode(hints, (IConfigProvider.ConfigHints));
        }

        return IConfigProvider.Config({
            votingPowerProviders: getVotingPowerProvidersAt(timestamp, configHints.votingPowerProvidersHints),
            keysProvider: getKeysProviderAt(timestamp, configHints.keysProviderHint),
            replicas: getReplicasAt(timestamp, configHints.replicasHints),
            verificationType: getVerificationTypeAt(timestamp, configHints.verificationTypeHint),
            maxVotingPower: getMaxVotingPowerAt(timestamp, configHints.maxVotingPowerHint),
            minInclusionVotingPower: getMinInclusionVotingPowerAt(timestamp, configHints.minInclusionVotingPowerHint),
            maxValidatorsCount: getMaxValidatorsCountAt(timestamp, configHints.maxValidatorsCountHint),
            requiredKeyTags: getRequiredKeyTagsAt(timestamp, configHints.requiredKeyTagsHint)
        });
    }

    function getConfig() public view returns (IConfigProvider.Config memory) {
        return IConfigProvider.Config({
            votingPowerProviders: getVotingPowerProviders(),
            keysProvider: getKeysProvider(),
            replicas: getReplicas(),
            verificationType: getVerificationType(),
            maxVotingPower: getMaxVotingPower(),
            minInclusionVotingPower: getMinInclusionVotingPower(),
            maxValidatorsCount: getMaxValidatorsCount(),
            requiredKeyTags: getRequiredKeyTags()
        });
    }

    function addVotingPowerProvider(
        IConfigProvider.CrossChainAddress memory votingPowerProvider
    ) public {
        if (
            !_getConfigProviderStorage()._votingPowerProviders.add(
                Time.timestamp(), serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert IConfigProvider.ConfigProvider_AlreadyAdded();
        }
        emit IConfigProvider.AddVotingPowerProvider(votingPowerProvider);
    }

    function removeVotingPowerProvider(
        IConfigProvider.CrossChainAddress memory votingPowerProvider
    ) public {
        if (
            !_getConfigProviderStorage()._votingPowerProviders.remove(
                Time.timestamp(), serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert IConfigProvider.ConfigProvider_NotAdded();
        }
        emit IConfigProvider.RemoveVotingPowerProvider(votingPowerProvider);
    }

    function setKeysProvider(
        IConfigProvider.CrossChainAddress memory keysProvider
    ) public {
        _getConfigProviderStorage()._keysProvider.push(
            Time.timestamp(), uint256(serializeCrossChainAddress(keysProvider))
        );
        emit IConfigProvider.SetKeysProvider(keysProvider);
    }

    function addReplica(
        IConfigProvider.CrossChainAddress memory replica
    ) public {
        if (!_getConfigProviderStorage()._replicas.add(Time.timestamp(), serializeCrossChainAddress(replica))) {
            revert IConfigProvider.ConfigProvider_AlreadyAdded();
        }
        emit IConfigProvider.AddReplica(replica);
    }

    function removeReplica(
        IConfigProvider.CrossChainAddress memory replica
    ) public {
        if (!_getConfigProviderStorage()._replicas.remove(Time.timestamp(), serializeCrossChainAddress(replica))) {
            revert IConfigProvider.ConfigProvider_NotAdded();
        }
        emit IConfigProvider.RemoveReplica(replica);
    }

    function setVerificationType(
        uint32 verificationType
    ) public {
        _getConfigProviderStorage()._verificationType.push(Time.timestamp(), verificationType);
        emit IConfigProvider.SetVerificationType(verificationType);
    }

    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public {
        _getConfigProviderStorage()._maxVotingPower.push(Time.timestamp(), maxVotingPower);
        emit IConfigProvider.SetMaxVotingPower(maxVotingPower);
    }

    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public {
        _getConfigProviderStorage()._minInclusionVotingPower.push(Time.timestamp(), minInclusionVotingPower);
        emit IConfigProvider.SetMinInclusionVotingPower(minInclusionVotingPower);
    }

    function setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) public {
        _getConfigProviderStorage()._maxValidatorsCount.push(Time.timestamp(), maxValidatorsCount);
        emit IConfigProvider.SetMaxValidatorsCount(maxValidatorsCount);
    }

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public {
        _getConfigProviderStorage()._requiredKeyTags.push(Time.timestamp(), requiredKeyTags.serialize());
        emit IConfigProvider.SetRequiredKeyTags(requiredKeyTags);
    }

    function deserializeCrossChainAddress(
        bytes32 compressedAddress
    ) public pure returns (IConfigProvider.CrossChainAddress memory) {
        return IConfigProvider.CrossChainAddress({
            addr: address(uint160(uint256(compressedAddress))),
            chainId: uint64(uint256(compressedAddress) >> 160)
        });
    }

    function serializeCrossChainAddress(
        IConfigProvider.CrossChainAddress memory crossChainAddress
    ) public pure returns (bytes32) {
        return bytes32(uint256(crossChainAddress.chainId) << 160 | uint256(uint160(crossChainAddress.addr)));
    }
}
