# SigBlsBn12381
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1e5359cf6070a0b4aae5d36e84302fa6de3a57c7/src/libraries/sigs/SigBlsBn12381.sol)

Library for verifying BLS signatures on the BN12381 curve.


## Functions
### verify

Verify a BLS signature.

Burns the whole gas if pairing precompile fails.
Returns false if the key is zero G1 point.


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
|`keyBytes`|`bytes`|The encoded G1 public key.|
|`message`|`bytes`|The encoded message hash to verify.|
|`signature`|`bytes`|The encoded G2 signature.|
|`<none>`|`bytes`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the signature is valid.|


### verify

Verify a BLS signature.

Burns the whole gas if pairing precompile fails.
Returns false if the key is zero G1 point.


```solidity
function verify(BN12381.G1Point memory keyG1, bytes32 messageHash, BN12381.G2Point memory signatureG2)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyG1`|`BN12381.G1Point`|The G1 public key.|
|`messageHash`|`bytes32`|The message hash to verify.|
|`signatureG2`|`BN12381.G2Point`|The G2 signature.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the signature is valid.|


## Errors
### SigBlsBn12381_InvalidMessageLength
Reverts when the message length is invalid.


```solidity
error SigBlsBn12381_InvalidMessageLength();
```

