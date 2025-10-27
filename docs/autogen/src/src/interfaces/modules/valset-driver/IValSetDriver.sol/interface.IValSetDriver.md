# IValSetDriver
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3e174a9e69da2b5866055084b62455d579b3d0af/src/interfaces/modules/valset-driver/IValSetDriver.sol)

Interface for the ValSetDriver contract.


## Functions
### MAX_QUORUM_THRESHOLD

Returns the maximum quorum threshold.

The maximum quorum threshold is 1e18 = 100%.


```solidity
function MAX_QUORUM_THRESHOLD() external view returns (uint248);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint248`|The maximum quorum threshold.|


### getConfigAt

Returns the configuration at the given timestamp.


```solidity
function getConfigAt(uint48 timestamp) external view returns (Config memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`Config`|The configuration.|


### getConfig

Returns the configuration.


```solidity
function getConfig() external view returns (Config memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`Config`|The configuration.|


### getNumAggregatorsAt

Returns the number of aggregators (those who aggregate the validators' signatures
and produce the proof for the verification) at the given timestamp.


```solidity
function getNumAggregatorsAt(uint48 timestamp) external view returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The number of aggregators.|


### getNumAggregators

Returns the number of aggregators (those who aggregate the validators' signatures
and produce the proof for the verification).


```solidity
function getNumAggregators() external view returns (uint208);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The number of aggregators.|


### getNumCommittersAt

Returns the number of committers (those who commit some data (e.g., ValSetHeader)
to on-chain) at the given timestamp.


```solidity
function getNumCommittersAt(uint48 timestamp) external view returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The number of committers.|


### getNumCommitters

Returns the number of committers (those who commit some data (e.g., ValSetHeader)
to on-chain).


```solidity
function getNumCommitters() external view returns (uint208);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The number of committers.|


### isVotingPowerProviderRegisteredAt

Returns if the voting power provider is registered at the given timestamp.


```solidity
function isVotingPowerProviderRegisteredAt(CrossChainAddress memory votingPowerProvider, uint48 timestamp)
    external
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the voting power provider is registered.|


### isVotingPowerProviderRegistered

Returns if the voting power provider is registered.


```solidity
function isVotingPowerProviderRegistered(CrossChainAddress memory votingPowerProvider) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the voting power provider is registered.|


### getVotingPowerProvidersAt

Returns the voting power providers at the given timestamp.


```solidity
function getVotingPowerProvidersAt(uint48 timestamp) external view returns (CrossChainAddress[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`CrossChainAddress[]`|The voting power providers (contracts that provide the voting powers of the operators on different chains).|


### getVotingPowerProviders

Returns the voting power providers.


```solidity
function getVotingPowerProviders() external view returns (CrossChainAddress[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`CrossChainAddress[]`|The voting power providers (contracts that provide the voting powers of the operators on different chains).|


### getKeysProviderAt

Returns the keys provider at the given timestamp.


```solidity
function getKeysProviderAt(uint48 timestamp) external view returns (CrossChainAddress memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|


### getKeysProvider

Returns the keys provider.


```solidity
function getKeysProvider() external view returns (CrossChainAddress memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|


### isSettlementRegisteredAt

Returns if the settlement is registered at the given timestamp.


```solidity
function isSettlementRegisteredAt(CrossChainAddress memory settlement, uint48 timestamp)
    external
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the settlement is registered.|


### isSettlementRegistered

Returns if the settlement is registered.


```solidity
function isSettlementRegistered(CrossChainAddress memory settlement) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the settlement is registered.|


### getSettlementsAt

Returns the settlements at the given timestamp.


```solidity
function getSettlementsAt(uint48 timestamp) external view returns (CrossChainAddress[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`CrossChainAddress[]`|The settlements (contracts that enable a verification of the validator set's attestations on different chains).|


### getSettlements

Returns the settlements.


```solidity
function getSettlements() external view returns (CrossChainAddress[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`CrossChainAddress[]`|The settlements (contracts that enable a verification of the validator set's attestations on different chains).|


### getMaxVotingPowerAt

Returns the maximum voting power at the given timestamp.


```solidity
function getMaxVotingPowerAt(uint48 timestamp) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The maximum voting power for each validator.|


### getMaxVotingPower

Returns the maximum voting power.


```solidity
function getMaxVotingPower() external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The maximum voting power for each validator.|


### getMinInclusionVotingPowerAt

Returns the minimum inclusion voting power at the given timestamp.


```solidity
function getMinInclusionVotingPowerAt(uint48 timestamp) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|


### getMinInclusionVotingPower

Returns the minimum inclusion voting power.


```solidity
function getMinInclusionVotingPower() external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|


### getMaxValidatorsCountAt

Returns the maximum active validators count at the given timestamp.


```solidity
function getMaxValidatorsCountAt(uint48 timestamp) external view returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The maximum active validators count in the validator set.|


### getMaxValidatorsCount

Returns the maximum active validators count.


```solidity
function getMaxValidatorsCount() external view returns (uint208);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The maximum active validators count in the validator set.|


### getRequiredKeyTagsAt

Returns the required key tags at the given timestamp.


```solidity
function getRequiredKeyTagsAt(uint48 timestamp) external view returns (uint8[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8[]`|The required key tags to include in the validator set.|


### getRequiredKeyTags

Returns the required key tags.


```solidity
function getRequiredKeyTags() external view returns (uint8[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8[]`|The required key tags to include in the validator set.|


### isQuorumThresholdRegisteredAt

Returns if the quorum threshold is registered at the given timestamp.


```solidity
function isQuorumThresholdRegisteredAt(QuorumThreshold memory quorumThreshold, uint48 timestamp)
    external
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the quorum threshold is registered.|


### isQuorumThresholdRegistered

Returns if the quorum threshold is registered.


```solidity
function isQuorumThresholdRegistered(QuorumThreshold memory quorumThreshold) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the quorum threshold is registered.|


### getQuorumThresholdsAt

Returns the quorum thresholds at the given timestamp.


```solidity
function getQuorumThresholdsAt(uint48 timestamp) external view returns (QuorumThreshold[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`QuorumThreshold[]`|The quorum thresholds to use for attestations' verification.|


### getQuorumThresholds

Returns the quorum thresholds.


```solidity
function getQuorumThresholds() external view returns (QuorumThreshold[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`QuorumThreshold[]`|The quorum thresholds to use for attestations' verification.|


### getRequiredHeaderKeyTagAt

Returns the required header key tag at the given timestamp.


```solidity
function getRequiredHeaderKeyTagAt(uint48 timestamp) external view returns (uint8);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|


### getRequiredHeaderKeyTag

Returns the required header key tag.


```solidity
function getRequiredHeaderKeyTag() external view returns (uint8);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|


### getVerificationTypeAt

Returns the verification type at the given timestamp.


```solidity
function getVerificationTypeAt(uint48 timestamp) external view returns (uint32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint32`|The verification type (e.g., simple on-chain verification, or zk-based one).|


### getVerificationType

Returns the verification type.


```solidity
function getVerificationType() external view returns (uint32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint32`|The verification type (e.g., simple on-chain verification, or zk-based one).|


### setNumAggregators

Sets the number of aggregators (those who aggregate the validators' signatures
and produce the proof for the verification).

The caller must have the needed permission.


```solidity
function setNumAggregators(uint208 numAggregators) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`numAggregators`|`uint208`|The number of aggregators.|


### setNumCommitters

Sets the number of committers (those who commit some data (e.g., ValSetHeader)
to on-chain).

The caller must have the needed permission.


```solidity
function setNumCommitters(uint208 numCommitters) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`numCommitters`|`uint208`|The number of committers.|


### addVotingPowerProvider

Adds a voting power provider.

The caller must have the needed permission.


```solidity
function addVotingPowerProvider(CrossChainAddress memory votingPowerProvider) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider (contract that provides the voting powers of the operators on different chains).|


### removeVotingPowerProvider

Removes a voting power provider.

The caller must have the needed permission.


```solidity
function removeVotingPowerProvider(CrossChainAddress memory votingPowerProvider) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider (contract that provides the voting powers of the operators on different chains).|


### setKeysProvider

Sets the keys provider.

The caller must have the needed permission.


```solidity
function setKeysProvider(CrossChainAddress memory keysProvider) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keysProvider`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|


### addSettlement

Adds a settlement.

The caller must have the needed permission.


```solidity
function addSettlement(CrossChainAddress memory settlement) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement (contract that enable a verification of the validator set's attestations on different chains).|


### removeSettlement

Removes a settlement.

The caller must have the needed permission.


```solidity
function removeSettlement(CrossChainAddress memory settlement) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement (contract that enable a verification of the validator set's attestations on different chains).|


### setMaxVotingPower

Sets the maximum voting power.

The caller must have the needed permission.


```solidity
function setMaxVotingPower(uint256 maxVotingPower) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`maxVotingPower`|`uint256`|The maximum voting power for each validator.|


### setMinInclusionVotingPower

Sets the minimum inclusion voting power.

The caller must have the needed permission.


```solidity
function setMinInclusionVotingPower(uint256 minInclusionVotingPower) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`minInclusionVotingPower`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|


### setMaxValidatorsCount

Sets the maximum active validators count.

The caller must have the needed permission.


```solidity
function setMaxValidatorsCount(uint208 maxValidatorsCount) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`maxValidatorsCount`|`uint208`|The maximum active validators count in the validator set.|


### setRequiredKeyTags

Sets the required key tags.

The caller must have the needed permission.


```solidity
function setRequiredKeyTags(uint8[] memory requiredKeyTags) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`requiredKeyTags`|`uint8[]`|The required key tags to include in the validator set.|


### addQuorumThreshold

Adds a quorum threshold.

The caller must have the needed permission.


```solidity
function addQuorumThreshold(QuorumThreshold memory quorumThreshold) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold to use for attestations' verification.|


### removeQuorumThreshold

Removes a quorum threshold.

The caller must have the needed permission.


```solidity
function removeQuorumThreshold(QuorumThreshold memory quorumThreshold) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold to use for attestations' verification.|


### setRequiredHeaderKeyTag

Sets the required header key tag.

The caller must have the needed permission.


```solidity
function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`requiredHeaderKeyTag`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|


### setVerificationType

Sets the verification type.

The caller must have the needed permission.


```solidity
function setVerificationType(uint32 verificationType) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verificationType`|`uint32`|The verification type (e.g., simple on-chain verification, or zk-based one).|


## Events
### SetNumAggregators
Emitted when the number of aggregators is set.


```solidity
event SetNumAggregators(uint208 numAggregators);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`numAggregators`|`uint208`|The number of aggregators (those who aggregate the validators' signatures and produce the proof for the verification).|

### SetNumCommitters
Emitted when the number of committers is set.


```solidity
event SetNumCommitters(uint208 numCommitters);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`numCommitters`|`uint208`|The number of committers (those who commit some data (e.g., ValSetHeader) to on-chain).|

### AddVotingPowerProvider
Emitted when the voting power provider is added.


```solidity
event AddVotingPowerProvider(CrossChainAddress votingPowerProvider);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider (contract that provides the voting powers of the operators on different chains).|

### RemoveVotingPowerProvider
Emitted when the voting power provider is removed.


```solidity
event RemoveVotingPowerProvider(CrossChainAddress votingPowerProvider);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider (contract that provides the voting powers of the operators on different chains).|

### SetKeysProvider
Emitted when the keys provider is set.


```solidity
event SetKeysProvider(CrossChainAddress keysProvider);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keysProvider`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|

### AddSettlement
Emitted when the settlement is added.


```solidity
event AddSettlement(CrossChainAddress settlement);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement (contract that enable a verification of the validator set's attestations on different chains).|

### RemoveSettlement
Emitted when the settlement is removed.


```solidity
event RemoveSettlement(CrossChainAddress settlement);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement (contract that enable a verification of the validator set's attestations on different chains).|

### SetMaxVotingPower
Emitted when the maximum voting power is set.


```solidity
event SetMaxVotingPower(uint256 maxVotingPower);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`maxVotingPower`|`uint256`|The maximum voting power for each validator.|

### SetMinInclusionVotingPower
Emitted when the minimum inclusion voting power is set.


```solidity
event SetMinInclusionVotingPower(uint256 minInclusionVotingPower);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`minInclusionVotingPower`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|

### SetMaxValidatorsCount
Emitted when the maximum active validators count is set.


```solidity
event SetMaxValidatorsCount(uint208 maxValidatorsCount);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`maxValidatorsCount`|`uint208`|The maximum active validators count in the validator set.|

### SetRequiredKeyTags
Emitted when the required key tags are set.


```solidity
event SetRequiredKeyTags(uint8[] requiredKeyTags);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`requiredKeyTags`|`uint8[]`|The required key tags to include in the validator set.|

### AddQuorumThreshold
Emitted when the quorum threshold is added.


```solidity
event AddQuorumThreshold(QuorumThreshold quorumThreshold);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold to use for attestations' verification.|

### SetRequiredHeaderKeyTag
Emitted when the required header key tag is set.


```solidity
event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`requiredHeaderKeyTag`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|

### RemoveQuorumThreshold
Emitted when the quorum threshold is removed.


```solidity
event RemoveQuorumThreshold(QuorumThreshold quorumThreshold);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold to use for attestations' verification.|

### SetVerificationType
Emitted when the verification type is set.


```solidity
event SetVerificationType(uint32 verificationType);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verificationType`|`uint32`|The verification type (e.g., simple on-chain verification, or zk-based one).|

## Errors
### ValSetDriver_ChainAlreadyAdded
Reverts when the cross-chain address with the same chain ID is already added.


```solidity
error ValSetDriver_ChainAlreadyAdded();
```

### ValSetDriver_InvalidCrossChainAddress
Reverts when the cross-chain address is either zero or has zero chain ID.


```solidity
error ValSetDriver_InvalidCrossChainAddress();
```

### ValSetDriver_InvalidMaxValidatorsCount
Reverts when the maximum active validators count is zero.


```solidity
error ValSetDriver_InvalidMaxValidatorsCount();
```

### ValSetDriver_InvalidQuorumThreshold
Reverts when the quorum threshold is greater than the maximum quorum threshold.

The maximum quorum threshold is 1e18 = 100%.


```solidity
error ValSetDriver_InvalidQuorumThreshold();
```

### ValSetDriver_KeyTagAlreadyAdded
Reverts when the quorum threshold with the same key tag is already added.


```solidity
error ValSetDriver_KeyTagAlreadyAdded();
```

### ValSetDriver_NotAdded
Reverts when the subject is not added but was tried to be removed.


```solidity
error ValSetDriver_NotAdded();
```

### ValSetDriver_ZeroNumAggregators
Reverts when the number of aggregators is zero.


```solidity
error ValSetDriver_ZeroNumAggregators();
```

### ValSetDriver_ZeroNumCommitters
Reverts when the number of committers is zero.


```solidity
error ValSetDriver_ZeroNumCommitters();
```

## Structs
### ValSetDriverStorage
The storage of the ValSetDriver contract.

**Note:**
storage-location: ERC-7201 slot: erc7201:symbiotic.storage.ValSetDriver.


```solidity
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
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_isVotingPowerProviderChainAdded`|`mapping(uint64 chainId => bool isAdded)`|The mapping from the chain ID to the voting power provider chain added status.|
|`_votingPowerProviders`|`PersistentSet.Bytes32Set`|The set of the voting power providers.|
|`_keysProvider`|`Checkpoints.Trace256`|The checkpoint of the keys provider.|
|`_isSettlementChainAdded`|`mapping(uint64 chainId => bool isAdded)`|The mapping from the chain ID to the settlement chain added status.|
|`_settlements`|`PersistentSet.Bytes32Set`|The set of the settlements.|
|`_verificationType`|`Checkpoints.Trace208`|The checkpoint of the verification type.|
|`_maxVotingPower`|`Checkpoints.Trace256`|The checkpoint of the maximum voting power.|
|`_minInclusionVotingPower`|`Checkpoints.Trace256`|The checkpoint of the minimum inclusion voting power.|
|`_maxValidatorsCount`|`Checkpoints.Trace208`|The checkpoint of the maximum active validators count.|
|`_requiredKeyTags`|`Checkpoints.Trace208`|The checkpoint of the required key tags.|
|`_requiredHeaderKeyTag`|`Checkpoints.Trace208`|The checkpoint of the required header key tag.|
|`_isQuorumThresholdKeyTagAdded`|`mapping(uint8 keyTag => bool isAdded)`|The mapping from the key tag to the quorum threshold key tag added status.|
|`_quorumThresholds`|`PersistentSet.Bytes32Set`|The set of the quorum thresholds.|
|`_numAggregators`|`Checkpoints.Trace208`|The checkpoint of the number of aggregators.|
|`_numCommitters`|`Checkpoints.Trace208`|The checkpoint of the number of committers.|

### ValSetDriverInitParams
The parameters for the initialization of the ValSetDriver contract.


```solidity
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
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`networkManagerInitParams`|`INetworkManager.NetworkManagerInitParams`|The parameters for the initialization of the NetworkManager contract.|
|`epochManagerInitParams`|`IEpochManager.EpochManagerInitParams`|The parameters for the initialization of the EpochManager contract.|
|`numAggregators`|`uint208`|The number of aggregators (those who aggregate the validators' signatures and produce the proof for the verification) at the genesis.|
|`numCommitters`|`uint208`|The number of committers (those who commit some data (e.g., ValSetHeader) to on-chain) at the genesis.|
|`votingPowerProviders`|`CrossChainAddress[]`|The voting power providers (contracts that provide the voting powers of the operators on different chains).|
|`keysProvider`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|
|`settlements`|`CrossChainAddress[]`|The settlements (contracts that enable a verification of the validator set's attestations on different chains).|
|`maxVotingPower`|`uint256`|The maximum voting power for each validator.|
|`minInclusionVotingPower`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|
|`maxValidatorsCount`|`uint208`|The maximum active validators count in the validator set.|
|`requiredKeyTags`|`uint8[]`|The required key tags to include in the validator set.|
|`quorumThresholds`|`QuorumThreshold[]`|The quorum thresholds to use for attestations' verification.|
|`requiredHeaderKeyTag`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|
|`verificationType`|`uint32`|The verification type (e.g., simple on-chain verification, or zk-based one).|

### CrossChainAddress
The cross-chain address.


```solidity
struct CrossChainAddress {
    uint64 chainId;
    address addr;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`chainId`|`uint64`|The chain ID.|
|`addr`|`address`|The address.|

### QuorumThreshold
The quorum threshold.


```solidity
struct QuorumThreshold {
    uint8 keyTag;
    uint248 quorumThreshold;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`keyTag`|`uint8`|The key tag.|
|`quorumThreshold`|`uint248`|The quorum threshold (percentage).|

### Config
The configuration.


```solidity
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
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`numAggregators`|`uint208`|The number of aggregators (those who aggregate the validators' signatures and produce the proof for the verification).|
|`numCommitters`|`uint208`|The number of committers (those who commit some data (e.g., ValSetHeader) to on-chain).|
|`votingPowerProviders`|`CrossChainAddress[]`|The voting power providers (contracts that provide the voting powers of the operators on different chains).|
|`keysProvider`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|
|`settlements`|`CrossChainAddress[]`|The settlements (contracts that enable a verification of the validator set's attestations on different chains).|
|`maxVotingPower`|`uint256`|The maximum voting power for each validator.|
|`minInclusionVotingPower`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|
|`maxValidatorsCount`|`uint208`|The maximum active validators count in the validator set.|
|`requiredKeyTags`|`uint8[]`|The required key tags to include in the validator set.|
|`quorumThresholds`|`QuorumThreshold[]`|The quorum thresholds to use for attestations' verification.|
|`requiredHeaderKeyTag`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|
|`verificationType`|`uint32`|The verification type (e.g., simple on-chain verification, or zk-based one).|

