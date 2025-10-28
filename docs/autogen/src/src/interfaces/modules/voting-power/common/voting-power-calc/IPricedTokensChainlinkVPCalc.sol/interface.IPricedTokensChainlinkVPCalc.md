# IPricedTokensChainlinkVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/79659f66a6349a5ecb86c9437ba656cf1fdf5fe5/src/interfaces/modules/voting-power/common/voting-power-calc/IPricedTokensChainlinkVPCalc.sol)

Interface for the PricedTokensChainlinkVPCalc contract.


## Functions
### getTokenHopsAt

Returns the price conversion hops for a token at a given timestamp.


```solidity
function getTokenHopsAt(address token, uint48 timestamp)
    external
    view
    returns (address[2] memory, bool[2] memory, uint48[2] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[2]`|The price conversion hops (price aggregators, invert flags, staleness durations).|
|`<none>`|`bool[2]`||
|`<none>`|`uint48[2]`||


### getTokenHops

Returns the price conversion hops for a token.


```solidity
function getTokenHops(address token) external view returns (address[2] memory, bool[2] memory, uint48[2] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[2]`|The price conversion hops (price aggregators, invert flags, staleness durations).|
|`<none>`|`bool[2]`||
|`<none>`|`uint48[2]`||


### getTokenPriceAt

Returns the price for a token at a given timestamp.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getTokenPriceAt(address token, uint48 timestamp) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### getTokenPrice

Returns the price for a token.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getTokenPrice(address token) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### setTokenHops

Sets the price conversion hops for a token.


```solidity
function setTokenHops(
    address token,
    address[2] memory aggregators,
    bool[2] memory inverts,
    uint48[2] memory stalenessDurations
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`aggregators`|`address[2]`|The price aggregators.|
|`inverts`|`bool[2]`|If to invert the fetched prices.|
|`stalenessDurations`|`uint48[2]`|The staleness durations (if too much time passed since the last update).|


## Events
### SetTokenHops
Emitted when the price conversion hops are set for a token.


```solidity
event SetTokenHops(address indexed token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`aggregators`|`address[2]`|The price aggregators.|
|`inverts`|`bool[2]`|If to invert the fetched prices.|
|`stalenessDurations`|`uint48[2]`|The staleness durations (if too much time passed since the last update).|

## Errors
### PricedTokensChainlinkVPCalc_InvalidAggregator
Reverts when the aggregator is zero address.


```solidity
error PricedTokensChainlinkVPCalc_InvalidAggregator();
```

## Structs
### PricedTokensChainlinkVPCalcStorage
The storage of the PricedTokensChainlinkVPCalc contract.


```solidity
struct PricedTokensChainlinkVPCalcStorage {
    mapping(address token => Checkpoints.Trace512 hops) _tokenHops;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_tokenHops`|`mapping(address token => Checkpoints.Trace512 hops)`|The price conversion hops for each token.|

