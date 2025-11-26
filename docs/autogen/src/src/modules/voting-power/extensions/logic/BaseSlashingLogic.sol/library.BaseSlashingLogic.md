# BaseSlashingLogic
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3555af95a3dd521f0c0f40867fec8f48136f728e/src/modules/voting-power/extensions/logic/BaseSlashingLogic.sol)

Library with bindings for slashing vaults.


## Functions
### slashVault

Slashes a vault.

It checks if the slashing was required at the given capture timestamp,
and if the slashing request is not stale regarding set `minEpochDuration`.


```solidity
function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes memory hints)
    public
    returns (bool success, bytes memory response);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The capture timestamp.|
|`vault`|`address`|The address of the vault to slash.|
|`operator`|`address`|The address of the operator to slash.|
|`amount`|`uint256`|The amount of the tokens to slash.|
|`hints`|`bytes`|The hints to optimize gas usage.|


### slash

Slashes a vault.

It checks if the slashing was required at the given capture timestamp,
and if the slashing request is not stale regarding set `minEpochDuration`.


```solidity
function slash(uint48 timestamp, address slasher, address operator, uint256 amount, bytes memory hints)
    public
    returns (bool success, bytes memory response);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The capture timestamp.|
|`slasher`|`address`|The address of the slasher.|
|`operator`|`address`|The address of the operator to slash.|
|`amount`|`uint256`|The amount of the tokens to slash.|
|`hints`|`bytes`|The hints to optimize gas usage.|


### slashUnsafe

Slashes a vault.


```solidity
function slashUnsafe(uint48 timestamp, address slasher, address operator, uint256 amount, bytes memory hints)
    public
    returns (bool success, bytes memory response);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The capture timestamp.|
|`slasher`|`address`|The address of the slasher.|
|`operator`|`address`|The address of the operator to slash.|
|`amount`|`uint256`|The amount of the tokens to slash.|
|`hints`|`bytes`|The hints to optimize gas usage.|


### executeSlashVault

Executes a slash request.

It checks if the slashing request is not stale regarding set `minEpochDuration`.


```solidity
function executeSlashVault(address vault, uint256 slashIndex, bytes memory hints)
    public
    returns (bool success, uint256 slashedAmount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The address of the vault.|
|`slashIndex`|`uint256`|The index of the slash request.|
|`hints`|`bytes`|The hints to optimize gas usage.|


### executeSlash

Executes a slash request.

It checks if the slashing request is not stale regarding set `minEpochDuration`.


```solidity
function executeSlash(address slasher, uint256 slashIndex, bytes memory hints)
    public
    returns (bool success, uint256 slashedAmount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|
|`slashIndex`|`uint256`|The index of the slash request.|
|`hints`|`bytes`|The hints to optimize gas usage.|


### executeSlashUnsafe

Executes a slash request.


```solidity
function executeSlashUnsafe(address slasher, uint256 slashIndex, bytes memory hints)
    public
    returns (bool success, uint256 slashedAmount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`slasher`|`address`|The address of the slasher.|
|`slashIndex`|`uint256`|The index of the slash request.|
|`hints`|`bytes`|The hints to optimize gas usage.|


