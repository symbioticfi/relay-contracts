# IOperatorsBlacklist
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/8d840e69f50494357ea5358debcd4c2abd1b4f2b/src/interfaces/modules/voting-power/extensions/IOperatorsBlacklist.sol)


## Functions
### isOperatorBlacklisted

Returns the blacklist status of the operator.


```solidity
function isOperatorBlacklisted(address operator) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The blacklist status of the operator.|


### blacklistOperator

Blacklists the operator.

The caller must have the needed permission.
The operator will be unregistered if currently registered.


```solidity
function blacklistOperator(address operator) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


### unblacklistOperator

Unblacklists the operator.

The caller must have the needed permission.


```solidity
function unblacklistOperator(address operator) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


## Events
### BlacklistOperator
Emitted when the operator is blacklisted.


```solidity
event BlacklistOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

### UnblacklistOperator
Emitted when the operator is unblacklisted.


```solidity
event UnblacklistOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

## Errors
### OperatorsBlacklist_OperatorNotBlacklisted
Reverts when the operator is not blacklisted.


```solidity
error OperatorsBlacklist_OperatorNotBlacklisted();
```

### OperatorsBlacklist_OperatorBlacklisted
Reverts when the operator is already blacklisted.


```solidity
error OperatorsBlacklist_OperatorBlacklisted();
```

## Structs
### OperatorsBlacklistStorage
The storage of the OperatorsBlacklist contract.

**Note:**
storage-location: erc7201:symbiotic.storage.OperatorsBlacklist


```solidity
struct OperatorsBlacklistStorage {
    mapping(address operator => bool value) _blacklisted;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_blacklisted`|`mapping(address operator => bool value)`|The mapping from the operator to the blacklisted operator status.|

