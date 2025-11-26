# WeightedTokensVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1eb6435a6ea47694d41a093f5c846d932f6a2f2b/src/modules/voting-power/common/voting-power-calc/WeightedTokensVPCalc.sol)

**Inherits:**
[NormalizedTokenDecimalsVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/common/voting-power-calc/NormalizedTokenDecimalsVPCalc.sol/abstract.NormalizedTokenDecimalsVPCalc.md), [PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), [IWeightedTokensVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/common/voting-power-calc/IWeightedTokensVPCalc.sol/interface.IWeightedTokensVPCalc.md)

Contract for calculating the voting power, weighting the tokens.


## State Variables
### DEFAULT_TOKEN_WEIGHT

```solidity
uint208 internal constant DEFAULT_TOKEN_WEIGHT = 1e12
```


### MAX_TOKEN_WEIGHT_SCALE

```solidity
uint208 internal constant MAX_TOKEN_WEIGHT_SCALE = DEFAULT_TOKEN_WEIGHT * DEFAULT_TOKEN_WEIGHT
```


### WeightedTokensVPCalcStorageLocation

```solidity
bytes32 private constant WeightedTokensVPCalcStorageLocation =
    0xf5262741ca6f55e787f6eaf4de4fb0649de696baa9c333fb294f86e4baf7a100
```


## Functions
### _getWeightedTokensVPCalcStorage


```solidity
function _getWeightedTokensVPCalcStorage() internal pure returns (WeightedTokensVPCalcStorage storage $);
```

### __WeightedTokensVPCalc_init


```solidity
function __WeightedTokensVPCalc_init() internal virtual onlyInitializing;
```

### getTokenWeightAt

Returns the weight for a token at a given timestamp.

Returns 1e12 if the weight wasn't explicitly set yet.
Can return non-zero weight for unregistered tokens.


```solidity
function getTokenWeightAt(address token, uint48 timestamp) public view virtual returns (uint208);
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
function getTokenWeight(address token) public view virtual returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The weight.|


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


### setTokenWeight

Sets the weight for a token.


```solidity
function setTokenWeight(address token, uint208 weight) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`weight`|`uint208`|The weight.|


### _setTokenWeight


```solidity
function _setTokenWeight(address token, uint208 weight) internal virtual;
```

