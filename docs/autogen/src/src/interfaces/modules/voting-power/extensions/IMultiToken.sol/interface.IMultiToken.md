# IMultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/48c012da16df2d3fd1ccae03176b04d180fbd59f/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)

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


