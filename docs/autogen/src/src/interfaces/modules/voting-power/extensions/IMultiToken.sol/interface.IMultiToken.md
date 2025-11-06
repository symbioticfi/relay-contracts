# IMultiToken
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1e5359cf6070a0b4aae5d36e84302fa6de3a57c7/src/interfaces/modules/voting-power/extensions/IMultiToken.sol)

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


