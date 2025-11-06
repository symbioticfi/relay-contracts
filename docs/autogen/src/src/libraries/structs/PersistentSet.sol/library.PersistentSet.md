# PersistentSet
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1e5359cf6070a0b4aae5d36e84302fa6de3a57c7/src/libraries/structs/PersistentSet.sol)

Library implementing a persistent set using Checkpoints.

The library is optimized towards "write" operations, so, in general, "read" batch operations
like `values()` and `valuesAt()` should not be used on-chain.


## Functions
### _add

Adds an element to the set.

It is possible to add an element only at the same or greater key than the previous one for this value.


```solidity
function _add(Set storage set, uint48 key, bytes32 value) private returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|
|`key`|`uint48`|The key to add element at.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element was added to the set.|


### _remove

Removes an element from the set.

It is possible to remove an element only at the same or greater key than the previous one for this value.


```solidity
function _remove(Set storage set, uint48 key, bytes32 value) private returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|
|`key`|`uint48`|The key to remove element at.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element was removed from the set.|


### _containsAt

Checks if an element is in the set at a given key.


```solidity
function _containsAt(Set storage set, uint48 key, bytes32 value, bytes memory hint) private view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|
|`key`|`uint48`|The key to check element at.|
|`value`|`bytes32`|The element.|
|`hint`|`bytes`|The hint to use for the lookup.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set at the given key.|


### _containsAt

Checks if an element is in the set at a given key.


```solidity
function _containsAt(Set storage set, uint48 key, bytes32 value) private view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|
|`key`|`uint48`|The key to check element at.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set at the given key.|


### _contains

Checks if an element is in the set.


```solidity
function _contains(Set storage set, bytes32 value) private view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set.|


### _length

Returns the number of elements in the set.


```solidity
function _length(Set storage set) private view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The number of elements in the set.|


### _valuesAt

Returns the elements in the set at a given key.


```solidity
function _valuesAt(Set storage set, uint48 key) private view returns (bytes32[] memory values_);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|
|`key`|`uint48`|The key to get elements at.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`values_`|`bytes32[]`|The elements in the set at the given key.|


### _values

Returns the elements in the set.


```solidity
function _values(Set storage set) private view returns (bytes32[] memory values_);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Set`|The set.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`values_`|`bytes32[]`|The elements in the set.|


### add

Adds an element to the set.


```solidity
function add(Bytes32Set storage set, uint48 key, bytes32 value) internal returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|
|`key`|`uint48`|The key to add element at.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element was added to the set.|


### remove

Removes an element from the set.


```solidity
function remove(Bytes32Set storage set, uint48 key, bytes32 value) internal returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|
|`key`|`uint48`|The key to remove element at.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element was removed from the set.|


### containsAt

Checks if an element is in the set at a given key.


```solidity
function containsAt(Bytes32Set storage set, uint48 key, bytes32 value, bytes memory hint)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|
|`key`|`uint48`|The key to check element at.|
|`value`|`bytes32`|The element.|
|`hint`|`bytes`|The hint to use for the lookup.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set at the given key.|


### containsAt

Checks if an element is in the set at a given key.


```solidity
function containsAt(Bytes32Set storage set, uint48 key, bytes32 value) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|
|`key`|`uint48`|The key to check element at.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set at the given key.|


### contains

Checks if an element is in the set.


```solidity
function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|
|`value`|`bytes32`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set.|


### length

Returns the number of elements in the set.


```solidity
function length(Bytes32Set storage set) internal view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The number of elements in the set.|


### valuesAt

Returns the elements in the set at a given key.


```solidity
function valuesAt(Bytes32Set storage set, uint48 key) internal view returns (bytes32[] memory result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|
|`key`|`uint48`|The key to get elements at.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`bytes32[]`|The elements in the set at the given key.|


### values

Returns the elements in the set.


```solidity
function values(Bytes32Set storage set) internal view returns (bytes32[] memory result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`Bytes32Set`|The set.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`bytes32[]`|The elements in the set.|


### add

Adds an element to the set.


```solidity
function add(AddressSet storage set, uint48 key, address value) internal returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|
|`key`|`uint48`|The key to add element at.|
|`value`|`address`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element was added to the set.|


### remove

Removes an element from the set.


```solidity
function remove(AddressSet storage set, uint48 key, address value) internal returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|
|`key`|`uint48`|The key to remove element at.|
|`value`|`address`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element was removed from the set.|


### containsAt

Checks if an element is in the set at a given key.


```solidity
function containsAt(AddressSet storage set, uint48 key, address value, bytes memory hint)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|
|`key`|`uint48`|The key to check element at.|
|`value`|`address`|The element.|
|`hint`|`bytes`|The hint to use for the lookup.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set at the given key.|


### containsAt

Checks if an element is in the set at a given key.


```solidity
function containsAt(AddressSet storage set, uint48 key, address value) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|
|`key`|`uint48`|The key to check element at.|
|`value`|`address`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set at the given key.|


### contains

Checks if an element is in the set.


```solidity
function contains(AddressSet storage set, address value) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|
|`value`|`address`|The element.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the element is in the set.|


### length

Returns the number of elements in the set.


```solidity
function length(AddressSet storage set) internal view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The number of elements in the set.|


### valuesAt

Returns the elements in the set at a given key.


```solidity
function valuesAt(AddressSet storage set, uint48 key) internal view returns (address[] memory result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|
|`key`|`uint48`|The key to get elements at.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`address[]`|The elements in the set at the given key.|


### values

Returns the elements in the set.


```solidity
function values(AddressSet storage set) internal view returns (address[] memory result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`set`|`AddressSet`|The set.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`address[]`|The elements in the set.|


## Errors
### InvalidKey
Reverts when the key is too old.


```solidity
error InvalidKey();
```

## Structs
### Status
The status of an element.


```solidity
struct Status {
    bool isAdded;
    uint48 addedAt;
    Checkpoints.Trace208 isRemoved;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`isAdded`|`bool`|If the element was ever added to the set.|
|`addedAt`|`uint48`|The key (e.g., block timestamp or block number) at which the element was firstly added to the set.|
|`isRemoved`|`Checkpoints.Trace208`|The trace of keys at which the element was removed from the set.|

### Set
The set.


```solidity
struct Set {
    bytes32[] _elements;
    mapping(bytes32 => Status) _statuses;
    uint256 _length;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_elements`|`bytes32[]`|The elements of the set which were ever added to the set.|
|`_statuses`|`mapping(bytes32 => Status)`|The statuses of the elements.|
|`_length`|`uint256`|The number of elements which are currently in the set.|

### Bytes32Set
The set of bytes32 values.


```solidity
struct Bytes32Set {
    Set _inner;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_inner`|`Set`|The set.|

### AddressSet
The set of address values.


```solidity
struct AddressSet {
    Set _inner;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_inner`|`Set`|The set.|

