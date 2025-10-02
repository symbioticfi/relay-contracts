# SharedVaults
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/modules/voting-power/extensions/SharedVaults.sol)

**Inherits:**
[VotingPowerProvider](/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [ISharedVaults](/src/interfaces/modules/voting-power/extensions/ISharedVaults.sol/interface.ISharedVaults.md)

Contract for registering and unregistering shared vaults.


## Functions
### __SharedVaults_init


```solidity
function __SharedVaults_init() internal virtual onlyInitializing;
```

### registerSharedVault

Registers the shared vault.

*The caller must have the needed permission.*


```solidity
function registerSharedVault(
    address sharedVault
) public virtual checkPermission;
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
) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharedVault`|`address`|The address of the shared vault.|


