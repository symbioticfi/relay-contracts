# SigEcdsaSecp256k1
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/140d36e839baf722c6672300f13ab7489a8ea2bc/src/libraries/sigs/SigEcdsaSecp256k1.sol)

Library for verifying ECDSA signatures on the secp256k1 curve.


## Functions
### verify

Verify an ECDSA signature.

Returns false if the key is zero address.


```solidity
function verify(
    bytes memory keyBytes,
    bytes memory message,
    bytes memory signature,
    bytes memory /* extraData */
)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The encoded signer address.|
|`message`|`bytes`|The encoded message hash to verify.|
|`signature`|`bytes`|The encoded ECDSA signature.|
|`<none>`|`bytes`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the signature is valid.|


### verify

Verify an ECDSA signature.

Returns false if the key is zero address.


```solidity
function verify(address key, bytes32 message, bytes memory signature) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`address`|The signer address.|
|`message`|`bytes32`|The message hash to verify.|
|`signature`|`bytes`|The ECDSA signature.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the signature is valid.|


## Errors
### SigEcdsaSecp256k1_InvalidMessageLength
Reverts when the message length is invalid.


```solidity
error SigEcdsaSecp256k1_InvalidMessageLength();
```

