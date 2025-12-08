# IBaseSlashing
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9b9397f972967c27019ba88b9cb96dce82bcc4be/src/interfaces/modules/voting-power/extensions/IBaseSlashing.sol)

**Inherits:**
[IVotingPowerProvider](/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

**Title:**
IBaseSlashing

Interface for the BaseSlashing contract.


## Functions
### getSlasher

Returns the address of the slasher.


```solidity
function getSlasher() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the slasher.|


### setSlasher

Sets the slasher.

The caller must have the needed permission.


```solidity
function setSlasher(address slasher) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|


### slashVault

Slashes the vault.

The function doesn't check the registration statuses.


```solidity
function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes memory hints)
    external
    returns (bool success, bytes memory response);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The capture timestamp for the slash.|
|`vault`|`address`|The address of the vault.|
|`operator`|`address`|The address of the operator.|
|`amount`|`uint256`|The amount of the tokens to be slashed.|
|`hints`|`bytes`|The hints to optimize the vault slashing.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`success`|`bool`|The success of the slash.|
|`response`|`bytes`|The response of the slash.|


### executeSlashVault

Executes the slash of the vault.


```solidity
function executeSlashVault(address vault, uint256 slashIndex, bytes memory hints)
    external
    returns (bool success, uint256 slashedAmount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The address of the vault.|
|`slashIndex`|`uint256`|The index of the slash.|
|`hints`|`bytes`|The hints to optimize the vault slashing.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`success`|`bool`|The success of the slash.|
|`slashedAmount`|`uint256`|The amount of the slashed tokens.|


## Events
### SetSlasher
Emitted when the slasher is set.


```solidity
event SetSlasher(address slasher);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|

### InstantSlash
Emitted when the instant slash is executed.


```solidity
event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|
|`operator`|`address`|The address of the operator.|
|`success`|`bool`|The success of the slash.|
|`slashedAmount`|`uint256`|The amount of the slashed tokens.|

### VetoSlash
Emitted when the veto slash is executed.


```solidity
event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|
|`operator`|`address`|The address of the operator.|
|`success`|`bool`|The success of the slash.|
|`slashIndex`|`uint256`|The index of the slash.|

### ExecuteSlash
Emitted when the slash is executed.


```solidity
event ExecuteSlash(
    address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount
);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|
|`slashIndex`|`uint256`|The index of the slash.|
|`success`|`bool`|The success of the slash.|
|`slashedAmount`|`uint256`|The amount of the slashed tokens.|

## Errors
### BaseSlashing_NoSlasher
Reverts when the vault doesn't have a slasher.


```solidity
error BaseSlashing_NoSlasher();
```

### BaseSlashing_NoSlashing
Reverts when the slashing wasn't required at the requested timestamp.


```solidity
error BaseSlashing_NoSlashing();
```

### BaseSlashing_NotSlasher
Reverts when the caller is not the slasher.


```solidity
error BaseSlashing_NotSlasher();
```

### BaseSlashing_NotVetoSlasher
Reverts when the slasher is not a veto slasher.


```solidity
error BaseSlashing_NotVetoSlasher();
```

### BaseSlashing_UnknownSlasherType
Reverts when the slasher type is unsupported.


```solidity
error BaseSlashing_UnknownSlasherType();
```

## Structs
### BaseSlashingStorage
The storage of the BaseSlashing contract.

**Note:**
storage-location: erc7201:symbiotic.storage.BaseSlashing


```solidity
struct BaseSlashingStorage {
    address _slasher;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_slasher`|`address`|The address of the slasher.|

### BaseSlashingInitParams
The parameters for the initialization of the BaseSlashing contract.


```solidity
struct BaseSlashingInitParams {
    address slasher;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|

### SlashHints
The hints to optimize the base slashing.


```solidity
struct SlashHints {
    bytes slashingDataHint;
    bytes slashCoreHints;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`slashingDataHint`|`bytes`|The hint to optimize the slashing data fetching.|
|`slashCoreHints`|`bytes`|The hints to optimize the slash core.|

### ExecuteSlashHints
The hints to optimize the execute slash.


```solidity
struct ExecuteSlashHints {
    bytes slashingDataHint;
    bytes executeSlashCoreHints;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`slashingDataHint`|`bytes`|The hint to optimize the slashing data fetching.|
|`executeSlashCoreHints`|`bytes`|The hints to optimize the execute slash core.|

