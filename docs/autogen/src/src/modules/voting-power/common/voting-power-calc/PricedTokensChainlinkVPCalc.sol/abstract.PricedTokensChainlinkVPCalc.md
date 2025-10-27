# PricedTokensChainlinkVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9c2decd1cd56d3927487a3807080a922ba8b3a31/src/modules/voting-power/common/voting-power-calc/PricedTokensChainlinkVPCalc.sol)

**Inherits:**
[NormalizedTokenDecimalsVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/common/voting-power-calc/NormalizedTokenDecimalsVPCalc.sol/abstract.NormalizedTokenDecimalsVPCalc.md), [PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), [IPricedTokensChainlinkVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/common/voting-power-calc/IPricedTokensChainlinkVPCalc.sol/interface.IPricedTokensChainlinkVPCalc.md)

Contract for calculating the voting power, pricing the tokens using Chainlink.


## State Variables
### PricedTokensChainlinkVPCalcStorageLocation

```solidity
bytes32 private constant PricedTokensChainlinkVPCalcStorageLocation =
    0x3733a7bfa4de50ec8f69170bdfa9615f7ae85991d75509d95aa3fcefb58efe00
```


## Functions
### _getPricedTokensChainlinkVPCalcStorage


```solidity
function _getPricedTokensChainlinkVPCalcStorage()
    internal
    pure
    returns (PricedTokensChainlinkVPCalcStorage storage $);
```

### __PricedTokensChainlinkVPCalc_init


```solidity
function __PricedTokensChainlinkVPCalc_init() internal virtual onlyInitializing;
```

### getTokenHopsAt

Returns the price conversion hops for a token at a given timestamp.


```solidity
function getTokenHopsAt(address token, uint48 timestamp)
    public
    view
    virtual
    override
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
function getTokenHops(address token)
    public
    view
    virtual
    override
    returns (address[2] memory, bool[2] memory, uint48[2] memory);
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
function getTokenPriceAt(address token, uint48 timestamp) public view virtual override returns (uint256);
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
function getTokenPrice(address token) public view virtual override returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The price.|


### stakeToVotingPowerAt

Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.


```solidity
function stakeToVotingPowerAt(address vault, uint256 stake, bytes memory extraData, uint48 timestamp)
    public
    view
    virtual
    override
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|
|`stake`|`uint256`|The stake.|
|`extraData`|`bytes`|The extra data.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.|


### stakeToVotingPower

Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault.


```solidity
function stakeToVotingPower(address vault, uint256 stake, bytes memory extraData)
    public
    view
    virtual
    override
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|
|`stake`|`uint256`|The stake.|
|`extraData`|`bytes`|The extra data.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The voting power given a `stake` amount of `vault`'s collateral at the certain vault.|


### setTokenHops

Sets the price conversion hops for a token.


```solidity
function setTokenHops(
    address token,
    address[2] memory aggregators,
    bool[2] memory inverts,
    uint48[2] memory stalenessDurations
) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`aggregators`|`address[2]`|The price aggregators.|
|`inverts`|`bool[2]`|If to invert the fetched prices.|
|`stalenessDurations`|`uint48[2]`|The staleness durations (if too much time passed since the last update).|


### _setTokenHops


```solidity
function _setTokenHops(
    address token,
    address[2] memory aggregators,
    bool[2] memory inverts,
    uint48[2] memory stalenessDurations
) internal virtual;
```

### _serializeHop


```solidity
function _serializeHop(address aggregator, bool invert, uint48 stalenessDuration)
    internal
    pure
    virtual
    returns (uint256);
```

### _serializeHops


```solidity
function _serializeHops(address[2] memory aggregators, bool[2] memory inverts, uint48[2] memory stalenessDurations)
    internal
    pure
    virtual
    returns (uint256[2] memory hops);
```

### _deserializeHop


```solidity
function _deserializeHop(uint256 hop)
    internal
    pure
    virtual
    returns (address aggregator, bool invert, uint48 stalenessDuration);
```

### _deserializeHops


```solidity
function _deserializeHops(uint256[2] memory hops)
    internal
    pure
    virtual
    returns (address[2] memory aggregators, bool[2] memory inverts, uint48[2] memory stalenessDurations);
```

