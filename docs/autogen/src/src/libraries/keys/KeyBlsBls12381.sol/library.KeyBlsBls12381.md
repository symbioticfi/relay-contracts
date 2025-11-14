# KeyBlsBls12381
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/libraries/keys/KeyBlsBls12381.sol)

Library for interacting with BLS public keys on the BLS12381 curve, including validation, serialization, and compression.

The keys are represented as G1 points on the BLS12381 curve.


## Functions
### wrap

Wraps a G1 public key.

Allows to wrap zero G1 point.


```solidity
function wrap(BLS12381.G1Point memory keyRaw) internal view returns (KEY_BLS_BLS12381 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyRaw`|`BLS12381.G1Point`|The G1 public key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BLS12381`|The wrapped key.|


### unwrap

Unwraps a key.


```solidity
function unwrap(KEY_BLS_BLS12381 memory key) internal view returns (BLS12381.G1Point memory keyRaw);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BLS12381`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyRaw`|`BLS12381.G1Point`|The G1 public key.|


### serialize

Serializes a key.

Compresses G1 point to 48 bytes (two 32 bytes words).


```solidity
function serialize(KEY_BLS_BLS12381 memory key) internal view returns (bytes memory keySerialized);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BLS12381`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keySerialized`|`bytes`|The serialized key.|


### deserialize

Deserializes a serialized key.


```solidity
function deserialize(bytes memory keySerialized) internal view returns (KEY_BLS_BLS12381 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keySerialized`|`bytes`|The serialized key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BLS12381`|The key.|


### toBytes

Converts a key to bytes.

It is a bytes representation of the underlying key itself.


```solidity
function toBytes(KEY_BLS_BLS12381 memory key) internal view returns (bytes memory keyBytes);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BLS12381`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The bytes representation of the key.|


### fromBytes

Converts bytes to a key.


```solidity
function fromBytes(bytes memory keyBytes) internal view returns (KEY_BLS_BLS12381 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The bytes representation of the key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BLS12381`|The key.|


### zeroKey

Returns a zero key.


```solidity
function zeroKey() internal view returns (KEY_BLS_BLS12381 memory key);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_BLS_BLS12381`|The zero key.|


### equal

Checks if two keys are equal.


```solidity
function equal(KEY_BLS_BLS12381 memory key1, KEY_BLS_BLS12381 memory key2) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key1`|`KEY_BLS_BLS12381`|The first key.|
|`key2`|`KEY_BLS_BLS12381`|The second key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the keys are equal.|


## Errors
### KeyBlsBls12381_InvalidBytes
Reverts when the key bytes are invalid.


```solidity
error KeyBlsBls12381_InvalidBytes();
```

### KeyBlsBls12381_InvalidKey
Reverts when the key is invalid.


```solidity
error KeyBlsBls12381_InvalidKey();
```

## Structs
### KEY_BLS_BLS12381
The key wrapper.


```solidity
struct KEY_BLS_BLS12381 {
    BLS12381.G1Point value;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`value`|`BLS12381.G1Point`|The G1 public key.|

