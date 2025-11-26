# IOperatorsJail
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1995c1a184b888d15ac64e40eea29de97ad1d11a/src/interfaces/modules/voting-power/extensions/IOperatorsJail.sol)

**Inherits:**
[IVotingPowerProvider](/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

**Title:**
IOperatorsJail

Interface for the OperatorsJail contract.


## Functions
### isOperatorJailed

Returns the jail status of the operator.


```solidity
function isOperatorJailed(address operator) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The jail status of the operator.|


### getOperatorJailedUntil

Returns the timestamp the operator is jailed until.


```solidity
function getOperatorJailedUntil(address operator) external view returns (uint48);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The timestamp the operator is jailed until.|


### jailOperator

Jails the operator.

The caller must have the needed permission.
The operator will be unregistered if currently registered.
It is allowed only to extend the jail duration.


```solidity
function jailOperator(address operator, uint48 duration) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`duration`|`uint48`|The duration of the jail.|


### unjailOperator

Unjails the operator.

The caller must have the needed permission.


```solidity
function unjailOperator(address operator) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


## Events
### JailOperator
Emitted when the operator is jailed.


```solidity
event JailOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

### UnjailOperator
Emitted when the operator is forcefully unjailed.


```solidity
event UnjailOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

## Errors
### OperatorsJail_AlreadyJailed
Reverts when the operator is already jailed.


```solidity
error OperatorsJail_AlreadyJailed();
```

### OperatorsJail_InvalidDuration
Reverts when the duration is invalid.


```solidity
error OperatorsJail_InvalidDuration();
```

### OperatorsJail_OperatorJailed
Reverts when the operator is jailed.


```solidity
error OperatorsJail_OperatorJailed();
```

### OperatorsJail_OperatorNotJailed
Reverts when the operator is not jailed.


```solidity
error OperatorsJail_OperatorNotJailed();
```

## Structs
### OperatorsJailStorage
The storage of the OperatorsJail contract.

**Note:**
storage-location: erc7201:symbiotic.storage.OperatorsJail


```solidity
struct OperatorsJailStorage {
    mapping(address operator => uint48 timestamp) _jailedUntil;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_jailedUntil`|`mapping(address operator => uint48 timestamp)`|The mapping from the operator to the jailed until timestamp.|

