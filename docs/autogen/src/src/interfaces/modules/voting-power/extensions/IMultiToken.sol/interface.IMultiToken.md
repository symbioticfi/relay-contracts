# IMultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/35b4e6e0fb5f7d02cf4e232e387f5f2293cd8da7/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)

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


