# IOperatorVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/4bfd3b425b355bf68d0d4060c9b82af6e94e8c7e/src/interfaces/modules/voting-power/extensions/IOperatorVaults.sol)

**Inherits:**
[IVotingPowerProvider](/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

**Title:**
IOperatorVaults

Interface for the OperatorVaults contract.


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


