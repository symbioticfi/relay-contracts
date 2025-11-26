# InputNormalizer
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3555af95a3dd521f0c0f40867fec8f48136f728e/src/libraries/utils/InputNormalizer.sol)

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

