# OpNetVaultAutoDeployLogic
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/25bc077b00bc288b74df9d5ae2fb3db3e29bdbad/src/modules/voting-power/extensions/logic/OpNetVaultAutoDeployLogic.sol)

Library for auto-deploying vaults.


## State Variables
### OpNetVaultAutoDeployStorageLocation

```solidity
bytes32 private constant OpNetVaultAutoDeployStorageLocation =
    0x85a64baaaf23c04aec63d80adaee49297f70e3944d69ec004fa7cee8ee6e8b00
```


## Functions
### _getOpNetVaultAutoDeployStorage


```solidity
function _getOpNetVaultAutoDeployStorage()
    internal
    pure
    returns (IOpNetVaultAutoDeploy.OpNetVaultAutoDeployStorage storage $);
```

### initialize


```solidity
function initialize(IOpNetVaultAutoDeploy.OpNetVaultAutoDeployInitParams memory initParams) public;
```

### isAutoDeployEnabled


```solidity
function isAutoDeployEnabled() public view returns (bool);
```

### getAutoDeployedVault


```solidity
function getAutoDeployedVault(address operator) public view returns (address);
```

### getAutoDeployConfig


```solidity
function getAutoDeployConfig() public view returns (IOpNetVaultAutoDeploy.AutoDeployConfig memory);
```

### isSetMaxNetworkLimitHookEnabled


```solidity
function isSetMaxNetworkLimitHookEnabled() public view returns (bool);
```

### setAutoDeployStatus


```solidity
function setAutoDeployStatus(bool status) public;
```

### setAutoDeployConfig


```solidity
function setAutoDeployConfig(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) public;
```

### setSetMaxNetworkLimitHookStatus


```solidity
function setSetMaxNetworkLimitHookStatus(bool status) public;
```

### createVault


```solidity
function createVault(address operator) public returns (address vault, address delegator, address slasher);
```

### setAutoDeployedVault


```solidity
function setAutoDeployedVault(address operator, address vault) public;
```

### getVaultParams


```solidity
function getVaultParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory config)
    public
    view
    returns (uint64, bytes memory);
```

### getDelegatorParams


```solidity
function getDelegatorParams(
    IOpNetVaultAutoDeploy.AutoDeployConfig memory, /* config */
    address operator
)
    public
    view
    returns (uint64, bytes memory);
```

### getSlasherParams


```solidity
function getSlasherParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory config)
    public
    view
    returns (bool, uint64, bytes memory);
```

### _validateConfig


```solidity
function _validateConfig(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) public view;
```

### getVaultParams

Gets the encoded base vault params.


```solidity
function getVaultParams(IVault.InitParams memory params) public view returns (uint64, bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`params`|`IVault.InitParams`|The vault params.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint64`|version The version of the vault.|
|`<none>`|`bytes`|params The encoded base vault params.|


### getVaultTokenizedParams

Gets the encoded tokenized vault params.


```solidity
function getVaultTokenizedParams(IVault.InitParams memory baseParams, string memory name, string memory symbol)
    public
    view
    returns (uint64, bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`baseParams`|`IVault.InitParams`|The base vault params.|
|`name`|`string`|The name of the tokenized vault.|
|`symbol`|`string`|The symbol of the tokenized vault.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint64`|version The version of the vault.|
|`<none>`|`bytes`|params The encoded tokenized vault params.|


### getOperatorNetworkSpecificDelegatorParams

Gets the encoded operator-network-specific delegator params.


```solidity
function getOperatorNetworkSpecificDelegatorParams(
    address operator,
    address defaultAdminRoleHolder,
    address hook,
    address hookSetRoleHolder
) public view returns (uint64, bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`defaultAdminRoleHolder`|`address`|The default admin role holder.|
|`hook`|`address`|The hook.|
|`hookSetRoleHolder`|`address`|The hook set role holder.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint64`|version The version of the delegator.|
|`<none>`|`bytes`|params The encoded operator-network-specific delegator params.|


### getSlasherParams

Gets the encoded instant slasher params.


```solidity
function getSlasherParams(bool isBurnerHook) public view returns (uint64, bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`isBurnerHook`|`bool`|If the burner needs a hook call.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint64`|version The version of the slasher.|
|`<none>`|`bytes`|params The encoded instant slasher params.|


### getVetoSlasherParams

Gets the encoded veto slasher params.


```solidity
function getVetoSlasherParams(bool isBurnerHook, uint48 vetoDuration, uint256 resolverSetEpochsDelay)
    public
    view
    returns (uint64, bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`isBurnerHook`|`bool`|If the burner needs a hook call.|
|`vetoDuration`|`uint48`|The veto duration.|
|`resolverSetEpochsDelay`|`uint256`|The delay in epochs for a resolver to be set.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint64`|version The version of the slasher.|
|`<none>`|`bytes`|params The encoded veto slasher params.|


### createVault

Creates a vault.


```solidity
function createVault(
    uint64 version,
    address owner,
    bytes memory vaultParams,
    uint64 delegatorIndex,
    bytes memory delegatorParams,
    bool withSlasher,
    uint64 slasherIndex,
    bytes memory slasherParams
) public returns (address, address, address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`version`|`uint64`|The version of the vault.|
|`owner`|`address`|The owner of the vault.|
|`vaultParams`|`bytes`|The vault params.|
|`delegatorIndex`|`uint64`|The index of the delegator.|
|`delegatorParams`|`bytes`|The delegator params.|
|`withSlasher`|`bool`|If the vault should have a slasher.|
|`slasherIndex`|`uint64`|The index of the slasher.|
|`slasherParams`|`bytes`|The slasher params.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|vault The address of the vault.|
|`<none>`|`address`|delegator The address of the delegator.|
|`<none>`|`address`|slasher The address of the slasher.|


