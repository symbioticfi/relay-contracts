# OperatorsJail
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/f15b7f1298f3e89ef5f17b3ef10b20d2dc6845d4/src/modules/voting-power/extensions/OperatorsJail.sol)

**Inherits:**
[VotingPowerProvider](/Users/sergey/Projects/Symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IOperatorsJail](/Users/sergey/Projects/Symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/IOperatorsJail.sol/interface.IOperatorsJail.md)

Contract for jailing (unregistering and not allowing to register) operators for a given duration.


## State Variables
### OperatorsJailStorageLocation

```solidity
bytes32 private constant OperatorsJailStorageLocation =
    0xcf19420dad377ef849f2ba5fafa7311a71756e09aee8adb231516efd3d2b7b00
```


## Functions
### _getOperatorsJailStorage


```solidity
function _getOperatorsJailStorage() internal pure returns (OperatorsJailStorage storage $);
```

### __OperatorsJail_init


```solidity
function __OperatorsJail_init() internal virtual onlyInitializing;
```

### isOperatorJailed

Returns the jail status of the operator.


```solidity
function isOperatorJailed(address operator) public view virtual returns (bool);
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
function getOperatorJailedUntil(address operator) public view virtual returns (uint48);
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
function jailOperator(address operator, uint48 duration) public virtual checkPermission;
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
function unjailOperator(address operator) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


### _registerOperatorImpl


```solidity
function _registerOperatorImpl(address operator) internal virtual override;
```

