// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {KeyTags} from "../../libraries/utils/KeyTags.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {IConfigProvider} from "../../../interfaces/modules/valset-driver/IConfigProvider.sol";

abstract contract ConfigProvider is PermissionManager, IConfigProvider {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using Checkpoints for Checkpoints.Trace208;
    using PersistentSet for PersistentSet.Bytes32Set;
    using KeyTags for uint128;
    using KeyTags for uint8[];

    /**
     * @inheritdoc IConfigProvider
     */
    uint64 public constant ConfigProvider_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ConfigProvider")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ConfigProviderStorageLocation =
        0x69cc2103f98d9422293b17af4701294142032f76ec5b84d4141038932799fa00;

    function _getConfigProviderStorage() internal pure returns (ConfigProviderStorage storage $) {
        bytes32 location = ConfigProviderStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __ConfigProvider_init(
        ConfigProviderInitParams memory configProviderInitParams
    ) internal virtual onlyInitializing {
        for (uint256 i; i < configProviderInitParams.votingPowerProviders.length; ++i) {
            _addVotingPowerProvider(configProviderInitParams.votingPowerProviders[i]);
        }
        _setKeysProvider(configProviderInitParams.keysProvider);
        for (uint256 i; i < configProviderInitParams.replicas.length; ++i) {
            _addReplica(configProviderInitParams.replicas[i]);
        }
        _setVerificationType(configProviderInitParams.verificationType);
        _setMaxVotingPower(configProviderInitParams.maxVotingPower);
        _setMinInclusionVotingPower(configProviderInitParams.minInclusionVotingPower);
        _setMaxValidatorsCount(configProviderInitParams.maxValidatorsCount);
        _setRequiredKeyTags(configProviderInitParams.requiredKeyTags);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isVotingPowerProviderRegisteredAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp
    ) public view virtual returns (bool) {
        return _getConfigProviderStorage()._votingPowerProviders.containsAt(
            timestamp, _serializeCrossChainAddress(votingPowerProvider)
        );
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isVotingPowerProviderRegistered(
        CrossChainAddress memory votingPowerProvider
    ) public view virtual returns (bool) {
        return
            _getConfigProviderStorage()._votingPowerProviders.contains(_serializeCrossChainAddress(votingPowerProvider));
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVotingPowerProvidersAt(
        uint48 timestamp
    ) public view virtual returns (CrossChainAddress[] memory votingPowerProviders) {
        bytes32[] memory votingPowerProvidersRaw = _getConfigProviderStorage()._votingPowerProviders.valuesAt(timestamp);
        votingPowerProviders = new CrossChainAddress[](votingPowerProvidersRaw.length);
        for (uint256 i; i < votingPowerProvidersRaw.length; ++i) {
            votingPowerProviders[i] = _deserializeCrossChainAddress(votingPowerProvidersRaw[i]);
        }
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVotingPowerProviders() public view virtual returns (CrossChainAddress[] memory votingPowerProviders) {
        bytes32[] memory votingPowerProvidersRaw = _getConfigProviderStorage()._votingPowerProviders.values();
        votingPowerProviders = new CrossChainAddress[](votingPowerProvidersRaw.length);
        for (uint256 i; i < votingPowerProvidersRaw.length; ++i) {
            votingPowerProviders[i] = _deserializeCrossChainAddress(votingPowerProvidersRaw[i]);
        }
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getKeysProviderAt(
        uint48 timestamp
    ) public view virtual returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(
            bytes32(_getConfigProviderStorage()._keysProvider.upperLookupRecent(timestamp))
        );
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getKeysProvider() public view virtual returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(bytes32(_getConfigProviderStorage()._keysProvider.latest()));
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isReplicaRegisteredAt(
        CrossChainAddress memory replica,
        uint48 timestamp
    ) public view virtual returns (bool) {
        return _getConfigProviderStorage()._replicas.containsAt(timestamp, _serializeCrossChainAddress(replica));
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isReplicaRegistered(
        CrossChainAddress memory replica
    ) public view virtual returns (bool) {
        return _getConfigProviderStorage()._replicas.contains(_serializeCrossChainAddress(replica));
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getReplicasAt(
        uint48 timestamp
    ) public view virtual returns (CrossChainAddress[] memory replicas) {
        bytes32[] memory replicasRaw = _getConfigProviderStorage()._replicas.valuesAt(timestamp);
        replicas = new CrossChainAddress[](replicasRaw.length);
        for (uint256 i; i < replicasRaw.length; ++i) {
            replicas[i] = _deserializeCrossChainAddress(replicasRaw[i]);
        }
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getReplicas() public view virtual returns (CrossChainAddress[] memory replicas) {
        bytes32[] memory replicasRaw = _getConfigProviderStorage()._replicas.values();
        replicas = new CrossChainAddress[](replicasRaw.length);
        for (uint256 i; i < replicasRaw.length; ++i) {
            replicas[i] = _deserializeCrossChainAddress(replicasRaw[i]);
        }
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVerificationTypeAt(
        uint48 timestamp
    ) public view virtual returns (uint32) {
        return uint32(_getConfigProviderStorage()._verificationType.upperLookupRecent(timestamp));
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVerificationType() public view virtual returns (uint32) {
        return uint32(_getConfigProviderStorage()._verificationType.latest());
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxVotingPowerAt(
        uint48 timestamp
    ) public view virtual returns (uint256) {
        return _getConfigProviderStorage()._maxVotingPower.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxVotingPower() public view virtual returns (uint256) {
        return _getConfigProviderStorage()._maxVotingPower.latest();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMinInclusionVotingPowerAt(
        uint48 timestamp
    ) public view virtual returns (uint256) {
        return _getConfigProviderStorage()._minInclusionVotingPower.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMinInclusionVotingPower() public view virtual returns (uint256) {
        return _getConfigProviderStorage()._minInclusionVotingPower.latest();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxValidatorsCountAt(
        uint48 timestamp
    ) public view virtual returns (uint208) {
        return _getConfigProviderStorage()._maxValidatorsCount.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxValidatorsCount() public view virtual returns (uint208) {
        return _getConfigProviderStorage()._maxValidatorsCount.latest();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getRequiredKeyTagsAt(
        uint48 timestamp
    ) public view returns (uint8[] memory requiredKeyTags) {
        return uint128(_getConfigProviderStorage()._requiredKeyTags.upperLookupRecent(timestamp)).deserialize();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getRequiredKeyTags() public view returns (uint8[] memory requiredKeyTags) {
        return uint128(_getConfigProviderStorage()._requiredKeyTags.latest()).deserialize();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getRequiredKeyTagAt(
        uint48 timestamp
    ) public view virtual returns (uint8) {
        return uint8(_getConfigProviderStorage()._requiredKeyTag.upperLookupRecent(timestamp));
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getRequiredKeyTag() public view virtual returns (uint8) {
        return uint8(_getConfigProviderStorage()._requiredKeyTag.latest());
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getConfigAt(
        uint48 timestamp
    ) public view virtual returns (Config memory) {
        return Config({
            votingPowerProviders: getVotingPowerProvidersAt(timestamp),
            keysProvider: getKeysProviderAt(timestamp),
            replicas: getReplicasAt(timestamp),
            verificationType: getVerificationTypeAt(timestamp),
            maxVotingPower: getMaxVotingPowerAt(timestamp),
            minInclusionVotingPower: getMinInclusionVotingPowerAt(timestamp),
            maxValidatorsCount: getMaxValidatorsCountAt(timestamp),
            requiredKeyTags: getRequiredKeyTagsAt(timestamp),
            requiredKeyTag: getRequiredKeyTagAt(timestamp)
        });
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getConfig() public view virtual returns (Config memory) {
        return Config({
            votingPowerProviders: getVotingPowerProviders(),
            keysProvider: getKeysProvider(),
            replicas: getReplicas(),
            verificationType: getVerificationType(),
            maxVotingPower: getMaxVotingPower(),
            minInclusionVotingPower: getMinInclusionVotingPower(),
            maxValidatorsCount: getMaxValidatorsCount(),
            requiredKeyTags: getRequiredKeyTags(),
            requiredKeyTag: getRequiredKeyTag()
        });
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _addVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _removeVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public virtual checkPermission {
        _setKeysProvider(keysProvider);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function addReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        _addReplica(replica);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function removeReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        _removeReplica(replica);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setVerificationType(
        uint32 verificationType
    ) public virtual checkPermission {
        _setVerificationType(verificationType);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public virtual checkPermission {
        _setMaxVotingPower(maxVotingPower);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public virtual checkPermission {
        _setMinInclusionVotingPower(minInclusionVotingPower);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) public virtual checkPermission {
        _setMaxValidatorsCount(maxValidatorsCount);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        _setRequiredKeyTags(requiredKeyTags);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public virtual checkPermission {
        _setRequiredKeyTag(requiredKeyTag);
    }

    function _addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) internal virtual {
        if (
            !_getConfigProviderStorage()._votingPowerProviders.add(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert ConfigProvider_AlreadyAdded();
        }
        emit AddVotingPowerProvider(votingPowerProvider);
    }

    function _removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) internal virtual {
        if (
            !_getConfigProviderStorage()._votingPowerProviders.remove(
                Time.timestamp(), _serializeCrossChainAddress(votingPowerProvider)
            )
        ) {
            revert ConfigProvider_NotAdded();
        }
        emit RemoveVotingPowerProvider(votingPowerProvider);
    }

    function _setKeysProvider(
        CrossChainAddress memory keysProvider
    ) internal virtual {
        _getConfigProviderStorage()._keysProvider.push(
            Time.timestamp(), uint256(_serializeCrossChainAddress(keysProvider))
        );
        emit SetKeysProvider(keysProvider);
    }

    function _addReplica(
        CrossChainAddress memory replica
    ) internal virtual {
        if (!_getConfigProviderStorage()._replicas.add(Time.timestamp(), _serializeCrossChainAddress(replica))) {
            revert ConfigProvider_AlreadyAdded();
        }
        emit AddReplica(replica);
    }

    function _removeReplica(
        CrossChainAddress memory replica
    ) internal virtual {
        if (!_getConfigProviderStorage()._replicas.remove(Time.timestamp(), _serializeCrossChainAddress(replica))) {
            revert ConfigProvider_NotAdded();
        }
        emit RemoveReplica(replica);
    }

    function _setVerificationType(
        uint32 verificationType
    ) internal virtual {
        _getConfigProviderStorage()._verificationType.push(Time.timestamp(), verificationType);
        emit SetVerificationType(verificationType);
    }

    function _setMaxVotingPower(
        uint256 maxVotingPower
    ) internal virtual {
        _getConfigProviderStorage()._maxVotingPower.push(Time.timestamp(), maxVotingPower);
        emit SetMaxVotingPower(maxVotingPower);
    }

    function _setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) internal virtual {
        _getConfigProviderStorage()._minInclusionVotingPower.push(Time.timestamp(), minInclusionVotingPower);
        emit SetMinInclusionVotingPower(minInclusionVotingPower);
    }

    function _setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) internal virtual {
        _getConfigProviderStorage()._maxValidatorsCount.push(Time.timestamp(), maxValidatorsCount);
        emit SetMaxValidatorsCount(maxValidatorsCount);
    }

    function _setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal virtual {
        _getConfigProviderStorage()._requiredKeyTags.push(Time.timestamp(), requiredKeyTags.serialize());
        emit SetRequiredKeyTags(requiredKeyTags);
    }

    function _setRequiredKeyTag(
        uint8 requiredKeyTag
    ) internal virtual {
        _getConfigProviderStorage()._requiredKeyTag.push(Time.timestamp(), requiredKeyTag);
        emit SetRequiredKeyTag(requiredKeyTag);
    }

    function _deserializeCrossChainAddress(
        bytes32 compressedAddress
    ) internal pure virtual returns (CrossChainAddress memory) {
        return CrossChainAddress({
            addr: address(uint160(uint256(compressedAddress))),
            chainId: uint64(uint256(compressedAddress) >> 160)
        });
    }

    function _serializeCrossChainAddress(
        CrossChainAddress memory crossChainAddress
    ) internal pure virtual returns (bytes32) {
        return bytes32(uint256(crossChainAddress.chainId) << 160 | uint256(uint160(crossChainAddress.addr)));
    }
}
