# Scaler
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/140d36e839baf722c6672300f13ab7489a8ea2bc/src/libraries/utils/Scaler.sol)

Library for scaling values between different decimals and inverting them.


## Functions
### scale

Scales a value given its decimals to the target decimals.


```solidity
function scale(uint256 value, uint8 decimals, uint8 targetDecimals) internal pure returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`value`|`uint256`|The value to scale.|
|`decimals`|`uint8`|The base decimals of the value.|
|`targetDecimals`|`uint8`|The target decimals.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The scaled value.|


### invert

Inverts a value given its decimals.

Reverts if the value is zero.


```solidity
function invert(uint256 value, uint8 decimals) internal pure returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`value`|`uint256`|The value to invert.|
|`decimals`|`uint8`|The base decimals of the value.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The inverted value.|


