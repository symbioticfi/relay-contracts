# SigBlsBn254
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/140d36e839baf722c6672300f13ab7489a8ea2bc/src/libraries/sigs/SigBlsBn254.sol)

Library for verifying BLS signatures on the BN254 curve.


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
    BN254.G1Point memory keyG1,
    bytes32 messageHash,
    BN254.G1Point memory signatureG1,
    BN254.G2Point memory keyG2
) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyG1`|`BN254.G1Point`|The G1 public key.|
|`messageHash`|`bytes32`|The message hash to verify.|
|`signatureG1`|`BN254.G1Point`|The G1 signature.|
|`keyG2`|`BN254.G2Point`|The G2 public key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|If the signature is valid.|


## Errors
### SigBlsBn254_InvalidMessageLength
Reverts when the message length is invalid.


```solidity
error SigBlsBn254_InvalidMessageLength();
```

