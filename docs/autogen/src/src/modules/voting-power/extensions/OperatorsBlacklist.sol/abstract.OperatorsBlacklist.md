# OperatorsBlacklist
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/4bfd3b425b355bf68d0d4060c9b82af6e94e8c7e/src/modules/voting-power/extensions/OperatorsBlacklist.sol)

**Inherits:**
[VotingPowerProvider](/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IOperatorsBlacklist](/src/interfaces/modules/voting-power/extensions/IOperatorsBlacklist.sol/interface.IOperatorsBlacklist.md)

**Title:**
OperatorsBlacklist

Contract for blacklisting operators.


## State Variables
### OperatorsBlacklistStorageLocation

```solidity
bytes32 private constant OperatorsBlacklistStorageLocation =
    0x23ffaefb5f6b29c7a77ac2a8c6e8b7a8cb63a59ee84629217d13308576dcc800
```


## Functions
### _getOperatorsBlacklistStorage


```solidity
function _getOperatorsBlacklistStorage() internal pure returns (OperatorsBlacklistStorage storage $);
```

### __OperatorsBlacklist_init


```solidity
function __OperatorsBlacklist_init() internal virtual onlyInitializing;
```

### isOperatorBlacklisted

Returns the blacklist status of the operator.


```solidity
function isOperatorBlacklisted(address operator) public view virtual returns (bool);
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
function blacklistOperator(address operator) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


### unblacklistOperator

Unblacklists the operator.

The caller must have the needed permission.


```solidity
function unblacklistOperator(address operator) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|


### _registerOperatorImpl


```solidity
function _registerOperatorImpl(address operator) internal virtual override;
```

