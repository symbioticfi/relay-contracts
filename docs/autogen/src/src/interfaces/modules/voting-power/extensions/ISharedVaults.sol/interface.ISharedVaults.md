# ISharedVaults
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/4bfd3b425b355bf68d0d4060c9b82af6e94e8c7e/src/interfaces/modules/voting-power/extensions/ISharedVaults.sol)

**Inherits:**
[IVotingPowerProvider](/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

**Title:**
ISharedVaults

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


