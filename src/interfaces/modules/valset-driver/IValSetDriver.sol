// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IEpochManager} from "./IEpochManager.sol";
import {INetworkManager} from "../../modules/base/INetworkManager.sol";

import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {PersistentSet} from "../../../libraries/structs/PersistentSet.sol";

interface IValSetDriver {
    /**
     * @notice Reverts when the cross-chain address with the same chain ID is already added.
     */
    error ValSetDriver_ChainAlreadyAdded();

    /**
     * @notice Reverts when the cross-chain address is either zero or has zero chain ID.
     */
    error ValSetDriver_InvalidCrossChainAddress();

    /**
     * @notice Reverts when the maximum active validators count is zero.
     */
    error ValSetDriver_InvalidMaxValidatorsCount();

    /**
     * @notice Reverts when the quorum threshold is greater than the maximum quorum threshold.
     * @dev The maximum quorum threshold is 1e18 = 100%.
     */
    error ValSetDriver_InvalidQuorumThreshold();

    /**
     * @notice Reverts when the quorum threshold with the same key tag is already added.
     */
    error ValSetDriver_KeyTagAlreadyAdded();

    /**
     * @notice Reverts when the subject is not added but was tried to be removed.
     */
    error ValSetDriver_NotAdded();

    /**
     * @notice Reverts when the number of aggregators is zero.
     */
    error ValSetDriver_ZeroNumAggregators();

    /**
     * @notice Reverts when the number of committers is zero.
     */
    error ValSetDriver_ZeroNumCommitters();

    /**
     * @notice The storage of the ValSetDriver contract.
     * @param _isVotingPowerProviderChainAdded The mapping from the chain ID to the voting power provider chain added status.
     * @param _votingPowerProviders The set of the voting power providers.
     * @param _keysProvider The checkpoint of the keys provider.
     * @param _isSettlementChainAdded The mapping from the chain ID to the settlement chain added status.
     * @param _settlements The set of the settlements.
     * @param _verificationType The checkpoint of the verification type.
     * @param _maxVotingPower The checkpoint of the maximum voting power.
     * @param _minInclusionVotingPower The checkpoint of the minimum inclusion voting power.
     * @param _maxValidatorsCount The checkpoint of the maximum active validators count.
     * @param _requiredKeyTags The checkpoint of the required key tags.
     * @param _requiredHeaderKeyTag The checkpoint of the required header key tag.
     * @param _isQuorumThresholdKeyTagAdded The mapping from the key tag to the quorum threshold key tag added status.
     * @param _quorumThresholds The set of the quorum thresholds.
     * @param _numAggregators The checkpoint of the number of aggregators.
     * @param _numCommitters The checkpoint of the number of committers.
     * @custom:storage-location erc7201:symbiotic.storage.ValSetDriver
     */
    struct ValSetDriverStorage {
        mapping(uint64 chainId => bool isAdded) _isVotingPowerProviderChainAdded;
        PersistentSet.Bytes32Set _votingPowerProviders;
        Checkpoints.Trace256 _keysProvider;
        mapping(uint64 chainId => bool isAdded) _isSettlementChainAdded;
        PersistentSet.Bytes32Set _settlements;
        Checkpoints.Trace208 _verificationType;
        Checkpoints.Trace256 _maxVotingPower;
        Checkpoints.Trace256 _minInclusionVotingPower;
        Checkpoints.Trace208 _maxValidatorsCount;
        Checkpoints.Trace208 _requiredKeyTags;
        Checkpoints.Trace208 _requiredHeaderKeyTag;
        mapping(uint8 keyTag => bool isAdded) _isQuorumThresholdKeyTagAdded;
        PersistentSet.Bytes32Set _quorumThresholds;
        Checkpoints.Trace208 _numAggregators;
        Checkpoints.Trace208 _numCommitters;
    }

    /**
     * @notice The parameters for the initialization of the ValSetDriver contract.
     * @param networkManagerInitParams The parameters for the initialization of the NetworkManager contract.
     * @param epochManagerInitParams The parameters for the initialization of the EpochManager contract.
     * @param numAggregators The number of aggregators (those who aggregate the validators' signatures
     *         and produce the proof for the verification) at the genesis.
     * @param numCommitters The number of committers (those who commit some data (e.g., ValSetHeader)
     *         to on-chain) at the genesis.
     * @param votingPowerProviders The voting power providers (contracts that provide the voting powers of the operators on different chains).
     * @param keysProvider The keys provider (contract that provides the keys of the operators).
     * @param settlements The settlements (contracts that enable a verification of the validator set's attestations on different chains).
     * @param maxVotingPower The maximum voting power for each validator.
     * @param minInclusionVotingPower The minimum inclusion voting power for the operator to be included in the validator set.
     * @param maxValidatorsCount The maximum active validators count in the validator set.
     * @param requiredKeyTags The required key tags to include in the validator set.
     * @param quorumThresholds The quorum thresholds to use for attestations' verification.
     * @param requiredHeaderKeyTag The required header key tag to use to maintain the validator set through epochs.
     * @param verificationType The verification type (e.g., simple on-chain verification, or zk-based one).
     */
    struct ValSetDriverInitParams {
        INetworkManager.NetworkManagerInitParams networkManagerInitParams;
        IEpochManager.EpochManagerInitParams epochManagerInitParams;
        uint208 numAggregators;
        uint208 numCommitters;
        CrossChainAddress[] votingPowerProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] settlements;
        uint256 maxVotingPower;
        uint256 minInclusionVotingPower;
        uint208 maxValidatorsCount;
        uint8[] requiredKeyTags;
        QuorumThreshold[] quorumThresholds;
        uint8 requiredHeaderKeyTag;
        uint32 verificationType;
    }

    /**
     * @notice The cross-chain address.
     * @param chainId The chain ID.
     * @param addr The address.
     */
    struct CrossChainAddress {
        uint64 chainId;
        address addr;
    }

    /**
     * @notice The quorum threshold.
     * @param keyTag The key tag.
     * @param quorumThreshold The quorum threshold (percentage).
     */
    struct QuorumThreshold {
        uint8 keyTag;
        uint248 quorumThreshold;
    }

    /**
     * @notice The configuration.
     * @param numAggregators The number of aggregators (those who aggregate the validators' signatures
     *         and produce the proof for the verification).
     * @param numCommitters The number of committers (those who commit some data (e.g., ValSetHeader)
     *         to on-chain).
     * @param votingPowerProviders The voting power providers (contracts that provide the voting powers of the operators on different chains).
     * @param keysProvider The keys provider (contract that provides the keys of the operators).
     * @param settlements The settlements (contracts that enable a verification of the validator set's attestations on different chains).
     * @param maxVotingPower The maximum voting power for each validator.
     * @param minInclusionVotingPower The minimum inclusion voting power for the operator to be included in the validator set.
     * @param maxValidatorsCount The maximum active validators count in the validator set.
     * @param requiredKeyTags The required key tags to include in the validator set.
     * @param quorumThresholds The quorum thresholds to use for attestations' verification.
     * @param requiredHeaderKeyTag The required header key tag to use to maintain the validator set through epochs.
     * @param verificationType The verification type (e.g., simple on-chain verification, or zk-based one).
     */
    struct Config {
        uint208 numAggregators;
        uint208 numCommitters;
        CrossChainAddress[] votingPowerProviders;
        CrossChainAddress keysProvider;
        CrossChainAddress[] settlements;
        uint256 maxVotingPower;
        uint256 minInclusionVotingPower;
        uint208 maxValidatorsCount;
        uint8[] requiredKeyTags;
        QuorumThreshold[] quorumThresholds;
        uint8 requiredHeaderKeyTag;
        uint32 verificationType;
    }

    /**
     * @notice Emitted when the number of aggregators is set.
     * @param numAggregators The number of aggregators (those who aggregate the validators' signatures
     *         and produce the proof for the verification).
     */
    event SetNumAggregators(uint208 numAggregators);

    /**
     * @notice Emitted when the number of committers is set.
     * @param numCommitters The number of committers (those who commit some data (e.g., ValSetHeader)
     *         to on-chain).
     */
    event SetNumCommitters(uint208 numCommitters);

    /**
     * @notice Emitted when the voting power provider is added.
     * @param votingPowerProvider The voting power provider (contract that provides the voting powers of the operators on different chains).
     */
    event AddVotingPowerProvider(CrossChainAddress votingPowerProvider);

    /**
     * @notice Emitted when the voting power provider is removed.
     * @param votingPowerProvider The voting power provider (contract that provides the voting powers of the operators on different chains).
     */
    event RemoveVotingPowerProvider(CrossChainAddress votingPowerProvider);

    /**
     * @notice Emitted when the keys provider is set.
     * @param keysProvider The keys provider (contract that provides the keys of the operators).
     */
    event SetKeysProvider(CrossChainAddress keysProvider);

    /**
     * @notice Emitted when the settlement is added.
     * @param settlement The settlement (contract that enable a verification of the validator set's attestations on different chains).
     */
    event AddSettlement(CrossChainAddress settlement);

    /**
     * @notice Emitted when the settlement is removed.
     * @param settlement The settlement (contract that enable a verification of the validator set's attestations on different chains).
     */
    event RemoveSettlement(CrossChainAddress settlement);

    /**
     * @notice Emitted when the maximum voting power is set.
     * @param maxVotingPower The maximum voting power for each validator.
     */
    event SetMaxVotingPower(uint256 maxVotingPower);

    /**
     * @notice Emitted when the minimum inclusion voting power is set.
     * @param minInclusionVotingPower The minimum inclusion voting power for the operator to be included in the validator set.
     */
    event SetMinInclusionVotingPower(uint256 minInclusionVotingPower);

    /**
     * @notice Emitted when the maximum active validators count is set.
     * @param maxValidatorsCount The maximum active validators count in the validator set.
     */
    event SetMaxValidatorsCount(uint208 maxValidatorsCount);

    /**
     * @notice Emitted when the required key tags are set.
     * @param requiredKeyTags The required key tags to include in the validator set.
     */
    event SetRequiredKeyTags(uint8[] requiredKeyTags);

    /**
     * @notice Emitted when the quorum threshold is added.
     * @param quorumThreshold The quorum threshold to use for attestations' verification.
     */
    event AddQuorumThreshold(QuorumThreshold quorumThreshold);

    /**
     * @notice Emitted when the required header key tag is set.
     * @param requiredHeaderKeyTag The required header key tag to use to maintain the validator set through epochs.
     */
    event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag);

    /**
     * @notice Emitted when the quorum threshold is removed.
     * @param quorumThreshold The quorum threshold to use for attestations' verification.
     */
    event RemoveQuorumThreshold(QuorumThreshold quorumThreshold);

    /**
     * @notice Emitted when the verification type is set.
     * @param verificationType The verification type (e.g., simple on-chain verification, or zk-based one).
     */
    event SetVerificationType(uint32 verificationType);

    /**
     * @notice Returns the maximum quorum threshold.
     * @return The maximum quorum threshold.
     * @dev The maximum quorum threshold is 1e18 = 100%.
     */
    function MAX_QUORUM_THRESHOLD() external view returns (uint248);

    /**
     * @notice Returns the configuration at the given timestamp.
     * @param timestamp The timestamp.
     * @return The configuration.
     */
    function getConfigAt(
        uint48 timestamp
    ) external view returns (Config memory);

    /**
     * @notice Returns the configuration.
     * @return The configuration.
     */
    function getConfig() external view returns (Config memory);

    /**
     * @notice Returns the number of aggregators (those who aggregate the validators' signatures
     *         and produce the proof for the verification) at the given timestamp.
     * @param timestamp The timestamp.
     * @return The number of aggregators.
     */
    function getNumAggregatorsAt(
        uint48 timestamp
    ) external view returns (uint208);

    /**
     * @notice Returns the number of aggregators (those who aggregate the validators' signatures
     *         and produce the proof for the verification).
     * @return The number of aggregators.
     */
    function getNumAggregators() external view returns (uint208);

    /**
     * @notice Returns the number of committers (those who commit some data (e.g., ValSetHeader)
     *         to on-chain) at the given timestamp.
     * @param timestamp The timestamp.
     * @return The number of committers.
     */
    function getNumCommittersAt(
        uint48 timestamp
    ) external view returns (uint208);

    /**
     * @notice Returns the number of committers (those who commit some data (e.g., ValSetHeader)
     *         to on-chain).
     * @return The number of committers.
     */
    function getNumCommitters() external view returns (uint208);

    /**
     * @notice Returns if the voting power provider is registered at the given timestamp.
     * @param votingPowerProvider The voting power provider.
     * @param timestamp The timestamp.
     * @return If the voting power provider is registered.
     */
    function isVotingPowerProviderRegisteredAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp
    ) external view returns (bool);

    /**
     * @notice Returns if the voting power provider is registered.
     * @param votingPowerProvider The voting power provider.
     * @return If the voting power provider is registered.
     */
    function isVotingPowerProviderRegistered(
        CrossChainAddress memory votingPowerProvider
    ) external view returns (bool);

    /**
     * @notice Returns the voting power providers at the given timestamp.
     * @param timestamp The timestamp.
     * @return The voting power providers (contracts that provide the voting powers of the operators on different chains).
     */
    function getVotingPowerProvidersAt(
        uint48 timestamp
    ) external view returns (CrossChainAddress[] memory);

    /**
     * @notice Returns the voting power providers.
     * @return The voting power providers (contracts that provide the voting powers of the operators on different chains).
     */
    function getVotingPowerProviders() external view returns (CrossChainAddress[] memory);

    /**
     * @notice Returns the keys provider at the given timestamp.
     * @param timestamp The timestamp.
     * @return The keys provider (contract that provides the keys of the operators).
     */
    function getKeysProviderAt(
        uint48 timestamp
    ) external view returns (CrossChainAddress memory);

    /**
     * @notice Returns the keys provider.
     * @return The keys provider (contract that provides the keys of the operators).
     */
    function getKeysProvider() external view returns (CrossChainAddress memory);

    /**
     * @notice Returns if the settlement is registered at the given timestamp.
     * @param settlement The settlement.
     * @param timestamp The timestamp.
     * @return If the settlement is registered.
     */
    function isSettlementRegisteredAt(
        CrossChainAddress memory settlement,
        uint48 timestamp
    ) external view returns (bool);

    /**
     * @notice Returns if the settlement is registered.
     * @param settlement The settlement.
     * @return If the settlement is registered.
     */
    function isSettlementRegistered(
        CrossChainAddress memory settlement
    ) external view returns (bool);

    /**
     * @notice Returns the settlements at the given timestamp.
     * @param timestamp The timestamp.
     * @return The settlements (contracts that enable a verification of the validator set's attestations on different chains).
     */
    function getSettlementsAt(
        uint48 timestamp
    ) external view returns (CrossChainAddress[] memory);

    /**
     * @notice Returns the settlements.
     * @return The settlements (contracts that enable a verification of the validator set's attestations on different chains).
     */
    function getSettlements() external view returns (CrossChainAddress[] memory);

    /**
     * @notice Returns the maximum voting power at the given timestamp.
     * @param timestamp The timestamp.
     * @return The maximum voting power for each validator.
     */
    function getMaxVotingPowerAt(
        uint48 timestamp
    ) external view returns (uint256);

    /**
     * @notice Returns the maximum voting power.
     * @return The maximum voting power for each validator.
     */
    function getMaxVotingPower() external view returns (uint256);

    /**
     * @notice Returns the minimum inclusion voting power at the given timestamp.
     * @param timestamp The timestamp.
     * @return The minimum inclusion voting power for the operator to be included in the validator set.
     */
    function getMinInclusionVotingPowerAt(
        uint48 timestamp
    ) external view returns (uint256);

    /**
     * @notice Returns the minimum inclusion voting power.
     * @return The minimum inclusion voting power for the operator to be included in the validator set.
     */
    function getMinInclusionVotingPower() external view returns (uint256);

    /**
     * @notice Returns the maximum active validators count at the given timestamp.
     * @param timestamp The timestamp.
     * @return The maximum active validators count in the validator set.
     */
    function getMaxValidatorsCountAt(
        uint48 timestamp
    ) external view returns (uint208);

    /**
     * @notice Returns the maximum active validators count.
     * @return The maximum active validators count in the validator set.
     */
    function getMaxValidatorsCount() external view returns (uint208);

    /**
     * @notice Returns the required key tags at the given timestamp.
     * @param timestamp The timestamp.
     * @return The required key tags to include in the validator set.
     */
    function getRequiredKeyTagsAt(
        uint48 timestamp
    ) external view returns (uint8[] memory);

    /**
     * @notice Returns the required key tags.
     * @return The required key tags to include in the validator set.
     */
    function getRequiredKeyTags() external view returns (uint8[] memory);

    /**
     * @notice Returns if the quorum threshold is registered at the given timestamp.
     * @param quorumThreshold The quorum threshold.
     * @param timestamp The timestamp.
     * @return If the quorum threshold is registered.
     */
    function isQuorumThresholdRegisteredAt(
        QuorumThreshold memory quorumThreshold,
        uint48 timestamp
    ) external view returns (bool);

    /**
     * @notice Returns if the quorum threshold is registered.
     * @param quorumThreshold The quorum threshold.
     * @return If the quorum threshold is registered.
     */
    function isQuorumThresholdRegistered(
        QuorumThreshold memory quorumThreshold
    ) external view returns (bool);

    /**
     * @notice Returns the quorum thresholds at the given timestamp.
     * @param timestamp The timestamp.
     * @return The quorum thresholds to use for attestations' verification.
     */
    function getQuorumThresholdsAt(
        uint48 timestamp
    ) external view returns (QuorumThreshold[] memory);

    /**
     * @notice Returns the quorum thresholds.
     * @return The quorum thresholds to use for attestations' verification.
     */
    function getQuorumThresholds() external view returns (QuorumThreshold[] memory);

    /**
     * @notice Returns the required header key tag at the given timestamp.
     * @param timestamp The timestamp.
     * @return The required header key tag to use to maintain the validator set through epochs.
     */
    function getRequiredHeaderKeyTagAt(
        uint48 timestamp
    ) external view returns (uint8);

    /**
     * @notice Returns the required header key tag.
     * @return The required header key tag to use to maintain the validator set through epochs.
     */
    function getRequiredHeaderKeyTag() external view returns (uint8);

    /**
     * @notice Returns the verification type at the given timestamp.
     * @param timestamp The timestamp.
     * @return The verification type (e.g., simple on-chain verification, or zk-based one).
     */
    function getVerificationTypeAt(
        uint48 timestamp
    ) external view returns (uint32);

    /**
     * @notice Returns the verification type.
     * @return The verification type (e.g., simple on-chain verification, or zk-based one).
     */
    function getVerificationType() external view returns (uint32);

    /**
     * @notice Sets the number of aggregators (those who aggregate the validators' signatures
     *         and produce the proof for the verification).
     * @param numAggregators The number of aggregators.
     * @dev The caller must have the needed permission.
     */
    function setNumAggregators(
        uint208 numAggregators
    ) external;

    /**
     * @notice Sets the number of committers (those who commit some data (e.g., ValSetHeader)
     *         to on-chain).
     * @param numCommitters The number of committers.
     * @dev The caller must have the needed permission.
     */
    function setNumCommitters(
        uint208 numCommitters
    ) external;

    /**
     * @notice Adds a voting power provider.
     * @param votingPowerProvider The voting power provider (contract that provides the voting powers of the operators on different chains).
     * @dev The caller must have the needed permission.
     */
    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) external;

    /**
     * @notice Removes a voting power provider.
     * @param votingPowerProvider The voting power provider (contract that provides the voting powers of the operators on different chains).
     * @dev The caller must have the needed permission.
     */
    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) external;

    /**
     * @notice Sets the keys provider.
     * @param keysProvider The keys provider (contract that provides the keys of the operators).
     * @dev The caller must have the needed permission.
     */
    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) external;

    /**
     * @notice Adds a settlement.
     * @param settlement The settlement (contract that enable a verification of the validator set's attestations on different chains).
     * @dev The caller must have the needed permission.
     */
    function addSettlement(
        CrossChainAddress memory settlement
    ) external;

    /**
     * @notice Removes a settlement.
     * @param settlement The settlement (contract that enable a verification of the validator set's attestations on different chains).
     * @dev The caller must have the needed permission.
     */
    function removeSettlement(
        CrossChainAddress memory settlement
    ) external;

    /**
     * @notice Sets the maximum voting power.
     * @param maxVotingPower The maximum voting power for each validator.
     * @dev The caller must have the needed permission.
     */
    function setMaxVotingPower(
        uint256 maxVotingPower
    ) external;

    /**
     * @notice Sets the minimum inclusion voting power.
     * @param minInclusionVotingPower The minimum inclusion voting power for the operator to be included in the validator set.
     * @dev The caller must have the needed permission.
     */
    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) external;

    /**
     * @notice Sets the maximum active validators count.
     * @param maxValidatorsCount The maximum active validators count in the validator set.
     * @dev The caller must have the needed permission.
     */
    function setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) external;

    /**
     * @notice Sets the required key tags.
     * @param requiredKeyTags The required key tags to include in the validator set.
     * @dev The caller must have the needed permission.
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) external;

    /**
     * @notice Adds a quorum threshold.
     * @param quorumThreshold The quorum threshold to use for attestations' verification.
     * @dev The caller must have the needed permission.
     */
    function addQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) external;

    /**
     * @notice Removes a quorum threshold.
     * @param quorumThreshold The quorum threshold to use for attestations' verification.
     * @dev The caller must have the needed permission.
     */
    function removeQuorumThreshold(
        QuorumThreshold memory quorumThreshold
    ) external;

    /**
     * @notice Sets the required header key tag.
     * @param requiredHeaderKeyTag The required header key tag to use to maintain the validator set through epochs.
     * @dev The caller must have the needed permission.
     */
    function setRequiredHeaderKeyTag(
        uint8 requiredHeaderKeyTag
    ) external;

    /**
     * @notice Sets the verification type.
     * @param verificationType The verification type (e.g., simple on-chain verification, or zk-based one).
     * @dev The caller must have the needed permission.
     */
    function setVerificationType(
        uint32 verificationType
    ) external;
}
