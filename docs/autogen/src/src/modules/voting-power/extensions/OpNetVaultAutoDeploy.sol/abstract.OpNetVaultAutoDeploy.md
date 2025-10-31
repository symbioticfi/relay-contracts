# OpNetVaultAutoDeploy
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/90b476bb8f01dc59dc602dcd0b4e541b7aed48d5/src/modules/voting-power/extensions/OpNetVaultAutoDeploy.sol)

**Inherits:**
[VotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IOpNetVaultAutoDeploy](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol/interface.IOpNetVaultAutoDeploy.md)

Contract for auto-deploying vaults for operators on their registration.


## State Variables
### VAULT_CONFIGURATOR
Returns the address of the vault configurator.


```solidity
address public immutable VAULT_CONFIGURATOR
```


## Functions
### constructor


```solidity
constructor(address vaultConfigurator) ;
```

### __OpNetVaultAutoDeploy_init

Must be called after __VotingPowerProvider_init().


```solidity
function __OpNetVaultAutoDeploy_init(OpNetVaultAutoDeployInitParams memory initParams)
    internal
    virtual
    onlyInitializing;
```

### isAutoDeployEnabled

Returns the status of the auto deploy.


```solidity
function isAutoDeployEnabled() public view virtual returns (bool);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the auto deploy.|


### getAutoDeployedVault

Returns the address of the auto deployed vault of the operator.


```solidity
function getAutoDeployedVault(address operator) public view virtual returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the auto deployed vault of the operator.|


### getAutoDeployConfig

Returns the configuration of the auto deploy.


```solidity
function getAutoDeployConfig() public view virtual returns (AutoDeployConfig memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`AutoDeployConfig`|The configuration of the auto deploy.|


### isSetMaxNetworkLimitHookEnabled

Returns the status of the set max network limit hook.


```solidity
function isSetMaxNetworkLimitHookEnabled() public view virtual returns (bool);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the set max network limit hook.|


### setAutoDeployStatus

Sets the status of the auto deploy.

The caller must have the needed permission.


```solidity
function setAutoDeployStatus(bool status) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the auto deploy.|


### setAutoDeployConfig

Sets the configuration of the auto deploy.

The caller must have the needed permission.


```solidity
function setAutoDeployConfig(AutoDeployConfig memory config) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`config`|`AutoDeployConfig`|The configuration of the auto deploy.|


### setSetMaxNetworkLimitHookStatus

Sets the status of the set max network limit hook.

The caller must have the needed permission.


```solidity
function setSetMaxNetworkLimitHookStatus(bool status) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the set max network limit hook.|


### _registerOperatorImpl


```solidity
function _registerOperatorImpl(address operator) internal virtual override;
```

### _unregisterOperatorVaultImpl


```solidity
function _unregisterOperatorVaultImpl(address operator, address vault) internal virtual override;
```

