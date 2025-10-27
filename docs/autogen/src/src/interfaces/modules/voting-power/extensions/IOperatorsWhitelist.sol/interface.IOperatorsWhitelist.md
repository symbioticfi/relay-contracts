# IOperatorsWhitelist
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3e174a9e69da2b5866055084b62455d579b3d0af/src/interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol)

Interface for the OperatorsWhitelist contract.


## Functions
### isWhitelistEnabled

Returns the whitelist status.


```solidity
function isWhitelistEnabled() external view returns (bool);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The whitelist status.|


### isOperatorWhitelisted

Returns the whitelist status of the operator.


```solidity
function isOperatorWhitelisted(address operator) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The whitelist status of the operator.|


### setWhitelistStatus

Sets the whitelist status.

The caller must have the needed permission.


```solidity
function setWhitelistStatus(bool status) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the whitelist.|


### whitelistOperator

Whitelists the operator.

The caller must have the needed permission.


```solidity
function whitelistOperator(address operator) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


### unwhitelistOperator

Unwhitelists the operator.

The caller must have the needed permission.
The operator will be unregistered if currently registered and the whitelist is enabled.


```solidity
function unwhitelistOperator(address operator) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


## Events
### SetWhitelistStatus
Emitted when the whitelist status is set.


```solidity
event SetWhitelistStatus(bool status);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the whitelist.|

### WhitelistOperator
Emitted when the operator is whitelisted.


```solidity
event WhitelistOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

### UnwhitelistOperator
Emitted when the operator is unwhitelisted.


```solidity
event UnwhitelistOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

## Errors
### OperatorsWhitelist_StatusAlreadySet
Reverts when the whitelist status is already set.


```solidity
error OperatorsWhitelist_StatusAlreadySet();
```

### OperatorsWhitelist_OperatorNotWhitelisted
Reverts when the operator is not whitelisted.


```solidity
error OperatorsWhitelist_OperatorNotWhitelisted();
```

### OperatorsWhitelist_OperatorWhitelisted
Reverts when the operator is already whitelisted.


```solidity
error OperatorsWhitelist_OperatorWhitelisted();
```

## Structs
### OperatorsWhitelistStorage
The storage of the OperatorsWhitelist contract.

**Note:**
storage-location: erc7201:symbiotic.storage.OperatorsWhitelist


```solidity
struct OperatorsWhitelistStorage {
    mapping(address operator => bool value) _whitelisted;
    bool _isWhitelistEnabled;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_whitelisted`|`mapping(address operator => bool value)`|The mapping from the operator to the whitelisted operator status.|
|`_isWhitelistEnabled`|`bool`|The status of the whitelist.|

### OperatorsWhitelistInitParams
The parameters for the initialization of the OperatorsWhitelist contract.


```solidity
struct OperatorsWhitelistInitParams {
    bool isWhitelistEnabled;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`isWhitelistEnabled`|`bool`|The status of the whitelist.|

