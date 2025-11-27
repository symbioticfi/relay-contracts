# ISigVerifierBlsBn254ZK
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/63fb22c064d8c8e2964bdd71f2fa6145dbf5ad0e/src/interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254ZK.sol)

**Inherits:**
[ISigVerifier](/src/interfaces/modules/settlement/sig-verifiers/ISigVerifier.sol/interface.ISigVerifier.md)

**Title:**
ISigVerifierBlsBn254ZK

Interface for the SigVerifierBlsBn254ZK contract.


## Functions
### TOTAL_ACTIVE_VALIDATORS_HASH

Returns the marker for extra data fetching of the total active validators.


```solidity
function TOTAL_ACTIVE_VALIDATORS_HASH() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The marker for extra data fetching of the total active validators.|


### VALIDATOR_SET_HASH_MIMC_HASH

Returns the marker for extra data fetching of the validator set MiMC hash.


```solidity
function VALIDATOR_SET_HASH_MIMC_HASH() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The marker for extra data fetching of the validator set MiMC hash.|


### verifiers

Returns the verifier at the given index.


```solidity
function verifiers(uint256 index) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`index`|`uint256`|The index of the verifier.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The verifier at the given index.|


### maxValidators

Returns the maximum supported number of validators for the verifier at the given index.


```solidity
function maxValidators(uint256 index) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`index`|`uint256`|The index of the verifier.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The maximum supported number of validators for the verifier at the given index.|


## Errors
### SigVerifierBlsBn254ZK_InvalidLength
Reverts when the number of verifiers and max validators is not the same or zero.


```solidity
error SigVerifierBlsBn254ZK_InvalidLength();
```

### SigVerifierBlsBn254ZK_InvalidMaxValidators
Reverts when the maximum supported number of validators is zero.


```solidity
error SigVerifierBlsBn254ZK_InvalidMaxValidators();
```

### SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder
Reverts when the maximum supported numbers of validators is not in the correct order.

The maximum supported numbers of validators must be in ascending order.


```solidity
error SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder();
```

### SigVerifierBlsBn254ZK_InvalidMessageLength
Reverts when the message length is invalid.


```solidity
error SigVerifierBlsBn254ZK_InvalidMessageLength();
```

### SigVerifierBlsBn254ZK_InvalidProofLength
Reverts when the proof length is invalid.


```solidity
error SigVerifierBlsBn254ZK_InvalidProofLength();
```

### SigVerifierBlsBn254ZK_InvalidProofOffset
Reverts when the proof offset is invalid.


```solidity
error SigVerifierBlsBn254ZK_InvalidProofOffset();
```

### SigVerifierBlsBn254ZK_InvalidTotalActiveValidators
Reverts when the total active validators is greater than the maximum supported.


```solidity
error SigVerifierBlsBn254ZK_InvalidTotalActiveValidators();
```

### SigVerifierBlsBn254ZK_InvalidVerifier
Reverts when the verifier is zero address.


```solidity
error SigVerifierBlsBn254ZK_InvalidVerifier();
```

### SigVerifierBlsBn254ZK_UnsupportedKeyTag
Reverts when the verification is not supported for the given key tag.


```solidity
error SigVerifierBlsBn254ZK_UnsupportedKeyTag();
```

