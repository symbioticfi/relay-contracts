# SigVerifierBlsBn254ZK
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/a628ce262ee9e6c40296d23589814df8e1ae8606/src/modules/settlement/sig-verifiers/SigVerifierBlsBn254ZK.sol)

**Inherits:**
[ISigVerifierBlsBn254ZK](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254ZK.sol/interface.ISigVerifierBlsBn254ZK.md)

Contract for verifying validator's set attestations based on BLS signatures on the BN254 curve
by decompressing the whole validator set using ZK.


## State Variables
### VERIFICATION_TYPE
Returns the type of the signature verification.


```solidity
uint32 public constant VERIFICATION_TYPE = 0
```


### TOTAL_ACTIVE_VALIDATORS_HASH
Returns the marker for extra data fetching of the total active validators.


```solidity
bytes32 public constant TOTAL_ACTIVE_VALIDATORS_HASH = keccak256("totalActiveValidators")
```


### VALIDATOR_SET_HASH_MIMC_HASH
Returns the marker for extra data fetching of the validator set MiMC hash.


```solidity
bytes32 public constant VALIDATOR_SET_HASH_MIMC_HASH = keccak256("validatorSetHashMimc")
```


### verifiers
Returns the verifier at the given index.


```solidity
address[] public verifiers
```


### maxValidators
Returns the maximum supported number of validators for the verifier at the given index.


```solidity
uint256[] public maxValidators
```


## Functions
### constructor


```solidity
constructor(address[] memory verifiers_, uint256[] memory maxValidators_) ;
```

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


### _getVerifier


```solidity
function _getVerifier(uint256 totalActiveValidators) internal view returns (address);
```

