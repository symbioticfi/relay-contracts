# IOperatorVaults
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/interfaces/modules/voting-power/extensions/IOperatorVaults.sol)


## Functions
### registerOperatorVault

Registers the operator vault.

*The caller must have the needed permission.*


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

*The caller must have the needed permission.*


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

*The caller must be the operator of the vault.*


```solidity
function unregisterOperatorVault(
    address vault
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The address of the vault.|


