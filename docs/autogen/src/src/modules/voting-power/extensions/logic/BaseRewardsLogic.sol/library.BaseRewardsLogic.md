# BaseRewardsLogic
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9853e60a660dc25d05a02ef98e2b218dd40efcc4/src/modules/voting-power/extensions/logic/BaseRewardsLogic.sol)

Library with bindings for distributing rewards to stakers and operators.


## Functions
### distributeStakerRewards

Distributes staker rewards.

The funds should be transferred to this contract separately before the call.


```solidity
function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes memory data) public;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`stakerRewards`|`address`|The address of the staker rewards contract.|
|`token`|`address`|The address of the token to distribute.|
|`amount`|`uint256`|The amount of the token to distribute.|
|`data`|`bytes`|The data to pass to the staker rewards contract.|


### distributeOperatorRewards

Distributes operator rewards.

The funds should be transferred to this contract separately before the call.


```solidity
function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) public;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operatorRewards`|`address`|The address of the operator rewards contract.|
|`token`|`address`|The address of the token to distribute.|
|`amount`|`uint256`|The amount of the token to distribute.|
|`root`|`bytes32`|The root of the distribution Merkle tree.|


