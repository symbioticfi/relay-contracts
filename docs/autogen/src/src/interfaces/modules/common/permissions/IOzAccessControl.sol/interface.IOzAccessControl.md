# IOzAccessControl
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/interfaces/modules/common/permissions/IOzAccessControl.sol)


## Functions
### getRole

Returns the required role for a selector.


```solidity
function getRole(
    bytes4 selector
) external view returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`selector`|`bytes4`|The function selector.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The required role.|


## Events
### SetSelectorRole
Emitted when the required role is set for a selector.


```solidity
event SetSelectorRole(bytes4 indexed selector, bytes32 indexed role);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`selector`|`bytes4`|The function selector.|
|`role`|`bytes32`|The required role.|

## Structs
### OzAccessControlStorage
The storage of the OzAccessControl contract.

**Note:**
storage-location: erc7201:symbiotic.storage.OzAccessControl


```solidity
struct OzAccessControlStorage {
    mapping(bytes4 selector => bytes32 role) _selectorRoles;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_selectorRoles`|`mapping(bytes4 selector => bytes32 role)`|The mapping from the function selector to the required role.|

