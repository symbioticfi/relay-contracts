# IOpNetVaultAutoDeploy
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol)

Interface for the OpNetVaultAutoDeploy contract.


## Functions
### VAULT_CONFIGURATOR

Returns the address of the vault configurator.


```solidity
function VAULT_CONFIGURATOR() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the vault configurator.|


### isAutoDeployEnabled

Returns the status of the auto deploy.


```solidity
function isAutoDeployEnabled() external view returns (bool);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the auto deploy.|


### getAutoDeployedVault

Returns the address of the auto deployed vault of the operator.


```solidity
function getAutoDeployedVault(address operator) external view returns (address);
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
function getAutoDeployConfig() external view returns (AutoDeployConfig memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`AutoDeployConfig`|The configuration of the auto deploy.|


### isSetMaxNetworkLimitHookEnabled

Returns the status of the set max network limit hook.


```solidity
function isSetMaxNetworkLimitHookEnabled() external view returns (bool);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the set max network limit hook.|


### setAutoDeployStatus

Sets the status of the auto deploy.

The caller must have the needed permission.


```solidity
function setAutoDeployStatus(bool status) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the auto deploy.|


### setAutoDeployConfig

Sets the configuration of the auto deploy.

The caller must have the needed permission.


```solidity
function setAutoDeployConfig(AutoDeployConfig memory config) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`config`|`AutoDeployConfig`|The configuration of the auto deploy.|


### setSetMaxNetworkLimitHookStatus

Sets the status of the set max network limit hook.

The caller must have the needed permission.


```solidity
function setSetMaxNetworkLimitHookStatus(bool status) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the set max network limit hook.|


## Events
### SetAutoDeployStatus
Emitted when the auto deploy status is set.


```solidity
event SetAutoDeployStatus(bool status);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the auto deploy.|

### SetAutoDeployConfig
Emitted when the auto deploy config is set.


```solidity
event SetAutoDeployConfig(AutoDeployConfig config);
```

### SetSetMaxNetworkLimitHookStatus
Emitted when the set max network limit hook status is set.


```solidity
event SetSetMaxNetworkLimitHookStatus(bool status);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`status`|`bool`|The status of the set max network limit hook.|

## Errors
### OpNetVaultAutoDeploy_InvalidBurnerHook
Reverts when the burner hook is enabled but the slasher is not.


```solidity
error OpNetVaultAutoDeploy_InvalidBurnerHook();
```

### OpNetVaultAutoDeploy_InvalidCollateral
Reverts when the collateral is zero address.


```solidity
error OpNetVaultAutoDeploy_InvalidCollateral();
```

### OpNetVaultAutoDeploy_InvalidEpochDuration
Reverts when the epoch duration is zero or less than the slashing window.


```solidity
error OpNetVaultAutoDeploy_InvalidEpochDuration();
```

### OpNetVaultAutoDeploy_InvalidWithSlasher
Reverts when the with slasher is disabled but the slashing window is not zero.


```solidity
error OpNetVaultAutoDeploy_InvalidWithSlasher();
```

## Structs
### OpNetVaultAutoDeployStorage
The storage of the OpNetVaultAutoDeploy contract.

**Note:**
storage-location: erc7201:symbiotic.storage.OpNetVaultAutoDeploy


```solidity
struct OpNetVaultAutoDeployStorage {
    bool _isAutoDeployEnabled;
    bool _isSetMaxNetworkLimitHookEnabled;
    mapping(address operator => address vault) _autoDeployedVault;
    AutoDeployConfig _config;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_isAutoDeployEnabled`|`bool`|The status of the auto deploy.|
|`_isSetMaxNetworkLimitHookEnabled`|`bool`|The status of the set max network limit hook.|
|`_autoDeployedVault`|`mapping(address operator => address vault)`|The mapping from the operator to the auto deployed vault.|
|`_config`|`AutoDeployConfig`|The configuration of the auto deploy.|

### OpNetVaultAutoDeployInitParams
The parameters for the initialization of the OpNetVaultAutoDeploy contract.


```solidity
struct OpNetVaultAutoDeployInitParams {
    bool isAutoDeployEnabled;
    AutoDeployConfig config;
    bool isSetMaxNetworkLimitHookEnabled;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`isAutoDeployEnabled`|`bool`|The status of the auto deploy.|
|`config`|`AutoDeployConfig`|The configuration of the auto deploy.|
|`isSetMaxNetworkLimitHookEnabled`|`bool`|The status of the set max network limit hook.|

### AutoDeployConfig
The configuration of the auto deploy.


```solidity
struct AutoDeployConfig {
    uint48 epochDuration;
    address collateral;
    address burner;
    bool withSlasher;
    bool isBurnerHook;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`epochDuration`|`uint48`|The duration of the epoch.|
|`collateral`|`address`|The address of the collateral.|
|`burner`|`address`|The address of the burner.|
|`withSlasher`|`bool`|The status of the with slasher.|
|`isBurnerHook`|`bool`|The status of the burner hook.|

