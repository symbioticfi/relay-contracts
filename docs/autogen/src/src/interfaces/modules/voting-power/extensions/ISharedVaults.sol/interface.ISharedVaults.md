# ISharedVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/b47510b803cc7bdc2bd336dbdbf5918993c63228/src/interfaces/modules/voting-power/extensions/ISharedVaults.sol)


## Functions
### registerSharedVault

Registers the shared vault.

The caller must have the needed permission.


```solidity
function registerSharedVault(address sharedVault) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharedVault`|`address`|The address of the shared vault.|


### unregisterSharedVault

Unregisters the shared vault.

The caller must have the needed permission.


```solidity
function unregisterSharedVault(address sharedVault) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharedVault`|`address`|The address of the shared vault.|


