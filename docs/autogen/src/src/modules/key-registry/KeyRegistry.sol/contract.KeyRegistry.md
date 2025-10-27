# KeyRegistry
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/c51cd9989857900b620b563b6be0ac3f1fdb0ce4/src/modules/key-registry/KeyRegistry.sol)

**Inherits:**
MulticallUpgradeable, [OzEIP712](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/OzEIP712.sol/abstract.OzEIP712.md), [IKeyRegistry](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/key-registry/IKeyRegistry.sol/interface.IKeyRegistry.md)

Contract for operators' keys management.

It supports:
- BLS public keys on BN254
- ECDSA public keys on secp256k1


## State Variables
### KEY_OWNERSHIP_TYPEHASH

```solidity
bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)")
```


### KeyRegistryLocation

```solidity
bytes32 private constant KeyRegistryLocation = 0x79440bf5b0cb104c925971e1cca11d9e1557cbe9fa7533e7b0652d40728ecf00
```


## Functions
### _getKeyRegistryStorage


```solidity
function _getKeyRegistryStorage() internal pure returns (KeyRegistryStorage storage $);
```

### __KeyRegistry_init


```solidity
function __KeyRegistry_init(KeyRegistryInitParams memory keyRegistryInitParams) public virtual onlyInitializing;
```

### getKeyAt

Returns the key at a specific timestamp.

Will return a zero key if the key is not found (e.g., abi.encode(address(0)) for ECDSA keys).


```solidity
function getKeyAt(address operator, uint8 tag, uint48 timestamp) public view virtual returns (bytes memory);
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
function getKey(address operator, uint8 tag) public view virtual returns (bytes memory);
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
function getOperator(bytes memory key) public view virtual returns (address);
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

Returns the operator's keys at a specific timestamp.


```solidity
function getKeysAt(address operator, uint48 timestamp) public view virtual returns (Key[] memory keys);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keys`|`Key[]`|The operator's keys.|


### getKeys

Returns the current operator's keys.


```solidity
function getKeys(address operator) public view virtual returns (Key[] memory keys);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keys`|`Key[]`|The operator's keys.|


### getKeysAt

Returns the operator's keys at a specific timestamp.


```solidity
function getKeysAt(uint48 timestamp) public view virtual returns (OperatorWithKeys[] memory operatorsKeys);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`operatorsKeys`|`OperatorWithKeys[]`|The operator's keys.|


### getKeys

Returns the current operator's keys.


```solidity
function getKeys() public view virtual returns (OperatorWithKeys[] memory operatorsKeys);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`operatorsKeys`|`OperatorWithKeys[]`|The operator's keys.|


### getKeysOperatorsLength

Returns the number of the operators who registered any keys.


```solidity
function getKeysOperatorsLength() public view virtual returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The number of the operators who registered any keys.|


### getKeysOperatorsAt

Returns the operators who registered any keys until a specific timestamp.


```solidity
function getKeysOperatorsAt(uint48 timestamp) public view virtual returns (address[] memory);
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
function getKeysOperators() public view virtual returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operators who registered any keys.|


### _getKeyTagsAt


```solidity
function _getKeyTagsAt(address operator, uint48 timestamp) internal view virtual returns (uint8[] memory);
```

### _getKeyTags


```solidity
function _getKeyTags(address operator) internal view virtual returns (uint8[] memory);
```

### setKey

Sets a key for a caller.


```solidity
function setKey(uint8 tag, bytes memory key, bytes memory signature, bytes memory extraData) public virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tag`|`uint8`|The tag of the key.|
|`key`|`bytes`|The payload of the key.|
|`signature`|`bytes`|The signature to verify the key ownership.|
|`extraData`|`bytes`|The extra data of the key (e.g., the G2 key for BLS keys).|


### _setKey


```solidity
function _setKey(address operator, uint8 tag, bytes memory key, bytes memory signature, bytes memory extraData)
    internal
    virtual;
```

### _setKey


```solidity
function _setKey(address operator, uint8 tag, bytes memory key) internal virtual;
```

### _setKey32


```solidity
function _setKey32(address operator, uint8 tag, bytes memory key) internal;
```

### _setKey64


```solidity
function _setKey64(address operator, uint8 tag, bytes memory key) internal;
```

### _verifyKey


```solidity
function _verifyKey(
    uint8 tag,
    bytes memory key,
    bytes memory signature,
    bytes memory extraData,
    bytes memory message
) internal view virtual returns (bool);
```

### _getKey32At


```solidity
function _getKey32At(address operator, uint8 tag, uint48 timestamp) internal view returns (bytes memory);
```

### _getKey32


```solidity
function _getKey32(address operator, uint8 tag) internal view returns (bytes memory);
```

### _getKey64At


```solidity
function _getKey64At(address operator, uint8 tag, uint48 timestamp) internal view returns (bytes memory);
```

### _getKey64


```solidity
function _getKey64(address operator, uint8 tag) internal view returns (bytes memory);
```

