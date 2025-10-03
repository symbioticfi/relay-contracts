# MultiToken
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/modules/voting-power/extensions/MultiToken.sol)

**Inherits:**
[VotingPowerProvider](/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IMultiToken](/src/interfaces/modules/voting-power/extensions/IMultiToken.sol/interface.IMultiToken.md)

Contract for registering and unregistering multiple tokens.


## Functions
### __MultiToken_init


```solidity
function __MultiToken_init() internal virtual onlyInitializing;
```

### registerToken

Registers the token.

*The caller must have the needed permission.*


```solidity
function registerToken(
    address token
) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The address of the token.|


### unregisterToken

Unregisters the token.

*The caller must have the needed permission.*


```solidity
function unregisterToken(
    address token
) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The address of the token.|


