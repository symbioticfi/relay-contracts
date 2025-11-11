# EqualStakeVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/f15b7f1298f3e89ef5f17b3ef10b20d2dc6845d4/src/modules/voting-power/common/voting-power-calc/EqualStakeVPCalc.sol)

**Inherits:**
[VotingPowerCalcManager](/Users/sergey/Projects/Symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/base/VotingPowerCalcManager.sol/abstract.VotingPowerCalcManager.md), [IEqualStakeVPCalc](/Users/sergey/Projects/Symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/common/voting-power-calc/IEqualStakeVPCalc.sol/interface.IEqualStakeVPCalc.md)

Contract for calculating the voting power, making it equal to the stake.


## Functions
### __EqualStakeVPCalc_init


```solidity
function __EqualStakeVPCalc_init() internal virtual onlyInitializing;
```

### stakeToVotingPowerAt

Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.


```solidity
function stakeToVotingPowerAt(
    address, /* vault */
    uint256 stake,
    bytes memory, /* extraData */
    uint48 /* timestamp */
)
    public
    view
    virtual
    override
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`||
|`stake`|`uint256`|The stake.|
|`<none>`|`bytes`||
|`<none>`|`uint48`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.|


### stakeToVotingPower

Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault.


```solidity
function stakeToVotingPower(
    address, /* vault */
    uint256 stake,
    bytes memory /* extraData */
)
    public
    view
    virtual
    override
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`||
|`stake`|`uint256`|The stake.|
|`<none>`|`bytes`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The voting power given a `stake` amount of `vault`'s collateral at the certain vault.|


