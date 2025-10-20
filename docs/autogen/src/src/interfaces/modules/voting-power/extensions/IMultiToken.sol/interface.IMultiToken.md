# IMultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/7eb78caa6fd861b172d3fcd10e873a8e342caffb/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)


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


