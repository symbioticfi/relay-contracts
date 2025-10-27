# ChainlinkPriceFeed
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/aa502a4be47c86d613c9f5ee2cc50ded6e2cee52/src/modules/voting-power/common/voting-power-calc/libraries/ChainlinkPriceFeed.sol)

Library for fetching prices from Chainlink in a historical manner.

It supports arbitrary aggregators' decimals, an arbitrary number of aggregator hops, and a possibility to invert prices.
It supports most of Chainlink's aggregators through the whole history except the oldest ones not supporting `getRoundData()`.


## State Variables
### PHASE_OFFSET
The offset for the phase in the roundId.


```solidity
uint256 internal constant PHASE_OFFSET = 64
```


### BASE_DECIMALS
The number of decimals to normalize the price to.


```solidity
uint8 internal constant BASE_DECIMALS = 18
```


## Functions
### getPriceAt

Returns the price at a given timestamp using one or two hops.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getPriceAt(
    address[2] memory aggregators,
    uint48 timestamp,
    bool[2] memory inverts,
    uint48[2] memory stalenessDurations
) public view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregators`|`address[2]`|The price aggregators.|
|`timestamp`|`uint48`|The timestamp.|
|`inverts`|`bool[2]`|If to invert the fetched prices.|
|`stalenessDurations`|`uint48[2]`|The staleness durations (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### getPriceAt

Returns the price at a given timestamp using one or more hops.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getPriceAt(
    address[] memory aggregators,
    uint48 timestamp,
    bool[] memory inverts,
    uint48[] memory stalenessDurations
) public view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregators`|`address[]`|The price aggregators.|
|`timestamp`|`uint48`|The timestamp.|
|`inverts`|`bool[]`|If to invert the fetched prices.|
|`stalenessDurations`|`uint48[]`|The staleness durations (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### getPriceAt

Returns the price at a given timestamp.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getPriceAt(address aggregator, uint48 timestamp, bool invert, uint48 stalenessDuration)
    public
    view
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregator`|`address`|The price aggregator.|
|`timestamp`|`uint48`|The timestamp.|
|`invert`|`bool`|If to invert the fetched price.|
|`stalenessDuration`|`uint48`|The staleness duration (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### getPriceDataAt

Returns the price data at a given timestamp.

The answer is normalized to the 18 decimals.


```solidity
function getPriceDataAt(address aggregator, uint48 timestamp, bool invert, uint48 stalenessDuration)
    public
    view
    returns (bool success, RoundData memory roundData);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregator`|`address`|The price aggregator.|
|`timestamp`|`uint48`|The timestamp.|
|`invert`|`bool`|If to invert the fetched price.|
|`stalenessDuration`|`uint48`|The staleness duration (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`success`|`bool`|If the data is available and not stale.|
|`roundData`|`RoundData`|The round data.|


### getRoundDataAt

Returns the round data at a given timestamp.


```solidity
function getRoundDataAt(address aggregator, uint48 timestamp)
    public
    view
    returns (bool, RoundData memory roundData);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregator`|`address`|The price aggregator.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|success If the data is available.|
|`roundData`|`RoundData`|The round data.|


### getRoundData

Returns the round data at a given roundId.


```solidity
function getRoundData(address aggregator, uint80 roundId) public view returns (bool, RoundData memory roundData);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregator`|`address`|The price aggregator.|
|`roundId`|`uint80`|The roundId.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|success If the data is available.|
|`roundData`|`RoundData`|The round data.|


### getLatestPrice

Returns the latest price using one or two hops.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getLatestPrice(address[2] memory aggregators, bool[2] memory inverts, uint48[2] memory stalenessDurations)
    public
    view
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregators`|`address[2]`|The price aggregators.|
|`inverts`|`bool[2]`|If to invert the fetched prices.|
|`stalenessDurations`|`uint48[2]`|The staleness durations (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### getLatestPrice

Returns the latest price using one or more hops.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getLatestPrice(address[] memory aggregators, bool[] memory inverts, uint48[] memory stalenessDurations)
    public
    view
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregators`|`address[]`|The price aggregators.|
|`inverts`|`bool[]`|If to invert the fetched prices.|
|`stalenessDurations`|`uint48[]`|The staleness durations (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### getLatestPrice

Returns the latest price.

Returns zero if the data is stale or unavailable.
The price is normalized to the 18 decimals.


```solidity
function getLatestPrice(address aggregator, bool invert, uint48 stalenessDuration) public view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregator`|`address`|The price aggregator.|
|`invert`|`bool`|If to invert the fetched price.|
|`stalenessDuration`|`uint48`|The staleness duration (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### getLatestPriceData

Returns the latest price data.

The answer is normalized to the 18 decimals.


```solidity
function getLatestPriceData(address aggregator, bool invert, uint48 stalenessDuration)
    public
    view
    returns (bool success, RoundData memory roundData);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregator`|`address`|The price aggregator.|
|`invert`|`bool`|If to invert the fetched price.|
|`stalenessDuration`|`uint48`|The staleness duration (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`success`|`bool`|If the data is available and not stale.|
|`roundData`|`RoundData`|The round data.|


### getLatestRoundData

Returns the latest round data.


```solidity
function getLatestRoundData(address aggregator) public view returns (bool, RoundData memory roundData);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`aggregator`|`address`|The price aggregator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|success If the data is available.|
|`roundData`|`RoundData`|The round data.|


### isStale

Returns if the round data is stale.


```solidity
function isStale(uint48 timestamp, RoundData memory roundData, uint48 stalenessDuration)
    public
    pure
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|
|`roundData`|`RoundData`|The round data.|
|`stalenessDuration`|`uint48`|The staleness duration (if too much time passed since the last update).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the round data is stale.|


### serializeIds


```solidity
function serializeIds(uint16 phase, uint64 originalId) public pure returns (uint80);
```

### deserializeIds


```solidity
function deserializeIds(uint80 roundId) public pure returns (uint16, uint64);
```

### toDynamicArrays


```solidity
function toDynamicArrays(
    address[2] memory aggregators,
    bool[2] memory inverts,
    uint48[2] memory stalenessDurations
)
    public
    pure
    returns (
        address[] memory dynamicAggregators,
        bool[] memory dynamicInverts,
        uint48[] memory dynamicStalenessDurations
    );
```

## Errors
### ZeroLength
Reverts when the length is zero.


```solidity
error ZeroLength();
```

### NotEqualLength
Reverts when the lengths are not equal.


```solidity
error NotEqualLength();
```

## Structs
### RoundData
The data for a round.


```solidity
struct RoundData {
    uint80 roundId;
    uint256 answer;
    uint256 startedAt;
    uint256 updatedAt;
    uint80 answeredInRound;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`roundId`|`uint80`|The roundId (a concatenation of the phase and the original id).|
|`answer`|`uint256`|The price.|
|`startedAt`|`uint256`|The startedAt (deprecated).|
|`updatedAt`|`uint256`|The updatedAt (the timestamp when the round was updated).|
|`answeredInRound`|`uint80`|The answeredInRound (deprecated).|

