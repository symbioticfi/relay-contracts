# IEpochManager
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/f15b7f1298f3e89ef5f17b3ef10b20d2dc6845d4/src/interfaces/modules/valset-driver/IEpochManager.sol)

Interface for the EpochManager contract.


## Functions
### getCurrentEpoch

Returns the current epoch.


```solidity
function getCurrentEpoch() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The current epoch.|


### getCurrentEpochDuration

Returns the current epoch duration.


```solidity
function getCurrentEpochDuration() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The current epoch duration.|


### getCurrentEpochStart

Returns the current epoch start.


```solidity
function getCurrentEpochStart() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The current epoch start.|


### getNextEpoch

Returns the next epoch.


```solidity
function getNextEpoch() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The next epoch.|


### getNextEpochDuration

Returns the next epoch duration.


```solidity
function getNextEpochDuration() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The next epoch duration.|


### getNextEpochStart

Returns the next epoch start.


```solidity
function getNextEpochStart() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The next epoch start.|


### getEpochIndex

Returns the epoch index at the given timestamp.


```solidity
function getEpochIndex(uint48 timestamp) external view returns (uint48);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The epoch index at the given timestamp.|


### getEpochDuration

Returns the epoch duration of the given epoch.


```solidity
function getEpochDuration(uint48 epoch) external view returns (uint48);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The epoch duration of the given epoch.|


### getEpochStart

Returns the epoch start of the given epoch.


```solidity
function getEpochStart(uint48 epoch) external view returns (uint48);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The epoch start of the given epoch.|


### setEpochDuration

Sets the epoch duration.

The new duration will be "committed" only in the next epoch.
The caller must have the needed permission.


```solidity
function setEpochDuration(uint48 epochDuration) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The epoch duration.|


## Events
### InitEpochDuration
Emitted during the initialization of the EpochManager contract.


```solidity
event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The epoch duration.|
|`epochDurationTimestamp`|`uint48`|The initial epoch duration timestamp.|

### SetEpochDuration
Emitted when the epoch duration is set.

The new duration will be "committed" only in the next epoch.


```solidity
event SetEpochDuration(uint48 epochDuration);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The epoch duration.|

## Errors
### EpochManager_InvalidEpochDuration
Reverts when the epoch duration is zero.


```solidity
error EpochManager_InvalidEpochDuration();
```

### EpochManager_InvalidEpochDurationTimestamp
Reverts when the initial epoch duration timestamp is less than the current timestamp.


```solidity
error EpochManager_InvalidEpochDurationTimestamp();
```

### EpochManager_TooOldTimestamp
Reverts when the timestamp is too old.


```solidity
error EpochManager_TooOldTimestamp();
```

## Structs
### EpochManagerStorage
The storage of the EpochManager contract.

**Note:**
storage-location: erc7201:symbiotic.storage.EpochManager


```solidity
struct EpochManagerStorage {
    Checkpoints.Trace208 _epochDurationDataByTimestamp;
    Checkpoints.Trace208 _epochDurationDataByIndex;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_epochDurationDataByTimestamp`|`Checkpoints.Trace208`|The epoch duration data checkpointed by timestamps.|
|`_epochDurationDataByIndex`|`Checkpoints.Trace208`|The epoch duration data checkpointed by epoch indexes.|

### EpochManagerInitParams
The parameters for the initialization of the EpochManager contract.


```solidity
struct EpochManagerInitParams {
    uint48 epochDuration;
    uint48 epochDurationTimestamp;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The epoch duration.|
|`epochDurationTimestamp`|`uint48`|The initial epoch duration timestamp.|

