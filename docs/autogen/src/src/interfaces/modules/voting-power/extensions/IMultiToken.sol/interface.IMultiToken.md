# IMultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1eb6435a6ea47694d41a093f5c846d932f6a2f2b/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)

**Inherits:**
[IVotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

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


