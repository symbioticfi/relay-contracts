# IWeightedVaultsVPCalc
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/35b4e6e0fb5f7d02cf4e232e387f5f2293cd8da7/src/interfaces/modules/voting-power/common/voting-power-calc/IWeightedVaultsVPCalc.sol)

Interface for the WeightedVaultsVPCalc contract.


## Functions
### getVaultWeightAt

Returns the weight for a vault at a given timestamp.

Returns 1e4 if the weight wasn't explicitly set yet.
Can return non-zero weight for unregistered vaults.


```solidity
function getVaultWeightAt(address vault, uint48 timestamp) external view returns (uint208);
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
function getVaultWeight(address vault) external view returns (uint208);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint208`|The weight.|


### setVaultWeight

Sets the weight for a vault.


```solidity
function setVaultWeight(address vault, uint208 weight) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|
|`weight`|`uint208`|The weight.|


## Events
### SetVaultWeight
Emitted when the weight for a vault is set.


```solidity
event SetVaultWeight(address indexed vault, uint208 weight);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The vault.|
|`weight`|`uint208`|The weight.|

## Errors
### WeightedVaultsVPCalc_TooLargeWeight
Reverts when the weight is too large.


```solidity
error WeightedVaultsVPCalc_TooLargeWeight();
```

## Structs
### WeightedVaultsVPCalcStorage
The storage of the WeightedVaultsVPCalc contract.


```solidity
struct WeightedVaultsVPCalcStorage {
    mapping(address vault => Checkpoints.Trace208 weight) _vaultWeight;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_vaultWeight`|`mapping(address vault => Checkpoints.Trace208 weight)`|The weight for each vault.|

