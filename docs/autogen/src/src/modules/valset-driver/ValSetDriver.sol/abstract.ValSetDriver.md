# ValSetDriver
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3555af95a3dd521f0c0f40867fec8f48136f728e/src/modules/valset-driver/ValSetDriver.sol)

**Inherits:**
[EpochManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/valset-driver/EpochManager.sol/abstract.EpochManager.md), [NetworkManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/NetworkManager.sol/abstract.NetworkManager.md), MulticallUpgradeable, [IValSetDriver](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/valset-driver/IValSetDriver.sol/interface.IValSetDriver.md)

Contract for providing various configs and driving data for off-chain services.


## State Variables
### MAX_QUORUM_THRESHOLD
Returns the maximum quorum threshold.

The maximum quorum threshold is 1e18 = 100%.


```solidity
uint248 public constant MAX_QUORUM_THRESHOLD = 10 ** 18
```


### ValSetDriverStorageLocation

```solidity
bytes32 private constant ValSetDriverStorageLocation =
    0x1bdf637a86d66983203bb31f20408fc8a4c8b9248a23572df8a2016148669f00
```


## Functions
### _getValSetDriverStorage


```solidity
function _getValSetDriverStorage() internal pure returns (ValSetDriverStorage storage $);
```

### __ValSetDriver_init


```solidity
function __ValSetDriver_init(ValSetDriverInitParams memory valSetDriverInitParams)
    internal
    virtual
    onlyInitializing;
```

### getConfigAt

Returns the configuration at the given timestamp.


```solidity
function getConfigAt(uint48 timestamp) public view virtual returns (Config memory);
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
function getConfig() public view virtual returns (Config memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`Config`|The configuration.|


### getNumAggregatorsAt

Returns the number of aggregators (those who aggregate the validators' signatures
and produce the proof for the verification) at the given timestamp.


```solidity
function getNumAggregatorsAt(uint48 timestamp) public view virtual returns (uint208);
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
function getNumAggregators() public view virtual returns (uint208);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The number of aggregators.|


### getNumCommittersAt

Returns the number of committers (those who commit some data (e.g., ValSetHeader)
to on-chain) at the given timestamp.


```solidity
function getNumCommittersAt(uint48 timestamp) public view virtual returns (uint208);
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
function getNumCommitters() public view virtual returns (uint208);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The number of committers.|


### getCommitterSlotDurationAt

Returns the committer slot duration at the given timestamp.


```solidity
function getCommitterSlotDurationAt(uint48 timestamp) public view virtual returns (uint48);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The committer slot duration.|


### getCommitterSlotDuration

Returns the committer slot duration.


```solidity
function getCommitterSlotDuration() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The committer slot duration.|


### isVotingPowerProviderRegisteredAt

Returns if the voting power provider is registered at the given timestamp.


```solidity
function isVotingPowerProviderRegisteredAt(CrossChainAddress memory votingPowerProvider, uint48 timestamp)
    public
    view
    virtual
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
function isVotingPowerProviderRegistered(CrossChainAddress memory votingPowerProvider)
    public
    view
    virtual
    returns (bool);
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
function getVotingPowerProvidersAt(uint48 timestamp)
    public
    view
    virtual
    returns (CrossChainAddress[] memory votingPowerProviders);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProviders`|`CrossChainAddress[]`|The voting power providers (contracts that provide the voting powers of the operators on different chains).|


### getVotingPowerProviders

Returns the voting power providers.


```solidity
function getVotingPowerProviders() public view virtual returns (CrossChainAddress[] memory votingPowerProviders);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProviders`|`CrossChainAddress[]`|The voting power providers (contracts that provide the voting powers of the operators on different chains).|


### getKeysProviderAt

Returns the keys provider at the given timestamp.


```solidity
function getKeysProviderAt(uint48 timestamp) public view virtual returns (CrossChainAddress memory);
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
function getKeysProvider() public view virtual returns (CrossChainAddress memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|


### isSettlementRegisteredAt

Returns if the settlement is registered at the given timestamp.


```solidity
function isSettlementRegisteredAt(CrossChainAddress memory settlement, uint48 timestamp)
    public
    view
    virtual
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
function isSettlementRegistered(CrossChainAddress memory settlement) public view virtual returns (bool);
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
function getSettlementsAt(uint48 timestamp) public view virtual returns (CrossChainAddress[] memory settlements);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`settlements`|`CrossChainAddress[]`|The settlements (contracts that enable a verification of the validator set's attestations on different chains).|


### getSettlements

Returns the settlements.


```solidity
function getSettlements() public view virtual returns (CrossChainAddress[] memory settlements);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`settlements`|`CrossChainAddress[]`|The settlements (contracts that enable a verification of the validator set's attestations on different chains).|


### getMaxVotingPowerAt

Returns the maximum voting power at the given timestamp.


```solidity
function getMaxVotingPowerAt(uint48 timestamp) public view virtual returns (uint256);
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
function getMaxVotingPower() public view virtual returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The maximum voting power for each validator.|


### getMinInclusionVotingPowerAt

Returns the minimum inclusion voting power at the given timestamp.


```solidity
function getMinInclusionVotingPowerAt(uint48 timestamp) public view virtual returns (uint256);
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
function getMinInclusionVotingPower() public view virtual returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|


### getMaxValidatorsCountAt

Returns the maximum active validators count at the given timestamp.


```solidity
function getMaxValidatorsCountAt(uint48 timestamp) public view virtual returns (uint208);
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
function getMaxValidatorsCount() public view virtual returns (uint208);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The maximum active validators count in the validator set.|


### getRequiredKeyTagsAt

Returns the required key tags at the given timestamp.


```solidity
function getRequiredKeyTagsAt(uint48 timestamp) public view virtual returns (uint8[] memory requiredKeyTags);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`requiredKeyTags`|`uint8[]`|The required key tags to include in the validator set.|


### getRequiredKeyTags

Returns the required key tags.


```solidity
function getRequiredKeyTags() public view virtual returns (uint8[] memory requiredKeyTags);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`requiredKeyTags`|`uint8[]`|The required key tags to include in the validator set.|


### isQuorumThresholdRegisteredAt

Returns if the quorum threshold is registered at the given timestamp.


```solidity
function isQuorumThresholdRegisteredAt(QuorumThreshold memory quorumThreshold, uint48 timestamp)
    public
    view
    virtual
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
function isQuorumThresholdRegistered(QuorumThreshold memory quorumThreshold) public view virtual returns (bool);
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
function getQuorumThresholdsAt(uint48 timestamp)
    public
    view
    virtual
    returns (QuorumThreshold[] memory quorumThresholds);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`quorumThresholds`|`QuorumThreshold[]`|The quorum thresholds to use for attestations' verification.|


### getQuorumThresholds

Returns the quorum thresholds.


```solidity
function getQuorumThresholds() public view virtual returns (QuorumThreshold[] memory quorumThresholds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`quorumThresholds`|`QuorumThreshold[]`|The quorum thresholds to use for attestations' verification.|


### getRequiredHeaderKeyTagAt

Returns the required header key tag at the given timestamp.


```solidity
function getRequiredHeaderKeyTagAt(uint48 timestamp) public view virtual returns (uint8);
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
function getRequiredHeaderKeyTag() public view virtual returns (uint8);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|


### getVerificationTypeAt

Returns the verification type at the given timestamp.


```solidity
function getVerificationTypeAt(uint48 timestamp) public view virtual returns (uint32);
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
function getVerificationType() public view virtual returns (uint32);
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
function setNumAggregators(uint208 numAggregators) public virtual checkPermission;
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
function setNumCommitters(uint208 numCommitters) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`numCommitters`|`uint208`|The number of committers.|


### setCommitterSlotDuration

Sets the committer slot duration (determines how often the committers are switched).

The caller must have the needed permission.


```solidity
function setCommitterSlotDuration(uint48 slotDuration) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slotDuration`|`uint48`|The committer slot duration.|


### addVotingPowerProvider

Adds a voting power provider.

The caller must have the needed permission.


```solidity
function addVotingPowerProvider(CrossChainAddress memory votingPowerProvider) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider (contract that provides the voting powers of the operators on different chains).|


### removeVotingPowerProvider

Removes a voting power provider.

The caller must have the needed permission.


```solidity
function removeVotingPowerProvider(CrossChainAddress memory votingPowerProvider) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`votingPowerProvider`|`CrossChainAddress`|The voting power provider (contract that provides the voting powers of the operators on different chains).|


### setKeysProvider

Sets the keys provider.

The caller must have the needed permission.


```solidity
function setKeysProvider(CrossChainAddress memory keysProvider) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keysProvider`|`CrossChainAddress`|The keys provider (contract that provides the keys of the operators).|


### addSettlement

Adds a settlement.

The caller must have the needed permission.


```solidity
function addSettlement(CrossChainAddress memory settlement) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement (contract that enable a verification of the validator set's attestations on different chains).|


### removeSettlement

Removes a settlement.

The caller must have the needed permission.


```solidity
function removeSettlement(CrossChainAddress memory settlement) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`CrossChainAddress`|The settlement (contract that enable a verification of the validator set's attestations on different chains).|


### setMaxVotingPower

Sets the maximum voting power.

The caller must have the needed permission.


```solidity
function setMaxVotingPower(uint256 maxVotingPower) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`maxVotingPower`|`uint256`|The maximum voting power for each validator.|


### setMinInclusionVotingPower

Sets the minimum inclusion voting power.

The caller must have the needed permission.


```solidity
function setMinInclusionVotingPower(uint256 minInclusionVotingPower) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`minInclusionVotingPower`|`uint256`|The minimum inclusion voting power for the operator to be included in the validator set.|


### setMaxValidatorsCount

Sets the maximum active validators count.

The caller must have the needed permission.


```solidity
function setMaxValidatorsCount(uint208 maxValidatorsCount) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`maxValidatorsCount`|`uint208`|The maximum active validators count in the validator set.|


### setRequiredKeyTags

Sets the required key tags.

The caller must have the needed permission.


```solidity
function setRequiredKeyTags(uint8[] memory requiredKeyTags) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`requiredKeyTags`|`uint8[]`|The required key tags to include in the validator set.|


### addQuorumThreshold

Adds a quorum threshold.

The caller must have the needed permission.


```solidity
function addQuorumThreshold(QuorumThreshold memory quorumThreshold) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold to use for attestations' verification.|


### removeQuorumThreshold

Removes a quorum threshold.

The caller must have the needed permission.


```solidity
function removeQuorumThreshold(QuorumThreshold memory quorumThreshold) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`quorumThreshold`|`QuorumThreshold`|The quorum threshold to use for attestations' verification.|


### setRequiredHeaderKeyTag

Sets the required header key tag.

The caller must have the needed permission.


```solidity
function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`requiredHeaderKeyTag`|`uint8`|The required header key tag to use to maintain the validator set through epochs.|


### setVerificationType

Sets the verification type.

The caller must have the needed permission.


```solidity
function setVerificationType(uint32 verificationType) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verificationType`|`uint32`|The verification type (e.g., simple on-chain verification, or zk-based one).|


### _setNumAggregators


```solidity
function _setNumAggregators(uint208 numAggregators) internal virtual;
```

### _setNumCommitters


```solidity
function _setNumCommitters(uint208 numCommitters) internal virtual;
```

### _setCommitterSlotDuration


```solidity
function _setCommitterSlotDuration(uint48 slotDuration) internal virtual;
```

### _addVotingPowerProvider


```solidity
function _addVotingPowerProvider(CrossChainAddress memory votingPowerProvider) internal virtual;
```

### _removeVotingPowerProvider


```solidity
function _removeVotingPowerProvider(CrossChainAddress memory votingPowerProvider) internal virtual;
```

### _setKeysProvider


```solidity
function _setKeysProvider(CrossChainAddress memory keysProvider) internal virtual;
```

### _addSettlement


```solidity
function _addSettlement(CrossChainAddress memory settlement) internal virtual;
```

### _removeSettlement


```solidity
function _removeSettlement(CrossChainAddress memory settlement) internal virtual;
```

### _setMaxVotingPower


```solidity
function _setMaxVotingPower(uint256 maxVotingPower) internal virtual;
```

### _setMinInclusionVotingPower


```solidity
function _setMinInclusionVotingPower(uint256 minInclusionVotingPower) internal virtual;
```

### _setMaxValidatorsCount


```solidity
function _setMaxValidatorsCount(uint208 maxValidatorsCount) internal virtual;
```

### _setRequiredKeyTags


```solidity
function _setRequiredKeyTags(uint8[] memory requiredKeyTags) internal virtual;
```

### _addQuorumThreshold


```solidity
function _addQuorumThreshold(QuorumThreshold memory quorumThreshold) internal virtual;
```

### _removeQuorumThreshold


```solidity
function _removeQuorumThreshold(QuorumThreshold memory quorumThreshold) internal virtual;
```

### _setRequiredHeaderKeyTag


```solidity
function _setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) internal virtual;
```

### _setVerificationType


```solidity
function _setVerificationType(uint32 verificationType) internal virtual;
```

### _validateCrossChainAddress


```solidity
function _validateCrossChainAddress(CrossChainAddress memory crossChainAddress) internal pure virtual;
```

### _serializeCrossChainAddress


```solidity
function _serializeCrossChainAddress(CrossChainAddress memory crossChainAddress)
    internal
    pure
    virtual
    returns (bytes32);
```

### _deserializeCrossChainAddress


```solidity
function _deserializeCrossChainAddress(bytes32 compressedAddress)
    internal
    pure
    virtual
    returns (CrossChainAddress memory);
```

### _serializeQuorumThreshold


```solidity
function _serializeQuorumThreshold(QuorumThreshold memory quorumThreshold) internal pure virtual returns (bytes32);
```

### _deserializeQuorumThreshold


```solidity
function _deserializeQuorumThreshold(bytes32 compressedQuorumThreshold)
    internal
    pure
    virtual
    returns (QuorumThreshold memory);
```

