# NormalizedTokenDecimalsVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/70dc1ae21bdebf08e2f01246a42e31aee6a1c39d/src/modules/voting-power/common/voting-power-calc/NormalizedTokenDecimalsVPCalc.sol)

**Inherits:**
[EqualStakeVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/common/voting-power-calc/EqualStakeVPCalc.sol/abstract.EqualStakeVPCalc.md), [INormalizedTokenDecimalsVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/common/voting-power-calc/INormalizedTokenDecimalsVPCalc.sol/interface.INormalizedTokenDecimalsVPCalc.md)

Contract for calculating the voting power, normalizing the stakes in different tokens to the same decimals.


## State Variables
### BASE_DECIMALS

```solidity
uint8 internal constant BASE_DECIMALS = 18
```


## Functions
### __NormalizedTokenDecimalsVPCalc_init


```solidity
function __NormalizedTokenDecimalsVPCalc_init() internal virtual onlyInitializing;
```

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


### _getCollateral


```solidity
function _getCollateral(address vault) internal view virtual returns (address);
```

### _normalizeVaultTokenDecimals


```solidity
function _normalizeVaultTokenDecimals(address vault, uint256 votingPower) internal view virtual returns (uint256);
```

