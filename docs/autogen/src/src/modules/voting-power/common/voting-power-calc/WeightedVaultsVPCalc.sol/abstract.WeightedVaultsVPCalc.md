# WeightedVaultsVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/8d840e69f50494357ea5358debcd4c2abd1b4f2b/src/modules/voting-power/common/voting-power-calc/WeightedVaultsVPCalc.sol)

**Inherits:**
[EqualStakeVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/common/voting-power-calc/EqualStakeVPCalc.sol/abstract.EqualStakeVPCalc.md), [PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), [IWeightedVaultsVPCalc](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/common/voting-power-calc/IWeightedVaultsVPCalc.sol/interface.IWeightedVaultsVPCalc.md)

Contract for calculating the voting power, weighting the vaults.


## State Variables
### DEFAULT_VAULT_WEIGHT

```solidity
uint208 internal constant DEFAULT_VAULT_WEIGHT = 1e4
```


### MAX_VAULT_WEIGHT_SCALE

```solidity
uint208 internal constant MAX_VAULT_WEIGHT_SCALE = DEFAULT_VAULT_WEIGHT * DEFAULT_VAULT_WEIGHT
```


### WeightedVaultsVPCalcStorageLocation

```solidity
bytes32 private constant WeightedVaultsVPCalcStorageLocation =
    0x939e246f03c984a4a087feb13b6dd8d9a00ff873e1061be489800f8d9c2cbf00
```


## Functions
### _getWeightedVaultsVPCalcStorage


```solidity
function _getWeightedVaultsVPCalcStorage() internal pure returns (WeightedVaultsVPCalcStorage storage $);
```

### __WeightedVaultsVPCalc_init


```solidity
function __WeightedVaultsVPCalc_init() internal virtual onlyInitializing;
```

### getVaultWeightAt

Returns the weight for a vault at a given timestamp.

Returns 1e4 if the weight wasn't explicitly set yet.
Can return non-zero weight for unregistered vaults.


```solidity
function getVaultWeightAt(address vault, uint48 timestamp) public view virtual returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The weight.|


### getVaultWeight

Returns the weight for a vault.

Returns 1e4 if the weight wasn't explicitly set yet.
Can return non-zero weight for unregistered vaults.


```solidity
function getVaultWeight(address vault) public view virtual returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|

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


### setVaultWeight

Sets the weight for a vault.


```solidity
function setVaultWeight(address vault, uint208 weight) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|
|`weight`|`uint208`|The weight.|


### _setVaultWeight


```solidity
function _setVaultWeight(address vault, uint208 weight) internal virtual;
```

