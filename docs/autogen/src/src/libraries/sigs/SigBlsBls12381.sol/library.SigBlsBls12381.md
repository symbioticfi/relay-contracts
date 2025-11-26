# SigBlsBls12381
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/e9e0e593c3de594113782553dc8090eb04204f16/src/libraries/sigs/SigBlsBls12381.sol)

Library for verifying BLS signatures on the BLS12381 curve.


## Functions
### verify

Verify a BLS signature.

Burns the whole gas if pairing precompile fails.
Returns false if the key is zero G1 point.


```solidity
function verify(bytes memory keyBytes, bytes memory message, bytes memory signature, bytes memory extraData)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyBytes`|`bytes`|The encoded G1 public key.|
|`message`|`bytes`|The encoded message hash to verify.|
|`signature`|`bytes`|The encoded G1 signature.|
|`extraData`|`bytes`|The encoded G2 public key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the signature is valid.|


### verify

Verify a BLS signature.

Burns the whole gas if pairing precompile fails.
Returns false if the key is zero G1 point.


```solidity
function verify(
    BLS12381.G1Point memory keyG1,
    bytes32 messageHash,
    BLS12381.G1Point memory signatureG1,
    BLS12381.G2Point memory keyG2
) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyG1`|`BLS12381.G1Point`|The G1 public key.|
|`messageHash`|`bytes32`|The message hash to verify.|
|`signatureG1`|`BLS12381.G1Point`|The G1 signature.|
|`keyG2`|`BLS12381.G2Point`|The G2 public key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the signature is valid.|


## Errors
### SigBlsBls12381_InvalidMessageLength
Reverts when the message length is invalid.


```solidity
error SigBlsBls12381_InvalidMessageLength();
```

