# MultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/4bfd3b425b355bf68d0d4060c9b82af6e94e8c7e/src/modules/voting-power/extensions/MultiToken.sol)

**Inherits:**
[VotingPowerProvider](/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IMultiToken](/src/interfaces/modules/voting-power/extensions/IMultiToken.sol/interface.IMultiToken.md)

**Title:**
MultiToken

Contract for registering and unregistering multiple tokens.


## Functions
### __MultiToken_init


```solidity
function __MultiToken_init() internal virtual onlyInitializing;
```

### registerToken

Registers the token.

The caller must have the needed permission.


```solidity
function registerToken(address token) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The address of the token.|


### unregisterToken

Unregisters the token.

The caller must have the needed permission.


```solidity
function unregisterToken(address token) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The address of the token.|


