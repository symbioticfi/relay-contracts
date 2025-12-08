# IMultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/378b3fa543dbcf48fbf7694e797030129cda42ef/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)

**Inherits:**
[IVotingPowerProvider](/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

**Title:**
IMultiToken

Interface for the MultiToken contract.


## Functions
### registerToken

Registers the token.

The caller must have the needed permission.


```solidity
function registerToken(address token) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The address of the token.|


### unregisterToken

Unregisters the token.

The caller must have the needed permission.


```solidity
function unregisterToken(address token) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The address of the token.|


