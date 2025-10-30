# BaseRewards
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/70dc1ae21bdebf08e2f01246a42e31aee6a1c39d/src/modules/voting-power/extensions/BaseRewards.sol)

**Inherits:**
[VotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IBaseRewards](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/IBaseRewards.sol/interface.IBaseRewards.md)

Base contract for distributing rewards to stakers and operators.


## State Variables
### BaseRewardsStorageLocation

```solidity
bytes32 private constant BaseRewardsStorageLocation =
    0xbda599e6417b60ef01d2592ea6468e27d9dc233383dcd1f33c49128d08d88b00
```


## Functions
### onlyRewarder


```solidity
modifier onlyRewarder() ;
```

### _checkRewarder


```solidity
function _checkRewarder() internal view virtual;
```

### _getBaseRewardsStorage


```solidity
function _getBaseRewardsStorage() internal pure returns (IBaseRewards.BaseRewardsStorage storage $);
```

### __BaseRewards_init


```solidity
function __BaseRewards_init(BaseRewardsInitParams memory initParams) internal virtual onlyInitializing;
```

### getRewarder

Returns the address of the rewarder.


```solidity
function getRewarder() public view virtual returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the rewarder.|


### distributeStakerRewards

Distributes the staker rewards.

Only the rewarder can call this function.
The funds should be transferred to this contract separately before the call.


```solidity
function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes memory data)
    public
    virtual;
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
function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root)
    public
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operatorRewards`|`address`|The address of the operator rewards.|
|`token`|`address`|The address of the token.|
|`amount`|`uint256`|The amount of the token.|
|`root`|`bytes32`|The Merkle root of the distribution.|


### setRewarder

Sets the rewarder.

The caller must have the needed permission.


```solidity
function setRewarder(address rewarder) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rewarder`|`address`|The address of the rewarder.|


### _setRewarder


```solidity
function _setRewarder(address rewarder) internal virtual;
```

