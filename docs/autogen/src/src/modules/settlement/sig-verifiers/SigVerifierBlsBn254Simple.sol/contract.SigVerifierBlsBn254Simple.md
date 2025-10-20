# SigVerifierBlsBn254Simple
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/b47510b803cc7bdc2bd336dbdbf5918993c63228/src/modules/settlement/sig-verifiers/SigVerifierBlsBn254Simple.sol)

**Inherits:**
[ISigVerifierBlsBn254Simple](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254Simple.sol/interface.ISigVerifierBlsBn254Simple.md)

Contract for verifying validator's set attestations based on BLS signatures on the BN254 curve
by decompressing the whole validator set on-chain.


## State Variables
### VERIFICATION_TYPE
Returns the type of the signature verification.


```solidity
uint32 public constant VERIFICATION_TYPE = 1
```


### VALIDATOR_SET_HASH_KECCAK256_HASH
Returns the marker for extra data fetching of the validator set keccak256 hash.


```solidity
bytes32 public constant VALIDATOR_SET_HASH_KECCAK256_HASH = keccak256("validatorSetHashKeccak256")
```


### AGGREGATED_PUBLIC_KEY_G1_HASH
Returns the marker for extra data fetching of the aggregated public key G1.

The public key is compressed to one bytes32 slot.


```solidity
bytes32 public constant AGGREGATED_PUBLIC_KEY_G1_HASH = keccak256("aggPublicKeyG1")
```


### MAX_VALIDATORS
Returns the maximum allowed number of validators for this verification mechanism.

The maximum exists because each non-signer's index is encoded as a 2 bytes value.


```solidity
uint256 public constant MAX_VALIDATORS = 65_536
```


## Functions
### verifyQuorumSig

Returns the result of the quorum signature verification.


```solidity
function verifyQuorumSig(
    address settlement,
    uint48 epoch,
    bytes memory message,
    uint8 keyTag,
    uint256 quorumThreshold,
    bytes calldata proof
) public view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`settlement`|`address`|The address of the Settlement contract.|
|`epoch`|`uint48`|The epoch from which the validator set is to use.|
|`message`|`bytes`|The message to verify.|
|`keyTag`|`uint8`|The tag of the key.|
|`quorumThreshold`|`uint256`|The quorum threshold (in absolute terms).|
|`proof`|`bytes`|The proof (depends on the verification type).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The result of the quorum signature verification.|


