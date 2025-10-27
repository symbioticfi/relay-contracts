# ISharedVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/aa502a4be47c86d613c9f5ee2cc50ded6e2cee52/src/interfaces/modules/voting-power/extensions/ISharedVaults.sol)

Interface for the SharedVaults contract.


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


