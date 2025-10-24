# OperatorsBlacklist
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/a628ce262ee9e6c40296d23589814df8e1ae8606/src/modules/voting-power/extensions/OperatorsBlacklist.sol)

**Inherits:**
[VotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IOperatorsBlacklist](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/IOperatorsBlacklist.sol/interface.IOperatorsBlacklist.md)

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

