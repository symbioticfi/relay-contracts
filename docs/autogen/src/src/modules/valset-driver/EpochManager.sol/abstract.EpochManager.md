# EpochManager
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3555af95a3dd521f0c0f40867fec8f48136f728e/src/modules/valset-driver/EpochManager.sol)

**Inherits:**
[PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), [IEpochManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/valset-driver/IEpochManager.sol/interface.IEpochManager.md)

Contract for managing the epochs state machine.


## State Variables
### EpochManagerStorageLocation

```solidity
bytes32 private constant EpochManagerStorageLocation =
    0xab930e9b836b4d72502da14061937ab080936446173403910135ea983863d400
```


## Functions
### _getEpochManagerStorage


```solidity
function _getEpochManagerStorage() internal pure returns (EpochManagerStorage storage $);
```

### __EpochManager_init


```solidity
function __EpochManager_init(EpochManagerInitParams memory initParams) internal virtual onlyInitializing;
```

### getCurrentEpoch

Returns the current epoch.


```solidity
function getCurrentEpoch() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The current epoch.|


### getCurrentEpochDuration

Returns the current epoch duration.


```solidity
function getCurrentEpochDuration() public view virtual returns (uint48 epochDuration);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The current epoch duration.|


### getCurrentEpochStart

Returns the current epoch start.


```solidity
function getCurrentEpochStart() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The current epoch start.|


### getNextEpoch

Returns the next epoch.


```solidity
function getNextEpoch() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The next epoch.|


### getNextEpochDuration

Returns the next epoch duration.


```solidity
function getNextEpochDuration() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The next epoch duration.|


### getNextEpochStart

Returns the next epoch start.


```solidity
function getNextEpochStart() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The next epoch start.|


### getEpochIndex

Returns the epoch index at the given timestamp.


```solidity
function getEpochIndex(uint48 timestamp) public view virtual returns (uint48);
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
function getEpochDuration(uint48 epoch) public view virtual returns (uint48 epochDuration);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The epoch duration of the given epoch.|


### getEpochStart

Returns the epoch start of the given epoch.


```solidity
function getEpochStart(uint48 epoch) public view virtual returns (uint48);
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
function setEpochDuration(uint48 epochDuration) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The epoch duration.|


### _setEpochDuration


```solidity
function _setEpochDuration(uint48 epochDuration) internal virtual;
```

### _setEpochDuration


```solidity
function _setEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex)
    internal
    virtual;
```

### _getEpochDurationDataByTimestamp


```solidity
function _getEpochDurationDataByTimestamp(uint48 timestamp) internal view virtual returns (uint48, uint48, uint48);
```

### _getEpochDurationDataByIndex


```solidity
function _getEpochDurationDataByIndex(uint48 index) internal view virtual returns (uint48, uint48, uint48);
```

### _getCurrentEpochDurationData


```solidity
function _getCurrentEpochDurationData() internal view virtual returns (uint48, uint48, uint48);
```

### _getFirstEpochDurationData


```solidity
function _getFirstEpochDurationData() internal view virtual returns (uint48, uint48, uint48);
```

### _serializeEpochDurationData


```solidity
function _serializeEpochDurationData(uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex)
    internal
    pure
    virtual
    returns (uint208);
```

### _deserializeEpochDurationData


```solidity
function _deserializeEpochDurationData(uint208 epochDurationData)
    internal
    pure
    virtual
    returns (uint48, uint48, uint48);
```

### _getCurrentValue


```solidity
function _getCurrentValue(Checkpoints.Trace208 storage trace, uint48 currentTimepoint)
    internal
    view
    virtual
    returns (uint208);
```

