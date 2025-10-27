# SharedVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/25bc077b00bc288b74df9d5ae2fb3db3e29bdbad/src/modules/voting-power/extensions/SharedVaults.sol)

**Inherits:**
[VotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [ISharedVaults](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/ISharedVaults.sol/interface.ISharedVaults.md)

Contract for registering and unregistering shared vaults.


## Functions
### __SharedVaults_init


```solidity
function __SharedVaults_init() internal virtual onlyInitializing;
```

### registerSharedVault

Registers the shared vault.

The caller must have the needed permission.


```solidity
function registerSharedVault(address sharedVault) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharedVault`|`address`|The address of the shared vault.|


### unregisterSharedVault

Unregisters the shared vault.

The caller must have the needed permission.


```solidity
function unregisterSharedVault(address sharedVault) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharedVault`|`address`|The address of the shared vault.|


