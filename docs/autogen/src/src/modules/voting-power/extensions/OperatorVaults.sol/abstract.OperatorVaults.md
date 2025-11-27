# OperatorVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/63fb22c064d8c8e2964bdd71f2fa6145dbf5ad0e/src/modules/voting-power/extensions/OperatorVaults.sol)

**Inherits:**
[VotingPowerProvider](/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IOperatorVaults](/src/interfaces/modules/voting-power/extensions/IOperatorVaults.sol/interface.IOperatorVaults.md)

**Title:**
OperatorVaults

Contract for registering and unregistering operator vaults.


## Functions
### __OperatorVaults_init


```solidity
function __OperatorVaults_init() internal virtual onlyInitializing;
```

### registerOperatorVault

Registers the operator vault.

The caller must have the needed permission.


```solidity
function registerOperatorVault(address operator, address vault) public virtual checkPermission;
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
function unregisterOperatorVault(address operator, address vault) public virtual checkPermission;
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
function unregisterOperatorVault(address vault) public virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The address of the vault.|


