# OperatorsWhitelist
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/aa502a4be47c86d613c9f5ee2cc50ded6e2cee52/src/modules/voting-power/extensions/OperatorsWhitelist.sol)

**Inherits:**
[VotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IOperatorsWhitelist](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol/interface.IOperatorsWhitelist.md)

Contract for whitelisting operators.


## State Variables
### OperatorsWhitelistStorageLocation

```solidity
bytes32 private constant OperatorsWhitelistStorageLocation =
    0x3fa7d7e58a4c604e915cc85c236f89892f2e36ec13dff506efa6b5ea5fafeb00
```


## Functions
### _getOperatorsWhitelistStorage


```solidity
function _getOperatorsWhitelistStorage() internal pure returns (OperatorsWhitelistStorage storage $);
```

### __OperatorsWhitelist_init


```solidity
function __OperatorsWhitelist_init(OperatorsWhitelistInitParams memory initParams)
    internal
    virtual
    onlyInitializing;
```

### isWhitelistEnabled

Returns the whitelist status.


```solidity
function isWhitelistEnabled() public view virtual returns (bool);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The whitelist status.|


### isOperatorWhitelisted

Returns the whitelist status of the operator.


```solidity
function isOperatorWhitelisted(address operator) public view virtual returns (bool);
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
function setWhitelistStatus(bool status) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the whitelist.|


### whitelistOperator

Whitelists the operator.

The caller must have the needed permission.


```solidity
function whitelistOperator(address operator) public virtual checkPermission;
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
function unwhitelistOperator(address operator) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


### _registerOperatorImpl


```solidity
function _registerOperatorImpl(address operator) internal virtual override;
```

### _setWhitelistStatus


```solidity
function _setWhitelistStatus(bool status) internal virtual;
```

