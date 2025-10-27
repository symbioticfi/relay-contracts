# OzAccessControl
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/aa502a4be47c86d613c9f5ee2cc50ded6e2cee52/src/modules/common/permissions/OzAccessControl.sol)

**Inherits:**
[PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), AccessControlUpgradeable, [IOzAccessControl](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/common/permissions/IOzAccessControl.sol/interface.IOzAccessControl.md)

Contract for permission management based on OpenZeppelin's AccessControl.


## State Variables
### OzAccessControlStorageLocation

```solidity
bytes32 private constant OzAccessControlStorageLocation =
    0xbe09a78a256419d2b885312b60a13e8082d8ab3c36c463fff4fbb086f1e96f00
```


## Functions
### _getOzAccessControlStorage


```solidity
function _getOzAccessControlStorage() internal pure returns (OzAccessControlStorage storage $);
```

### __OzAccessControl_init


```solidity
function __OzAccessControl_init() internal virtual onlyInitializing;
```

### getRole

Returns the required role for a selector.


```solidity
function getRole(bytes4 selector) public view virtual returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`selector`|`bytes4`|The function selector.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The required role.|


### _checkPermission


```solidity
function _checkPermission() internal view virtual override;
```

### _setSelectorRole


```solidity
function _setSelectorRole(bytes4 selector, bytes32 role) internal virtual;
```

