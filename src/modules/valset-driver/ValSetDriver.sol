// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochManager} from "./EpochManager.sol";
import {NetworkManager} from "../base/NetworkManager.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {KeyTags} from "../../libraries/utils/KeyTags.sol";
import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";

import {IValSetDriver} from "../../interfaces/modules/valset-driver/IValSetDriver.sol";

import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

/**
 * @title ValSetDriver
 * @notice Contract for providing various configs and driving data for off-chain services.
 */
abstract contract ValSetDriver is EpochManager, NetworkManager, MulticallUpgradeable, IValSetDriver {
    using Checkpoints for Checkpoints.Trace208;
    using Checkpoints for Checkpoints.Trace256;
    using KeyTags for uint128;
    using KeyTags for uint8[];
    using KeyTags for uint8;
    using PersistentSet for PersistentSet.Bytes32Set;

    /**
     * @inheritdoc IValSetDriver
     */
    uint248 public constant MAX_QUORUM_THRESHOLD = 10 ** 18;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetDriver")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ValSetDriverStorageLocation =
        0x1bdf637a86d66983203bb31f20408fc8a4c8b9248a23572df8a2016148669f00;

    function _getValSetDriverStorage() internal pure returns (ValSetDriverStorage storage $) {
        bytes32 location = ValSetDriverStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __ValSetDriver_init(
        ValSetDriverInitParams memory valSetDriverInitParams
    ) internal virtual onlyInitializing {
        __NetworkManager_init(valSetDriverInitParams.networkManagerInitParams);
        __EpochManager_init(valSetDriverInitParams.epochManagerInitParams);

        _setNumAggregators(valSetDriverInitParams.numAggregators);
        _setNumCommitters(valSetDriverInitParams.numCommitters);
        for (uint256 i; i < valSetDriverInitParams.votingPowerProviders.length; ++i) {
            _addVotingPowerProvider(valSetDriverInitParams.votingPowerProviders[i]);
        }
        _setKeysProvider(valSetDriverInitParams.keysProvider);
        for (uint256 i; i < valSetDriverInitParams.replicas.length; ++i) {
            _addReplica(valSetDriverInitParams.replicas[i]);
        }
        _setMaxVotingPower(valSetDriverInitParams.maxVotingPower);
        _setMinInclusionVotingPower(valSetDriverInitParams.minInclusionVotingPower);
        _setMaxValidatorsCount(valSetDriverInitParams.maxValidatorsCount);
        _setRequiredKeyTags(valSetDriverInitParams.requiredKeyTags);
        for (uint256 i; i < valSetDriverInitParams.quorumThresholds.length; ++i) {
            _addQuorumThreshold(valSetDriverInitParams.quorumThresholds[i]);
        }
        _setRequiredHeaderKeyTag(valSetDriverInitParams.requiredHeaderKeyTag);
        _setVerificationType(valSetDriverInitParams.verificationType);
        _setMaxMissingEpochs(valSetDriverInitParams.maxMissingEpochs);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getConfigAt(
        uint48 timestamp
    ) public view virtual returns (Config memory) {
        return Config({
            numAggregators: getNumAggregatorsAt(timestamp),
            numCommitters: getNumCommittersAt(timestamp),
            votingPowerProviders: getVotingPowerProvidersAt(timestamp),
            keysProvider: getKeysProviderAt(timestamp),
            replicas: getReplicasAt(timestamp),
            maxVotingPower: getMaxVotingPowerAt(timestamp),
            minInclusionVotingPower: getMinInclusionVotingPowerAt(timestamp),
            maxValidatorsCount: getMaxValidatorsCountAt(timestamp),
            requiredKeyTags: getRequiredKeyTagsAt(timestamp),
            quorumThresholds: getQuorumThresholdsAt(timestamp),
            requiredHeaderKeyTag: getRequiredHeaderKeyTagAt(timestamp),
            verificationType: getVerificationTypeAt(timestamp),
            maxMissingEpochs: getMaxMissingEpochsAt(timestamp)
        });
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getConfig() public view virtual returns (Config memory) {
        return Config({
            numAggregators: getNumAggregators(),
            numCommitters: getNumCommitters(),
            votingPowerProviders: getVotingPowerProviders(),
            keysProvider: getKeysProvider(),
            replicas: getReplicas(),
            maxVotingPower: getMaxVotingPower(),
            minInclusionVotingPower: getMinInclusionVotingPower(),
            maxValidatorsCount: getMaxValidatorsCount(),
            requiredKeyTags: getRequiredKeyTags(),
            quorumThresholds: getQuorumThresholds(),
            requiredHeaderKeyTag: getRequiredHeaderKeyTag(),
            verificationType: getVerificationType(),
            maxMissingEpochs: getMaxMissingEpochs()
        });
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getNumAggregatorsAt(
        uint48 timestamp
    ) public view virtual returns (uint208) {
        return _getValSetDriverStorage()._numAggregators.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getNumAggregators() public view virtual returns (uint208) {
        return _getValSetDriverStorage()._numAggregators.latest();
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getNumCommittersAt(
        uint48 timestamp
    ) public view virtual returns (uint208) {
        return _getValSetDriverStorage()._numCommitters.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getNumCommitters() public view virtual returns (uint208) {
        return _getValSetDriverStorage()._numCommitters.latest();
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function isVotingPowerProviderRegisteredAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp
    ) public view virtual returns (bool) {
        return _getValSetDriverStorage()._votingPowerProviders.containsAt(
            timestamp, _serializeCrossChainAddress(votingPowerProvider)
        );
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function isVotingPowerProviderRegistered(
        CrossChainAddress memory votingPowerProvider
    ) public view virtual returns (bool) {
        return
            _getValSetDriverStorage()._votingPowerProviders.contains(_serializeCrossChainAddress(votingPowerProvider));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getVotingPowerProvidersAt(
        uint48 timestamp
    ) public view virtual returns (CrossChainAddress[] memory votingPowerProviders) {
        bytes32[] memory votingPowerProvidersRaw = _getValSetDriverStorage()._votingPowerProviders.valuesAt(timestamp);
        votingPowerProviders = new CrossChainAddress[](votingPowerProvidersRaw.length);
        for (uint256 i; i < votingPowerProvidersRaw.length; ++i) {
            votingPowerProviders[i] = _deserializeCrossChainAddress(votingPowerProvidersRaw[i]);
        }
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getVotingPowerProviders() public view virtual returns (CrossChainAddress[] memory votingPowerProviders) {
        bytes32[] memory votingPowerProvidersRaw = _getValSetDriverStorage()._votingPowerProviders.values();
        votingPowerProviders = new CrossChainAddress[](votingPowerProvidersRaw.length);
        for (uint256 i; i < votingPowerProvidersRaw.length; ++i) {
            votingPowerProviders[i] = _deserializeCrossChainAddress(votingPowerProvidersRaw[i]);
        }
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getKeysProviderAt(
        uint48 timestamp
    ) public view virtual returns (CrossChainAddress memory) {
        return
            _deserializeCrossChainAddress(bytes32(_getValSetDriverStorage()._keysProvider.upperLookupRecent(timestamp)));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getKeysProvider() public view virtual returns (CrossChainAddress memory) {
        return _deserializeCrossChainAddress(bytes32(_getValSetDriverStorage()._keysProvider.latest()));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function isReplicaRegisteredAt(
        CrossChainAddress memory replica,
        uint48 timestamp
    ) public view virtual returns (bool) {
        return _getValSetDriverStorage()._replicas.containsAt(timestamp, _serializeCrossChainAddress(replica));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function isReplicaRegistered(
        CrossChainAddress memory replica
    ) public view virtual returns (bool) {
        return _getValSetDriverStorage()._replicas.contains(_serializeCrossChainAddress(replica));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getReplicasAt(
        uint48 timestamp
    ) public view virtual returns (CrossChainAddress[] memory replicas) {
        bytes32[] memory replicasRaw = _getValSetDriverStorage()._replicas.valuesAt(timestamp);
        replicas = new CrossChainAddress[](replicasRaw.length);
        for (uint256 i; i < replicasRaw.length; ++i) {
            replicas[i] = _deserializeCrossChainAddress(replicasRaw[i]);
        }
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getReplicas() public view virtual returns (CrossChainAddress[] memory replicas) {
        bytes32[] memory replicasRaw = _getValSetDriverStorage()._replicas.values();
        replicas = new CrossChainAddress[](replicasRaw.length);
        for (uint256 i; i < replicasRaw.length; ++i) {
            replicas[i] = _deserializeCrossChainAddress(replicasRaw[i]);
        }
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMaxVotingPowerAt(
        uint48 timestamp
    ) public view virtual returns (uint256) {
        return _getValSetDriverStorage()._maxVotingPower.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMaxVotingPower() public view virtual returns (uint256) {
        return _getValSetDriverStorage()._maxVotingPower.latest();
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMinInclusionVotingPowerAt(
        uint48 timestamp
    ) public view virtual returns (uint256) {
        return _getValSetDriverStorage()._minInclusionVotingPower.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMinInclusionVotingPower() public view virtual returns (uint256) {
        return _getValSetDriverStorage()._minInclusionVotingPower.latest();
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMaxValidatorsCountAt(
        uint48 timestamp
    ) public view virtual returns (uint208) {
        return _getValSetDriverStorage()._maxValidatorsCount.upperLookupRecent(timestamp);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMaxValidatorsCount() public view virtual returns (uint208) {
        return _getValSetDriverStorage()._maxValidatorsCount.latest();
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getRequiredKeyTagsAt(
        uint48 timestamp
    ) public view virtual returns (uint8[] memory requiredKeyTags) {
        return uint128(_getValSetDriverStorage()._requiredKeyTags.upperLookupRecent(timestamp)).deserialize();
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getRequiredKeyTags() public view virtual returns (uint8[] memory requiredKeyTags) {
        return uint128(_getValSetDriverStorage()._requiredKeyTags.latest()).deserialize();
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function isQuorumThresholdRegisteredAt(
        QuorumThreshold memory quorumThreshold,
        uint48 timestamp
    ) public view virtual returns (bool) {
        return _getValSetDriverStorage()._quorumThresholds.containsAt(
            timestamp, _serializeQuorumThreshold(quorumThreshold)
        );
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function isQuorumThresholdRegistered(
        QuorumThreshold memory quorumThreshold
    ) public view virtual returns (bool) {
        return _getValSetDriverStorage()._quorumThresholds.contains(_serializeQuorumThreshold(quorumThreshold));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getQuorumThresholdsAt(
        uint48 timestamp
    ) public view virtual returns (QuorumThreshold[] memory quorumThresholds) {
        bytes32[] memory quorumThresholdsRaw = _getValSetDriverStorage()._quorumThresholds.valuesAt(timestamp);
        quorumThresholds = new QuorumThreshold[](quorumThresholdsRaw.length);
        for (uint256 i; i < quorumThresholdsRaw.length; ++i) {
            quorumThresholds[i] = _deserializeQuorumThreshold(quorumThresholdsRaw[i]);
        }
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getQuorumThresholds() public view virtual returns (QuorumThreshold[] memory quorumThresholds) {
        bytes32[] memory quorumThresholdsRaw = _getValSetDriverStorage()._quorumThresholds.values();
        quorumThresholds = new QuorumThreshold[](quorumThresholdsRaw.length);
        for (uint256 i; i < quorumThresholdsRaw.length; ++i) {
            quorumThresholds[i] = _deserializeQuorumThreshold(quorumThresholdsRaw[i]);
        }
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getRequiredHeaderKeyTagAt(
        uint48 timestamp
    ) public view virtual returns (uint8) {
        return uint8(_getValSetDriverStorage()._requiredHeaderKeyTag.upperLookupRecent(timestamp));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getRequiredHeaderKeyTag() public view virtual returns (uint8) {
        return uint8(_getValSetDriverStorage()._requiredHeaderKeyTag.latest());
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getVerificationTypeAt(
        uint48 timestamp
    ) public view virtual returns (uint32) {
        return uint32(_getValSetDriverStorage()._verificationType.upperLookupRecent(timestamp));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getVerificationType() public view virtual returns (uint32) {
        return uint32(_getValSetDriverStorage()._verificationType.latest());
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMaxMissingEpochsAt(
        uint48 timestamp
    ) public view virtual returns (uint48) {
        return uint48(_getValSetDriverStorage()._maxMissingEpochs.upperLookupRecent(timestamp));
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function getMaxMissingEpochs() public view virtual returns (uint48) {
        return uint48(_getValSetDriverStorage()._maxMissingEpochs.latest());
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setNumAggregators(
        uint208 numAggregators
    ) public virtual checkPermission {
        _setNumAggregators(numAggregators);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setNumCommitters(
        uint208 numCommitters
    ) public virtual checkPermission {
        _setNumCommitters(numCommitters);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _addVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        _removeVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public virtual checkPermission {
        _setKeysProvider(keysProvider);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function addReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        _addReplica(replica);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function removeReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        _removeReplica(replica);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public virtual checkPermission {
        _setMaxVotingPower(maxVotingPower);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public virtual checkPermission {
        _setMinInclusionVotingPower(minInclusionVotingPower);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) public virtual checkPermission {
        _setMaxValidatorsCount(maxValidatorsCount);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        _setRequiredKeyTags(requiredKeyTags);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function addQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) public virtual checkPermission {
        _addQuorumThreshold(quorumThreshold);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function removeQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) public virtual checkPermission {
        _removeQuorumThreshold(quorumThreshold);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setRequiredHeaderKeyTag(
        uint8 requiredHeaderKeyTag
    ) public virtual checkPermission {
        _setRequiredHeaderKeyTag(requiredHeaderKeyTag);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setVerificationType(
        uint32 verificationType
    ) public virtual checkPermission {
        _setVerificationType(verificationType);
    }

    /**
     * @inheritdoc IValSetDriver
     */
    function setMaxMissingEpochs(
        uint48 maxMissingEpochs
    ) public virtual checkPermission {
        _setMaxMissingEpochs(maxMissingEpochs);
    }

    function _setNumAggregators(
        uint208 numAggregators
    ) internal virtual {
        if (numAggregators == 0) {
            revert ValSetDriver_ZeroNumAggregators();
        }
        _getValSetDriverStorage()._numAggregators.push(uint48(block.timestamp), numAggregators);
        emit SetNumAggregators(numAggregators);
    }

    function _setNumCommitters(
        uint208 numCommitters
    ) internal virtual {
        if (numCommitters == 0) {
            revert ValSetDriver_ZeroNumCommitters();
        }
        _getValSetDriverStorage()._numCommitters.push(uint48(block.timestamp), numCommitters);
        emit SetNumCommitters(numCommitters);
    }

    function _addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) internal virtual {
        ValSetDriverStorage storage $ = _getValSetDriverStorage();
        _validateCrossChainAddress(votingPowerProvider);
        if ($._isVotingPowerProviderChainAdded[votingPowerProvider.chainId]) {
            revert ValSetDriver_ChainAlreadyAdded();
        }
        $._isVotingPowerProviderChainAdded[votingPowerProvider.chainId] = true;
        $._votingPowerProviders.add(uint48(block.timestamp), _serializeCrossChainAddress(votingPowerProvider));
        emit AddVotingPowerProvider(votingPowerProvider);
    }

    function _removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) internal virtual {
        ValSetDriverStorage storage $ = _getValSetDriverStorage();
        if (!$._votingPowerProviders.remove(uint48(block.timestamp), _serializeCrossChainAddress(votingPowerProvider)))
        {
            revert ValSetDriver_NotAdded();
        }
        $._isVotingPowerProviderChainAdded[votingPowerProvider.chainId] = false;
        emit RemoveVotingPowerProvider(votingPowerProvider);
    }

    function _setKeysProvider(
        CrossChainAddress memory keysProvider
    ) internal virtual {
        _validateCrossChainAddress(keysProvider);
        _getValSetDriverStorage()._keysProvider.push(
            uint48(block.timestamp), uint256(_serializeCrossChainAddress(keysProvider))
        );
        emit SetKeysProvider(keysProvider);
    }

    function _addReplica(
        CrossChainAddress memory replica
    ) internal virtual {
        ValSetDriverStorage storage $ = _getValSetDriverStorage();
        _validateCrossChainAddress(replica);
        if ($._isReplicaChainAdded[replica.chainId]) {
            revert ValSetDriver_ChainAlreadyAdded();
        }
        $._isReplicaChainAdded[replica.chainId] = true;
        $._replicas.add(uint48(block.timestamp), _serializeCrossChainAddress(replica));
        emit AddReplica(replica);
    }

    function _removeReplica(
        CrossChainAddress memory replica
    ) internal virtual {
        ValSetDriverStorage storage $ = _getValSetDriverStorage();
        if (!$._replicas.remove(uint48(block.timestamp), _serializeCrossChainAddress(replica))) {
            revert ValSetDriver_NotAdded();
        }
        $._isReplicaChainAdded[replica.chainId] = false;
        emit RemoveReplica(replica);
    }

    function _setMaxVotingPower(
        uint256 maxVotingPower
    ) internal virtual {
        _getValSetDriverStorage()._maxVotingPower.push(uint48(block.timestamp), maxVotingPower);
        emit SetMaxVotingPower(maxVotingPower);
    }

    function _setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) internal virtual {
        _getValSetDriverStorage()._minInclusionVotingPower.push(uint48(block.timestamp), minInclusionVotingPower);
        emit SetMinInclusionVotingPower(minInclusionVotingPower);
    }

    function _setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) internal virtual {
        if (maxValidatorsCount == 0) {
            revert ValSetDriver_InvalidMaxValidatorsCount();
        }
        _getValSetDriverStorage()._maxValidatorsCount.push(uint48(block.timestamp), maxValidatorsCount);
        emit SetMaxValidatorsCount(maxValidatorsCount);
    }

    function _setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal virtual {
        _getValSetDriverStorage()._requiredKeyTags.push(uint48(block.timestamp), requiredKeyTags.serialize());
        emit SetRequiredKeyTags(requiredKeyTags);
    }

    function _addQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) internal virtual {
        ValSetDriverStorage storage $ = _getValSetDriverStorage();
        quorumThreshold.keyTag.validateKeyTag();
        if (quorumThreshold.quorumThreshold > MAX_QUORUM_THRESHOLD) {
            revert ValSetDriver_InvalidQuorumThreshold();
        }
        if ($._isQuorumThresholdKeyTagAdded[quorumThreshold.keyTag]) {
            revert ValSetDriver_KeyTagAlreadyAdded();
        }
        $._isQuorumThresholdKeyTagAdded[quorumThreshold.keyTag] = true;
        $._quorumThresholds.add(uint48(block.timestamp), _serializeQuorumThreshold(quorumThreshold));
        emit AddQuorumThreshold(quorumThreshold);
    }

    function _removeQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) internal virtual {
        ValSetDriverStorage storage $ = _getValSetDriverStorage();
        if (!$._quorumThresholds.remove(uint48(block.timestamp), _serializeQuorumThreshold(quorumThreshold))) {
            revert ValSetDriver_NotAdded();
        }
        $._isQuorumThresholdKeyTagAdded[quorumThreshold.keyTag] = false;
        emit RemoveQuorumThreshold(quorumThreshold);
    }

    function _setRequiredHeaderKeyTag(
        uint8 requiredHeaderKeyTag
    ) internal virtual {
        requiredHeaderKeyTag.validateKeyTag();
        _getValSetDriverStorage()._requiredHeaderKeyTag.push(uint48(block.timestamp), requiredHeaderKeyTag);
        emit SetRequiredHeaderKeyTag(requiredHeaderKeyTag);
    }

    function _setVerificationType(
        uint32 verificationType
    ) internal virtual {
        _getValSetDriverStorage()._verificationType.push(uint48(block.timestamp), verificationType);
        emit SetVerificationType(verificationType);
    }

    function _setMaxMissingEpochs(
        uint48 maxMissingEpochs
    ) internal virtual {
        _getValSetDriverStorage()._maxMissingEpochs.push(uint48(block.timestamp), maxMissingEpochs);
        emit SetMaxMissingEpochs(maxMissingEpochs);
    }

    function _validateCrossChainAddress(
        CrossChainAddress memory crossChainAddress
    ) internal pure virtual {
        if (crossChainAddress.chainId == 0 || crossChainAddress.addr == address(0)) {
            revert ValSetDriver_InvalidCrossChainAddress();
        }
    }

    function _serializeCrossChainAddress(
        CrossChainAddress memory crossChainAddress
    ) internal pure virtual returns (bytes32) {
        return bytes32(uint256(crossChainAddress.chainId) << 160 | uint256(uint160(crossChainAddress.addr)));
    }

    function _deserializeCrossChainAddress(
        bytes32 compressedAddress
    ) internal pure virtual returns (CrossChainAddress memory) {
        return CrossChainAddress({
            addr: address(uint160(uint256(compressedAddress))),
            chainId: uint64(uint256(compressedAddress) >> 160)
        });
    }

    function _serializeQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) internal pure virtual returns (bytes32) {
        return bytes32(uint256(quorumThreshold.keyTag) << 248 | uint256(quorumThreshold.quorumThreshold));
    }

    function _deserializeQuorumThreshold(
        bytes32 compressedQuorumThreshold
    ) internal pure virtual returns (QuorumThreshold memory) {
        return QuorumThreshold({
            keyTag: uint8(uint256(compressedQuorumThreshold) >> 248),
            quorumThreshold: uint248(uint256(compressedQuorumThreshold))
        });
    }
}
