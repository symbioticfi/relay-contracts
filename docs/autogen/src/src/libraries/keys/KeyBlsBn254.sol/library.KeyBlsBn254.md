# KeyBlsBn254
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/c51cd9989857900b620b563b6be0ac3f1fdb0ce4/src/libraries/keys/KeyBlsBn254.sol)

Library for interacting with BLS public keys on the BN254 curve, including validation, serialization, and compression.

The keys are represented as G1 points on the BN254 curve.


## Functions
### wrap

Wraps a G1 public key.

Allows to wrap zero G1 point.


```solidity
function wrap(BN254.G1Point memory keyRaw) internal view returns (KEY_BLS_BN254 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyRaw`|`BN254.G1Point`|The G1 public key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BN254`|The wrapped key.|


### unwrap

Unwraps a key.


```solidity
function unwrap(KEY_BLS_BN254 memory key) internal view returns (BN254.G1Point memory keyRaw);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BN254`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyRaw`|`BN254.G1Point`|The G1 public key.|


### serialize

Serializes a key.

Compresses G1 point to 32 bytes (255 bits).


```solidity
function serialize(KEY_BLS_BN254 memory key) internal view returns (bytes memory keySerialized);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BN254`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keySerialized`|`bytes`|The serialized key.|


### deserialize

Deserializes a serialized key.


```solidity
function deserialize(bytes memory keySerialized) internal view returns (KEY_BLS_BN254 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keySerialized`|`bytes`|The serialized key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BN254`|The key.|


### toBytes

Converts a key to bytes.

It is a bytes representation of the underlying key itself.


```solidity
function toBytes(KEY_BLS_BN254 memory key) internal view returns (bytes memory keyBytes);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BN254`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The bytes representation of the key.|


### fromBytes

Converts bytes to a key.


```solidity
function fromBytes(bytes memory keyBytes) internal view returns (KEY_BLS_BN254 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The bytes representation of the key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BN254`|The key.|


### zeroKey

Returns a zero key.


```solidity
function zeroKey() internal view returns (KEY_BLS_BN254 memory key);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BN254`|The zero key.|


### equal

Checks if two keys are equal.


```solidity
function equal(KEY_BLS_BN254 memory key1, KEY_BLS_BN254 memory key2) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key1`|`KEY_BLS_BN254`|The first key.|
|`key2`|`KEY_BLS_BN254`|The second key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the keys are equal.|


## Errors
### KeyBlsBn254_InvalidBytes
Reverts when the key bytes are invalid.


```solidity
error KeyBlsBn254_InvalidBytes();
```

### KeyBlsBn254_InvalidKey
Reverts when the key is invalid.


```solidity
error KeyBlsBn254_InvalidKey();
```

## Structs
### KEY_BLS_BN254
The key wrapper.


```solidity
struct KEY_BLS_BN254 {
    BN254.G1Point value;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`value`|`BN254.G1Point`|The G1 public key.|

