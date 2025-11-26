# IMultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3555af95a3dd521f0c0f40867fec8f48136f728e/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)

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


