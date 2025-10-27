# BaseSlashing
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/140d36e839baf722c6672300f13ab7489a8ea2bc/src/modules/voting-power/extensions/BaseSlashing.sol)

**Inherits:**
[VotingPowerProvider](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/voting-power/VotingPowerProvider.sol/abstract.VotingPowerProvider.md), [IBaseSlashing](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/voting-power/extensions/IBaseSlashing.sol/interface.IBaseSlashing.md)

Base contract for slashing vaults.


## State Variables
### BaseSlashingStorageLocation

```solidity
bytes32 private constant BaseSlashingStorageLocation =
    0xcd08f9337bf45f7ebac10e65ed25c2483d3efb012be3dbf2b4de227af3bf9400
```


## Functions
### onlySlasher


```solidity
modifier onlySlasher() ;
```

### _checkSlasher


```solidity
function _checkSlasher() internal view virtual;
```

### _getBaseSlashingStorage


```solidity
function _getBaseSlashingStorage() internal pure returns (IBaseSlashing.BaseSlashingStorage storage $);
```

### __BaseSlashing_init


```solidity
function __BaseSlashing_init(BaseSlashingInitParams memory initParams) internal virtual onlyInitializing;
```

### getSlasher

Returns the address of the slasher.


```solidity
function getSlasher() public view virtual returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the slasher.|


### slashVault

Slashes the vault.

The function doesn't check the registration statuses.


```solidity
function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes memory hints)
    public
    virtual
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
    public
    virtual
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


### setSlasher

Sets the slasher.

The caller must have the needed permission.


```solidity
function setSlasher(address slasher) public virtual checkPermission;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|


### _setSlasher


```solidity
function _setSlasher(address slasher) internal virtual;
```

