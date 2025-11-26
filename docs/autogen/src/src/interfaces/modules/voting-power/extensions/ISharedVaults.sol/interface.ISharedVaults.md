# ISharedVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3555af95a3dd521f0c0f40867fec8f48136f728e/src/interfaces/modules/voting-power/extensions/ISharedVaults.sol)

**Inherits:**
[IVotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

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


