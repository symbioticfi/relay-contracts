# InputNormalizer
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/fe77da97c5078ce867ab7509d4925a7d24b41b38/src/libraries/utils/InputNormalizer.sol)

**Title:**
InputNormalizer

Library for normalizing input arrays to a given length.


## Functions
### normalize

Normalizes an array of bytes to a given length.


```solidity
function normalize(bytes[] memory arr, uint256 length) internal pure returns (bytes[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`arr`|`bytes[]`|The array of bytes.|
|`length`|`uint256`|The expected length of the array.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes[]`|The normalized array of bytes.|


### normalize

Normalizes an array of arrays of bytes to a given length.


```solidity
function normalize(bytes[][] memory arr, uint256 length) internal pure returns (bytes[][] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`arr`|`bytes[][]`|The array of arrays of bytes.|
|`length`|`uint256`|The expected length of the array.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes[][]`|The normalized array of arrays of bytes.|


## Errors
### InvalidLength
Reverts when the length of the input is not zero and not equal to the expected length.


```solidity
error InvalidLength();
```

