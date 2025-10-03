# ISharedVaults
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/interfaces/modules/voting-power/extensions/ISharedVaults.sol)


## Functions
### registerSharedVault

Registers the shared vault.

*The caller must have the needed permission.*


```solidity
function registerSharedVault(
    address sharedVault
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharedVault`|`address`|The address of the shared vault.|


### unregisterSharedVault

Unregisters the shared vault.

*The caller must have the needed permission.*


```solidity
function unregisterSharedVault(
    address sharedVault
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharedVault`|`address`|The address of the shared vault.|


