# IWeightedTokensVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/35b4e6e0fb5f7d02cf4e232e387f5f2293cd8da7/src/interfaces/modules/voting-power/common/voting-power-calc/IWeightedTokensVPCalc.sol)

Interface for the WeightedTokensVPCalc contract.


## Functions
### getTokenWeightAt

Returns the weight for a token at a given timestamp.

Returns 1e12 if the weight wasn't explicitly set yet.
Can return non-zero weight for unregistered tokens.


```solidity
function getTokenWeightAt(address token, uint48 timestamp) external view returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The weight.|


### getTokenWeight

Returns the weight for a token.

Returns 1e12 if the weight wasn't explicitly set yet.
Can return non-zero weight for unregistered tokens.


```solidity
function getTokenWeight(address token) external view returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The weight.|


### setTokenWeight

Sets the weight for a token.


```solidity
function setTokenWeight(address token, uint208 weight) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`weight`|`uint208`|The weight.|


## Events
### SetTokenWeight
Emitted when the weight for a token is set.


```solidity
event SetTokenWeight(address indexed token, uint208 weight);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`weight`|`uint208`|The weight.|

## Errors
### WeightedTokensVPCalc_TooLargeWeight
Reverts when the weight is too large.


```solidity
error WeightedTokensVPCalc_TooLargeWeight();
```

## Structs
### WeightedTokensVPCalcStorage
The storage of the WeightedTokensVPCalc contract.


```solidity
struct WeightedTokensVPCalcStorage {
    mapping(address token => Checkpoints.Trace208 weight) _tokenWeight;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_tokenWeight`|`mapping(address token => Checkpoints.Trace208 weight)`|The weight for each token.|

