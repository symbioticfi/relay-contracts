# VotingPowerCalcManager
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1c9bc3270564dc748a583cc328831cb866937b71/src/modules/voting-power/base/VotingPowerCalcManager.sol)

**Inherits:**
Initializable, [IVotingPowerCalcManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/base/IVotingPowerCalcManager.sol/interface.IVotingPowerCalcManager.md)

Base contract for voting power calculations.


## Functions
### stakeToVotingPowerAt

Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.


```solidity
function stakeToVotingPowerAt(address vault, uint256 stake, bytes memory extraData, uint48 timestamp)
    public
    view
    virtual
    returns (uint256 power);
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
|`power`|`uint256`|The voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.|


### stakeToVotingPower

Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault.


```solidity
function stakeToVotingPower(address vault, uint256 stake, bytes memory extraData)
    public
    view
    virtual
    returns (uint256 power);
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
|`power`|`uint256`|The voting power given a `stake` amount of `vault`'s collateral at the certain vault.|


