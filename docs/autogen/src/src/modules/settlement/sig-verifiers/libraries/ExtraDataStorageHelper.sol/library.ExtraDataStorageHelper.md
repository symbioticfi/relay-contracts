# ExtraDataStorageHelper
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/f15b7f1298f3e89ef5f17b3ef10b20d2dc6845d4/src/modules/settlement/sig-verifiers/libraries/ExtraDataStorageHelper.sol)

Library for convenient and safe extra data storage slots derivation.


## State Variables
### KEY_TAG_PREFIX_HASH

```solidity
bytes32 public constant KEY_TAG_PREFIX_HASH = keccak256("keyTag.")
```


## Functions
### getKeyGlobal

Derives a key from a name hash.

It can be used, e.g., to store some global data like number of validators.


```solidity
function getKeyGlobal(bytes32 nameHash) internal pure returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`nameHash`|`bytes32`|The name hash.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The key.|


### getKeyGlobal

Derives a key from a key tag and a name hash.

It can be used, e.g., to store some data dependent on the key tag like quorum threshold.


```solidity
function getKeyGlobal(uint8 keyTag, bytes32 nameHash) internal pure returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTag`|`uint8`|The key tag.|
|`nameHash`|`bytes32`|The name hash.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The key.|


### getKeyGlobal

Derives a key from a key tag, a name hash and an index.

It can be used, e.g., to store some data dependent on the key tag, which needs more than 1 storage slot (32 bytes),
like aggregated BLS12-381 public key.


```solidity
function getKeyGlobal(uint8 keyTag, bytes32 nameHash, uint256 index) internal pure returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTag`|`uint8`|The key tag.|
|`nameHash`|`bytes32`|The name hash.|
|`index`|`uint256`|The index.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The key.|


### getKey

Derives a key from a verification type and a name hash.

It can be used, e.g., to store some data dependent on the verification type like number of validators
with a possibility to have multiple verification types simultaneously without collisions.


```solidity
function getKey(uint32 verificationType, bytes32 nameHash) internal pure returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verificationType`|`uint32`|The verification type.|
|`nameHash`|`bytes32`|The name hash.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The key.|


### getKey

Derives a key from a verification type, a key tag and a name hash.

It can be used, e.g., to store some data dependent on the verification type and the key tag like quorum threshold
with a possibility to have multiple verification types simultaneously without collisions.


```solidity
function getKey(uint32 verificationType, uint8 keyTag, bytes32 nameHash) internal pure returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verificationType`|`uint32`|The verification type.|
|`keyTag`|`uint8`|The key tag.|
|`nameHash`|`bytes32`|The name hash.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The key.|


### getKey

Derives a key from a verification type, a key tag, a name hash and an index.

It can be used, e.g., to store some data dependent on the verification type and the key tag,
which needs more than 1 storage slot (32 bytes), like aggregated BLS12-381 public key
with a possibility to have multiple verification types simultaneously without collisions.


```solidity
function getKey(uint32 verificationType, uint8 keyTag, bytes32 nameHash, uint256 index)
    internal
    pure
    returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verificationType`|`uint32`|The verification type.|
|`keyTag`|`uint8`|The key tag.|
|`nameHash`|`bytes32`|The name hash.|
|`index`|`uint256`|The index.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The key.|


