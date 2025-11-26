# KeyTags
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/e9e0e593c3de594113782553dc8090eb04204f16/src/libraries/utils/KeyTags.sol)

Library for working with key tags which represent the keys' types and arbitrary purpose identifiers.


## State Variables
### TOTAL_KEY_TAGS
The total number of key tags.

3 bits for type, 4 bits for tag


```solidity
uint256 internal constant TOTAL_KEY_TAGS = 128
```


### MAX_KEY_TYPE
The maximum key type.


```solidity
uint8 internal constant MAX_KEY_TYPE = 7
```


### MAX_KEY_TAG
The maximum key tag.


```solidity
uint8 internal constant MAX_KEY_TAG = 15
```


## Functions
### validateKeyTag

Validates a key tag.


```solidity
function validateKeyTag(uint8 keyTag) internal pure;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTag`|`uint8`|The key tag.|


### validateType

Validates a key type.


```solidity
function validateType(uint8 type_) internal pure;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`type_`|`uint8`|The key type.|


### validateTag

Validates a key tag identifier.


```solidity
function validateTag(uint8 tag) internal pure;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tag`|`uint8`|The key tag identifier.|


### getKeyTag

Returns a key tag.


```solidity
function getKeyTag(uint8 type_, uint8 tag) internal pure returns (uint8);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`type_`|`uint8`|The key type.|
|`tag`|`uint8`|The key tag identifier.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The key tag.|


### getType

Returns a key type.


```solidity
function getType(uint8 keyTag) internal pure returns (uint8);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTag`|`uint8`|The key tag.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The key type.|


### getTag

Returns a key tag identifier.


```solidity
function getTag(uint8 keyTag) internal pure returns (uint8);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTag`|`uint8`|The key tag.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The key tag identifier.|


### contains

Checks if a key tag is in the serialized key tags.


```solidity
function contains(uint128 keyTagsSerialized, uint8 keyTag) internal pure returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTagsSerialized`|`uint128`|The serialized key tags.|
|`keyTag`|`uint8`|The key tag.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the key tag is in the serialized key tags.|


### add

Adds a key tag to the serialized key tags.

Doesn't revert when the key tag is already in the serialized key tags.


```solidity
function add(uint128 keyTagsSerialized, uint8 keyTag) internal pure returns (uint128);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTagsSerialized`|`uint128`|The serialized key tags.|
|`keyTag`|`uint8`|The key tag.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint128`|The serialized key tags with the key tag added.|


### remove

Removes a key tag from the serialized key tags.

Doesn't revert when the key tag is not in the serialized key tags.


```solidity
function remove(uint128 keyTagsSerialized, uint8 keyTag) internal pure returns (uint128);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTagsSerialized`|`uint128`|The serialized key tags.|
|`keyTag`|`uint8`|The key tag.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint128`|The serialized key tags with the key tag removed.|


### serialize

Serializes an array of key tags.

Reverts when the key tags are duplicated.


```solidity
function serialize(uint8[] memory keyTags) internal pure returns (uint128 keyTagsSerialized);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTags`|`uint8[]`|The array of key tags.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyTagsSerialized`|`uint128`|The serialized key tags.|


### deserialize

Deserializes a serialized key tags.


```solidity
function deserialize(uint128 keyTagsSerialized) internal pure returns (uint8[] memory keyTags);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTagsSerialized`|`uint128`|The serialized key tags.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`keyTags`|`uint8[]`|The array of key tags.|


## Errors
### DuplicateKeyTag
Reverts when the key tag is duplicated.


```solidity
error DuplicateKeyTag();
```

### InvalidKeyType
Reverts when the key type is invalid.


```solidity
error InvalidKeyType();
```

### InvalidKeyTag
Reverts when the key tag is invalid.


```solidity
error InvalidKeyTag();
```

