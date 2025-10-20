# IOperatorVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/7eb78caa6fd861b172d3fcd10e873a8e342caffb/src/interfaces/modules/voting-power/extensions/IOperatorVaults.sol)


## Functions
### registerOperatorVault

Registers the operator vault.

The caller must have the needed permission.


```solidity
function registerOperatorVault(address operator, address vault) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`vault`|`address`|The address of the vault.|


### unregisterOperatorVault

Unregisters the operator vault.

The caller must have the needed permission.


```solidity
function unregisterOperatorVault(address operator, address vault) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`vault`|`address`|The address of the vault.|


### unregisterOperatorVault

Unregisters the operator vault.

The caller must be the operator of the vault.


```solidity
function unregisterOperatorVault(address vault) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The address of the vault.|


