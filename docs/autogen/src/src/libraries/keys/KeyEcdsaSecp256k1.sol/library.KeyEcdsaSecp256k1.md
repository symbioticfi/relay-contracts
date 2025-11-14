# KeyEcdsaSecp256k1
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/libraries/keys/KeyEcdsaSecp256k1.sol)

Library for interacting with ECDSA public keys on the secp256k1 curve, including validation and serialization.

The keys are represented as addresses.


## Functions
### wrap

Wraps an address.

Allows to wrap zero address.


```solidity
function wrap(address keyRaw) internal view returns (KEY_ECDSA_SECP256K1 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyRaw`|`address`|The address.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_ECDSA_SECP256K1`|The wrapped key.|


### unwrap

Unwraps a key.


```solidity
function unwrap(KEY_ECDSA_SECP256K1 memory key) internal view returns (address keyRaw);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_ECDSA_SECP256K1`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyRaw`|`address`|The address.|


### serialize

Serializes a key.

Serializes address to 32 bytes.


```solidity
function serialize(KEY_ECDSA_SECP256K1 memory key) internal view returns (bytes memory keySerialized);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_ECDSA_SECP256K1`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keySerialized`|`bytes`|The serialized key.|


### deserialize

Deserializes a serialized key.


```solidity
function deserialize(bytes memory keySerialized) internal view returns (KEY_ECDSA_SECP256K1 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keySerialized`|`bytes`|The serialized key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_ECDSA_SECP256K1`|The key.|


### toBytes

Converts a key to bytes.

It is a bytes representation of the underlying key itself.


```solidity
function toBytes(KEY_ECDSA_SECP256K1 memory key) internal view returns (bytes memory keyBytes);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_ECDSA_SECP256K1`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The bytes representation of the key.|


### fromBytes

Converts bytes to a key.


```solidity
function fromBytes(bytes memory keyBytes) internal view returns (KEY_ECDSA_SECP256K1 memory key);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The bytes representation of the key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_ECDSA_SECP256K1`|The key.|


### zeroKey

Returns a zero key.


```solidity
function zeroKey() internal view returns (KEY_ECDSA_SECP256K1 memory key);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`key`|`KEY_ECDSA_SECP256K1`|The zero key.|


### equal

Checks if two keys are equal.


```solidity
function equal(KEY_ECDSA_SECP256K1 memory key1, KEY_ECDSA_SECP256K1 memory key2) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key1`|`KEY_ECDSA_SECP256K1`|The first key.|
|`key2`|`KEY_ECDSA_SECP256K1`|The second key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the keys are equal.|


## Errors
### KeyEcdsaSecp256k1_InvalidBytes
Reverts when the key bytes are invalid.


```solidity
error KeyEcdsaSecp256k1_InvalidBytes();
```

## Structs
### KEY_ECDSA_SECP256K1
The key wrapper.


```solidity
struct KEY_ECDSA_SECP256K1 {
    address value;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`value`|`address`|The address.|

