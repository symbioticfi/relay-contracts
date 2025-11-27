# IBaseRewards
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/63fb22c064d8c8e2964bdd71f2fa6145dbf5ad0e/src/interfaces/modules/voting-power/extensions/IBaseRewards.sol)

**Inherits:**
[IVotingPowerProvider](/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

**Title:**
IBaseRewards

Interface for the BaseRewards contract.


## Functions
### getRewarder

Returns the address of the rewarder.


```solidity
function getRewarder() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the rewarder.|


### setRewarder

Sets the rewarder.

The caller must have the needed permission.


```solidity
function setRewarder(address rewarder) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rewarder`|`address`|The address of the rewarder.|


### distributeStakerRewards

Distributes the staker rewards.

Only the rewarder can call this function.
The funds should be transferred to this contract separately before the call.


```solidity
function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes memory data) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`stakerRewards`|`address`|The address of the staker rewards.|
|`token`|`address`|The address of the token.|
|`amount`|`uint256`|The amount of the token.|
|`data`|`bytes`|The data (depends on the staker rewards implementation).|


### distributeOperatorRewards

Distributes the operator rewards.

Only the rewarder can call this function.
The funds should be transferred to this contract separately before the call.


```solidity
function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operatorRewards`|`address`|The address of the operator rewards.|
|`token`|`address`|The address of the token.|
|`amount`|`uint256`|The amount of the token.|
|`root`|`bytes32`|The Merkle root of the distribution.|


## Events
### SetRewarder
Emitted when the rewarder is set.


```solidity
event SetRewarder(address rewarder);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rewarder`|`address`|The address of the rewarder.|

### DistributeStakerRewards
Emitted when the staker rewards are distributed.


```solidity
event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`stakerRewards`|`address`|The address of the staker rewards.|
|`token`|`address`|The address of the token.|
|`amount`|`uint256`|The amount of the token.|
|`data`|`bytes`|The data (depends on the staker rewards implementation).|

### DistributeOperatorRewards
Emitted when the operator rewards are distributed.


```solidity
event DistributeOperatorRewards(
    address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root
);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operatorRewards`|`address`|The address of the operator rewards.|
|`token`|`address`|The address of the token.|
|`amount`|`uint256`|The amount of the token.|
|`root`|`bytes32`|The Merkle root of the distribution.|

## Errors
### BaseRewards_NotRewarder
Reverts when the caller is not the rewarder.


```solidity
error BaseRewards_NotRewarder();
```

## Structs
### BaseRewardsStorage
The storage of the BaseRewards contract.

**Note:**
storage-location: erc7201:symbiotic.storage.BaseRewards


```solidity
struct BaseRewardsStorage {
    address _rewarder;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_rewarder`|`address`|The address of the rewarder.|

### BaseRewardsInitParams
The parameters for the initialization of the BaseRewards contract.


```solidity
struct BaseRewardsInitParams {
    address rewarder;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`rewarder`|`address`|The address of the rewarder.|

