# EqualStakeVPCalc
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/modules/voting-power/common/voting-power-calc/EqualStakeVPCalc.sol)

**Inherits:**
[VotingPowerCalcManager](/src/modules/voting-power/base/VotingPowerCalcManager.sol/abstract.VotingPowerCalcManager.md), [IEqualStakeVPCalc](/src/interfaces/modules/voting-power/common/voting-power-calc/IEqualStakeVPCalc.sol/interface.IEqualStakeVPCalc.md)

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
    address,
    uint256 stake,
    bytes memory,
    uint48
) public view virtual override returns (uint256);
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
function stakeToVotingPower(address, uint256 stake, bytes memory) public view virtual override returns (uint256);
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


