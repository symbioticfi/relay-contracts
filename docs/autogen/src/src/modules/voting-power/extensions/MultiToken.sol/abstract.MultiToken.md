# MultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3e174a9e69da2b5866055084b62455d579b3d0af/src/modules/voting-power/extensions/MultiToken.sol)

**Inherits:**
[VotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IMultiToken](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/IMultiToken.sol/interface.IMultiToken.md)

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


