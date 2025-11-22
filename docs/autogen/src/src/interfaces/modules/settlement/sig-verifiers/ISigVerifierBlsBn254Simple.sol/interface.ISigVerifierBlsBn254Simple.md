# ISigVerifierBlsBn254Simple
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9853e60a660dc25d05a02ef98e2b218dd40efcc4/src/interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254Simple.sol)

**Inherits:**
[ISigVerifier](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/settlement/sig-verifiers/ISigVerifier.sol/interface.ISigVerifier.md)

Interface for the SigVerifierBlsBn254Simple contract.


## Functions
### VALIDATOR_SET_HASH_KECCAK256_HASH

Returns the marker for extra data fetching of the validator set keccak256 hash.


```solidity
function VALIDATOR_SET_HASH_KECCAK256_HASH() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The marker for extra data fetching of the validator set keccak256 hash.|


### AGGREGATED_PUBLIC_KEY_G1_HASH

Returns the marker for extra data fetching of the aggregated public key G1.

The public key is compressed to one bytes32 slot.


```solidity
function AGGREGATED_PUBLIC_KEY_G1_HASH() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The marker for extra data fetching of the aggregated public key G1.|


### MAX_VALIDATORS

Returns the maximum allowed number of validators for this verification mechanism.

The maximum exists because each non-signer's index is encoded as a 2 bytes value.


```solidity
function MAX_VALIDATORS() external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The maximum allowed number of validators for this verification mechanism.|


## Errors
### SigVerifierBlsBn254Simple_InvalidMessageLength
Reverts when the message length is invalid.


```solidity
error SigVerifierBlsBn254Simple_InvalidMessageLength();
```

### SigVerifierBlsBn254Simple_InvalidNonSignerIndex
Reverts when the non-signer index is greater than the number of validators.


```solidity
error SigVerifierBlsBn254Simple_InvalidNonSignerIndex();
```

### SigVerifierBlsBn254Simple_InvalidNonSignersOrder
Reverts when the non-signers' indices are not in the correct order.

The indices must be sorted in ascending order.


```solidity
error SigVerifierBlsBn254Simple_InvalidNonSignersOrder();
```

### SigVerifierBlsBn254Simple_InvalidProofLength
Reverts when the proof length is too short.


```solidity
error SigVerifierBlsBn254Simple_InvalidProofLength();
```

### SigVerifierBlsBn254Simple_InvalidProofOffset
Reverts when the proof offset is invalid.


```solidity
error SigVerifierBlsBn254Simple_InvalidProofOffset();
```

### SigVerifierBlsBn254Simple_TooManyValidators
Reverts when the number of validators exceeds the maximum allowed for this verification mechanism.


```solidity
error SigVerifierBlsBn254Simple_TooManyValidators();
```

### SigVerifierBlsBn254Simple_UnsupportedKeyTag
Reverts when the verification is not supported for the given key tag.


```solidity
error SigVerifierBlsBn254Simple_UnsupportedKeyTag();
```

