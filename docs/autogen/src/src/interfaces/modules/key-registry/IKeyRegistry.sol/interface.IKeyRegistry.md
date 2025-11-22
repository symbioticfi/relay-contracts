# IKeyRegistry
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/48c012da16df2d3fd1ccae03176b04d180fbd59f/src/interfaces/modules/key-registry/IKeyRegistry.sol)

Interface for the KeyRegistry contract.


## Functions
### getKeysAt

Returns the operator's keys at a specific timestamp.


```solidity
function getKeysAt(address operator, uint48 timestamp) external view returns (Key[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`Key[]`|The operator's keys.|


### getKeys

Returns the current operator's keys.


```solidity
function getKeys(address operator) external view returns (Key[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`Key[]`|The operator's keys.|


### getKeyAt

Returns the key at a specific timestamp.

Will return a zero key if the key is not found (e.g., abi.encode(address(0)) for ECDSA keys).


```solidity
function getKeyAt(address operator, uint8 tag, uint48 timestamp) external view returns (bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`tag`|`uint8`|The tag of the key.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes`|The key.|


### getKey

Returns the current key.

Will return a zero key if the key is not found (e.g., abi.encode(address(0)) for ECDSA keys).


```solidity
function getKey(address operator, uint8 tag) external view returns (bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`tag`|`uint8`|The tag of the key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes`|The key.|


### getOperator

Returns the operator by the key.


```solidity
function getOperator(bytes memory key) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`bytes`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The operator.|


### getKeysAt

Returns the operators with their keys at a specific timestamp.

Different operators may have different numbers of keys and their tags.


```solidity
function getKeysAt(uint48 timestamp) external view returns (OperatorWithKeys[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`OperatorWithKeys[]`|The operators with their keys.|


### getKeys

Returns the current operators with their keys.

Different operators may have different numbers of keys and their tags.


```solidity
function getKeys() external view returns (OperatorWithKeys[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`OperatorWithKeys[]`|The operators with their keys.|


### getKeysOperatorsLength

Returns the number of the operators who registered any keys.


```solidity
function getKeysOperatorsLength() external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The number of the operators who registered any keys.|


### getKeysOperatorsAt

Returns the operators who registered any keys until a specific timestamp.


```solidity
function getKeysOperatorsAt(uint48 timestamp) external view returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operators who registered any keys until a specific timestamp.|


### getKeysOperators

Returns the operators who registered any keys.


```solidity
function getKeysOperators() external view returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operators who registered any keys.|


### setKey

Sets a key for a caller.


```solidity
function setKey(uint8 tag, bytes memory key, bytes memory signature, bytes memory extraData) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tag`|`uint8`|The tag of the key.|
|`key`|`bytes`|The payload of the key.|
|`signature`|`bytes`|The signature to verify the key ownership.|
|`extraData`|`bytes`|The extra data of the key (e.g., the G2 key for BLS keys).|


## Events
### SetKey
Emitted when the key is set.


```solidity
event SetKey(address indexed operator, uint8 indexed tag, bytes indexed key, bytes extraData);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`tag`|`uint8`|The tag of the key.|
|`key`|`bytes`|The payload of the key.|
|`extraData`|`bytes`|The extra data of the key (e.g., the G2 key for BLS keys).|

## Errors
### KeyRegistry_AlreadyUsed
Reverts when the key is already used by another operator or with another tag.


```solidity
error KeyRegistry_AlreadyUsed();
```

### KeyRegistry_InvalidKeySignature
Reverts when the key ownership signature is invalid.


```solidity
error KeyRegistry_InvalidKeySignature();
```

### KeyRegistry_InvalidKeyType
Reverts when the key type is not supported.


```solidity
error KeyRegistry_InvalidKeyType();
```

## Structs
### KeyRegistryStorage
The storage of the KeyRegistry contract.

**Note:**
storage-location: erc7201:symbiotic.storage.KeyRegistry


```solidity
struct KeyRegistryStorage {
    mapping(address operator => mapping(uint8 keyTag => Checkpoints.Trace256 trace)) _keys32;
    mapping(address operator => mapping(uint8 keyTag => Checkpoints.Trace512 trace)) _keys64;
    mapping(bytes32 keyHash => address operator) _operatorByKeyHash;
    mapping(uint8 keyType => mapping(bytes32 keyHash => address operator)) _operatorByTypeAndKeyHash;
    mapping(uint8 keyTag => mapping(bytes32 keyHash => address operator)) _operatorByTagAndKeyHash;
    PersistentSet.AddressSet _operators;
    mapping(address operator => Checkpoints.Trace208 trace) _operatorKeyTags;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_keys32`|`mapping(address operator => mapping(uint8 keyTag => Checkpoints.Trace256 trace))`|The mapping from the operator and the key tag to the 32 bytes key.|
|`_keys64`|`mapping(address operator => mapping(uint8 keyTag => Checkpoints.Trace512 trace))`|The mapping from the operator and the key tag to the 64 bytes key.|
|`_operatorByKeyHash`|`mapping(bytes32 keyHash => address operator)`|The mapping from the key hash to the operator.|
|`_operatorByTypeAndKeyHash`|`mapping(uint8 keyType => mapping(bytes32 keyHash => address operator))`|The mapping from the key type and the key hash to the operator.|
|`_operatorByTagAndKeyHash`|`mapping(uint8 keyTag => mapping(bytes32 keyHash => address operator))`|The mapping from the key type and the key hash to the operator.|
|`_operators`|`PersistentSet.AddressSet`|The set of operators with registered keys.|
|`_operatorKeyTags`|`mapping(address operator => Checkpoints.Trace208 trace)`|The mapping from the operator to the registered key tags.|

### KeyRegistryInitParams
The parameters for the initialization of the KeyRegistry contract.


```solidity
struct KeyRegistryInitParams {
    IOzEIP712.OzEIP712InitParams ozEip712InitParams;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`ozEip712InitParams`|`IOzEIP712.OzEIP712InitParams`|The parameters for the initialization of the OzEIP712 contract.|

### Key
The key with the tag and the payload.


```solidity
struct Key {
    uint8 tag;
    bytes payload;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`tag`|`uint8`|The tag of the key.|
|`payload`|`bytes`|The payload of the key.|

### OperatorWithKeys
The operator with the keys.


```solidity
struct OperatorWithKeys {
    address operator;
    Key[] keys;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`keys`|`Key[]`|The operator's keys.|

