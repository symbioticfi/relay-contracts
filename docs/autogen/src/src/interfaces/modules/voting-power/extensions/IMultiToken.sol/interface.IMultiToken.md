# IMultiToken
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)


## Functions
### registerToken

Registers the token.

*The caller must have the needed permission.*


```solidity
function registerToken(
    address token
) external;
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
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The address of the token.|


