# ValSetVerifier
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1eb6435a6ea47694d41a093f5c846d932f6a2f2b/src/libraries/utils/ValSetVerifier.sol)

Library for verifying the validity of validator set elements.


## State Variables
### VALIDATOR_SET_TREE_HEIGHT

```solidity
uint256 internal constant VALIDATOR_SET_TREE_HEIGHT = 0
```


### VALIDATORS_LIST_TREE_HEIGHT

```solidity
uint256 internal constant VALIDATORS_LIST_TREE_HEIGHT = 20
```


### VALIDATORS_LIST_MAX_LENGTH

```solidity
uint256 internal constant VALIDATORS_LIST_MAX_LENGTH = 1_048_576
```


### VALIDATOR_TREE_HEIGHT

```solidity
uint256 internal constant VALIDATOR_TREE_HEIGHT = 3
```


### KEY_LIST_TREE_HEIGHT

```solidity
uint256 internal constant KEY_LIST_TREE_HEIGHT = 7
```


### KEY_LIST_MAX_LENGTH

```solidity
uint256 internal constant KEY_LIST_MAX_LENGTH = 128
```


### VAULT_LIST_TREE_HEIGHT

```solidity
uint256 internal constant VAULT_LIST_TREE_HEIGHT = 10
```


### VAULT_LIST_MAX_LENGTH

```solidity
uint256 internal constant VAULT_LIST_MAX_LENGTH = 1024
```


### KEY_TREE_HEIGHT

```solidity
uint256 internal constant KEY_TREE_HEIGHT = 1
```


### VAULT_TREE_HEIGHT

```solidity
uint256 internal constant VAULT_TREE_HEIGHT = 2
```


### VALIDATOR_SET_VALIDATORS_BASE_INDEX

```solidity
uint256 internal constant VALIDATOR_SET_VALIDATORS_BASE_INDEX = 0
```


### VALIDATOR_OPERATOR_BASE_INDEX

```solidity
uint256 internal constant VALIDATOR_OPERATOR_BASE_INDEX = 0
```


### VALIDATOR_VOTING_POWER_BASE_INDEX

```solidity
uint256 internal constant VALIDATOR_VOTING_POWER_BASE_INDEX = 1
```


### VALIDATOR_IS_ACTIVE_BASE_INDEX

```solidity
uint256 internal constant VALIDATOR_IS_ACTIVE_BASE_INDEX = 2
```


### VALIDATOR_KEYS_BASE_INDEX

```solidity
uint256 internal constant VALIDATOR_KEYS_BASE_INDEX = 3
```


### VALIDATOR_VAULTS_BASE_INDEX

```solidity
uint256 internal constant VALIDATOR_VAULTS_BASE_INDEX = 4
```


### KEY_TAG_BASE_INDEX

```solidity
uint256 internal constant KEY_TAG_BASE_INDEX = 0
```


### KEY_PAYLOAD_HASH_BASE_INDEX

```solidity
uint256 internal constant KEY_PAYLOAD_HASH_BASE_INDEX = 1
```


### VAULT_CHAIN_ID_BASE_INDEX

```solidity
uint256 internal constant VAULT_CHAIN_ID_BASE_INDEX = 0
```


### VAULT_VAULT_BASE_INDEX

```solidity
uint256 internal constant VAULT_VAULT_BASE_INDEX = 1
```


### VAULT_VOTING_POWER_BASE_INDEX

```solidity
uint256 internal constant VAULT_VOTING_POWER_BASE_INDEX = 2
```


### SHA256_PRECOMPILE
The precompile address for SHA-256


```solidity
uint256 internal constant SHA256_PRECOMPILE = 0x02
```


### VALIDATORS_LIST_LOCAL_INDEX

```solidity
uint256 internal constant VALIDATORS_LIST_LOCAL_INDEX = VALIDATOR_SET_VALIDATORS_BASE_INDEX
```


### VALIDATOR_ROOT_MIN_LOCAL_INDEX

```solidity
uint256 internal constant VALIDATOR_ROOT_MIN_LOCAL_INDEX =
    VALIDATORS_LIST_LOCAL_INDEX << (1 + VALIDATORS_LIST_TREE_HEIGHT)
```


### VALIDATOR_ROOT_MAX_LOCAL_INDEX

```solidity
uint256 internal constant VALIDATOR_ROOT_MAX_LOCAL_INDEX =
    VALIDATOR_ROOT_MIN_LOCAL_INDEX + VALIDATORS_LIST_MAX_LENGTH
```


### VALIDATOR_ROOT_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VALIDATOR_ROOT_PROOF_EXPECTED_HEIGHT =
    VALIDATOR_SET_TREE_HEIGHT + 1 + VALIDATORS_LIST_TREE_HEIGHT
```


### VALIDATOR_OPERATOR_LOCAL_INDEX

```solidity
uint256 internal constant VALIDATOR_OPERATOR_LOCAL_INDEX = VALIDATOR_OPERATOR_BASE_INDEX
```


### VALIDATOR_OPERATOR_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VALIDATOR_OPERATOR_PROOF_EXPECTED_HEIGHT = VALIDATOR_TREE_HEIGHT
```


### VALIDATOR_VOTING_POWER_LOCAL_INDEX

```solidity
uint256 internal constant VALIDATOR_VOTING_POWER_LOCAL_INDEX = VALIDATOR_VOTING_POWER_BASE_INDEX
```


### VALIDATOR_VOTING_POWER_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VALIDATOR_VOTING_POWER_PROOF_EXPECTED_HEIGHT = VALIDATOR_TREE_HEIGHT
```


### VALIDATOR_IS_ACTIVE_LOCAL_INDEX

```solidity
uint256 internal constant VALIDATOR_IS_ACTIVE_LOCAL_INDEX = VALIDATOR_IS_ACTIVE_BASE_INDEX
```


### VALIDATOR_IS_ACTIVE_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VALIDATOR_IS_ACTIVE_PROOF_EXPECTED_HEIGHT = VALIDATOR_TREE_HEIGHT
```


### KEYS_LIST_LOCAL_INDEX

```solidity
uint256 internal constant KEYS_LIST_LOCAL_INDEX = VALIDATOR_KEYS_BASE_INDEX
```


### KEY_ROOT_MIN_LOCAL_INDEX

```solidity
uint256 internal constant KEY_ROOT_MIN_LOCAL_INDEX = KEYS_LIST_LOCAL_INDEX << (1 + KEY_LIST_TREE_HEIGHT)
```


### KEY_ROOT_MAX_LOCAL_INDEX

```solidity
uint256 internal constant KEY_ROOT_MAX_LOCAL_INDEX = KEY_ROOT_MIN_LOCAL_INDEX + KEY_LIST_MAX_LENGTH
```


### KEY_ROOT_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant KEY_ROOT_PROOF_EXPECTED_HEIGHT = VALIDATOR_TREE_HEIGHT + 1 + KEY_LIST_TREE_HEIGHT
```


### VAULTS_LIST_LOCAL_INDEX

```solidity
uint256 internal constant VAULTS_LIST_LOCAL_INDEX = VALIDATOR_VAULTS_BASE_INDEX
```


### VAULT_ROOT_MIN_LOCAL_INDEX

```solidity
uint256 internal constant VAULT_ROOT_MIN_LOCAL_INDEX = VAULTS_LIST_LOCAL_INDEX << (1 + VAULT_LIST_TREE_HEIGHT)
```


### VAULT_ROOT_MAX_LOCAL_INDEX

```solidity
uint256 internal constant VAULT_ROOT_MAX_LOCAL_INDEX = VAULT_ROOT_MIN_LOCAL_INDEX + VAULT_LIST_MAX_LENGTH
```


### VAULT_ROOT_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VAULT_ROOT_PROOF_EXPECTED_HEIGHT = VALIDATOR_TREE_HEIGHT + 1 + VAULT_LIST_TREE_HEIGHT
```


### KEY_TAG_LOCAL_INDEX

```solidity
uint256 internal constant KEY_TAG_LOCAL_INDEX = KEY_TAG_BASE_INDEX
```


### KEY_TAG_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant KEY_TAG_PROOF_EXPECTED_HEIGHT = KEY_TREE_HEIGHT
```


### KEY_PAYLOAD_HASH_LOCAL_INDEX

```solidity
uint256 internal constant KEY_PAYLOAD_HASH_LOCAL_INDEX = KEY_PAYLOAD_HASH_BASE_INDEX
```


### KEY_PAYLOAD_HASH_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant KEY_PAYLOAD_HASH_PROOF_EXPECTED_HEIGHT = KEY_TREE_HEIGHT
```


### VAULT_CHAIN_ID_LOCAL_INDEX

```solidity
uint256 internal constant VAULT_CHAIN_ID_LOCAL_INDEX = VAULT_CHAIN_ID_BASE_INDEX
```


### VAULT_CHAIN_ID_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VAULT_CHAIN_ID_PROOF_EXPECTED_HEIGHT = VAULT_TREE_HEIGHT
```


### VAULT_VAULT_LOCAL_INDEX

```solidity
uint256 internal constant VAULT_VAULT_LOCAL_INDEX = VAULT_VAULT_BASE_INDEX
```


### VAULT_VAULT_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VAULT_VAULT_PROOF_EXPECTED_HEIGHT = VAULT_TREE_HEIGHT
```


### VAULT_VOTING_POWER_LOCAL_INDEX

```solidity
uint256 internal constant VAULT_VOTING_POWER_LOCAL_INDEX = VAULT_VOTING_POWER_BASE_INDEX
```


### VAULT_VOTING_POWER_PROOF_EXPECTED_HEIGHT

```solidity
uint256 internal constant VAULT_VOTING_POWER_PROOF_EXPECTED_HEIGHT = VAULT_TREE_HEIGHT
```


## Functions
### verifyKey

Verifies that the key is in the validator set.


```solidity
function verifyKey(
    SszProof calldata validatorRootProof,
    uint256 validatorRootLocalIndex,
    bytes32 validatorSetRoot,
    SszProof calldata keyRootProof,
    uint256 keyRootLocalIndex,
    SszProof calldata keyTagProof,
    SszProof calldata keyPayloadHashProof
) internal view returns (bool isValid);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorRootProof`|`SszProof`|The proof of the validator root.|
|`validatorRootLocalIndex`|`uint256`|The local index of the validator root inside the validator set.|
|`validatorSetRoot`|`bytes32`|The validator set root.|
|`keyRootProof`|`SszProof`|The proof of the key root.|
|`keyRootLocalIndex`|`uint256`|The local index of the key root inside the validator.|
|`keyTagProof`|`SszProof`|The proof of the key tag.|
|`keyPayloadHashProof`|`SszProof`|The proof of the key hash.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isValid`|`bool`|If the key is in the validator set.|


### verifyVault

Verifies that the vault is in the validator set.


```solidity
function verifyVault(
    SszProof calldata validatorRootProof,
    uint256 validatorRootLocalIndex,
    bytes32 validatorSetRoot,
    SszProof calldata vaultRootProof,
    uint256 vaultRootLocalIndex,
    SszProof calldata vaultChainIdProof,
    SszProof calldata vaultVaultProof,
    SszProof calldata vaultVotingPowerProof
) internal view returns (bool isValid);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorRootProof`|`SszProof`|The proof of the validator root.|
|`validatorRootLocalIndex`|`uint256`|The local index of the validator root inside the validator set.|
|`validatorSetRoot`|`bytes32`|The validator set root.|
|`vaultRootProof`|`SszProof`|The proof of the vault root.|
|`vaultRootLocalIndex`|`uint256`|The local index of the vault root inside the validator.|
|`vaultChainIdProof`|`SszProof`|The proof of the vault chain ID.|
|`vaultVaultProof`|`SszProof`|The proof of the vault address.|
|`vaultVotingPowerProof`|`SszProof`|The proof of the vault voting power.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isValid`|`bool`|If the vault is in the validator set.|


### verifyOperator

Verifies that the operator address is in the validator set.


```solidity
function verifyOperator(
    SszProof calldata validatorRootProof,
    uint256 validatorRootLocalIndex,
    bytes32 validatorSetRoot,
    SszProof calldata operatorProof
) internal view returns (bool isValid);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorRootProof`|`SszProof`|The proof of the validator root.|
|`validatorRootLocalIndex`|`uint256`|The local index of the validator root inside the validator set.|
|`validatorSetRoot`|`bytes32`|The validator set root.|
|`operatorProof`|`SszProof`|The proof of the operator address.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isValid`|`bool`|If the operator address is in the validator set.|


### verifyVotingPower

Verifies that the validator's voting power is in the validator set.


```solidity
function verifyVotingPower(
    SszProof calldata validatorRootProof,
    uint256 validatorRootLocalIndex,
    bytes32 validatorSetRoot,
    SszProof calldata votingPowerProof
) internal view returns (bool isValid);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorRootProof`|`SszProof`|The proof of the validator root.|
|`validatorRootLocalIndex`|`uint256`|The local index of the validator root inside the validator set.|
|`validatorSetRoot`|`bytes32`|The validator set root.|
|`votingPowerProof`|`SszProof`|The proof of the voting power.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isValid`|`bool`|If the validator's voting power is in the validator set.|


### verifyIsActive

Verifies that the validator's activity status is in the validator set.


```solidity
function verifyIsActive(
    SszProof calldata validatorRootProof,
    uint256 validatorRootLocalIndex,
    bytes32 validatorSetRoot,
    SszProof calldata isActiveProof
) internal view returns (bool isValid);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorRootProof`|`SszProof`|The proof of the validator root.|
|`validatorRootLocalIndex`|`uint256`|The local index of the validator root inside the validator set.|
|`validatorSetRoot`|`bytes32`|The validator set root.|
|`isActiveProof`|`SszProof`|The proof of the validator's is active.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isValid`|`bool`|If the validator is active.|


### verifyValidatorRootLocal

Verifies that the validator root is in the validator set.


```solidity
function verifyValidatorRootLocal(
    SszProof calldata validatorRootProof,
    uint256 validatorRootLocalIndex,
    bytes32 validatorSetRoot
) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorRootProof`|`SszProof`|The proof of the validator root.|
|`validatorRootLocalIndex`|`uint256`|The local index of the validator root inside the validator set.|
|`validatorSetRoot`|`bytes32`|The validator set root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the validator root is in the validator set.|


### verifyValidatorOperatorLocal

Verifies that the operator address is in the validator.


```solidity
function verifyValidatorOperatorLocal(SszProof calldata validatorOperatorProof, bytes32 validatorRoot)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorOperatorProof`|`SszProof`|The proof of the operator address.|
|`validatorRoot`|`bytes32`|The validator root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the operator address is in the validator.|


### verifyValidatorVotingPowerLocal

Verifies that the validator's voting power is in the validator.


```solidity
function verifyValidatorVotingPowerLocal(SszProof calldata validatorVotingPowerProof, bytes32 validatorRoot)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorVotingPowerProof`|`SszProof`|The proof of the validator's voting power.|
|`validatorRoot`|`bytes32`|The validator root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the validator's voting power is in the validator.|


### verifyValidatorIsActiveLocal

Verifies that the validator's activity status is in the validator.


```solidity
function verifyValidatorIsActiveLocal(SszProof calldata validatorIsActiveProof, bytes32 validatorRoot)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validatorIsActiveProof`|`SszProof`|The proof of the validator's activity status.|
|`validatorRoot`|`bytes32`|The validator root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the validator's activity status is in the validator.|


### verifyValidatorKeyRootLocal

Verifies that the key root is in the validator.


```solidity
function verifyValidatorKeyRootLocal(
    SszProof calldata keyRootProof,
    uint256 keyRootLocalIndex,
    bytes32 validatorRoot
) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyRootProof`|`SszProof`|The proof of the key root.|
|`keyRootLocalIndex`|`uint256`|The local index of the key root inside the validator.|
|`validatorRoot`|`bytes32`|The validator root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the key root is in the validator.|


### verifyValidatorVaultRootLocal

Verifies that the vault root is in the validator.


```solidity
function verifyValidatorVaultRootLocal(
    SszProof calldata vaultRootProof,
    uint256 vaultRootLocalIndex,
    bytes32 validatorRoot
) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vaultRootProof`|`SszProof`|The proof of the vault root.|
|`vaultRootLocalIndex`|`uint256`|The local index of the vault root inside the validator.|
|`validatorRoot`|`bytes32`|The validator root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the vault root is in the validator.|


### verifyKeyTagLocal

Verifies that the key tag is in the key.


```solidity
function verifyKeyTagLocal(SszProof calldata keyTagProof, bytes32 keyRoot) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyTagProof`|`SszProof`|The proof of the key tag.|
|`keyRoot`|`bytes32`|The key root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the key tag is in the key.|


### verifyKeyPayloadHash

Verifies that the key hash is in the key.


```solidity
function verifyKeyPayloadHash(SszProof calldata keyPayloadHashProof, bytes32 keyRoot) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`keyPayloadHashProof`|`SszProof`|The proof of the key hash.|
|`keyRoot`|`bytes32`|The key root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the key hash is in the key.|


### verifyVaultChainIdLocal

Verifies that the vault's chain ID is in the vault.


```solidity
function verifyVaultChainIdLocal(SszProof calldata vaultChainIdProof, bytes32 vaultRoot)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vaultChainIdProof`|`SszProof`|The proof of the vault chain ID.|
|`vaultRoot`|`bytes32`|The vault root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the vault's chain ID is in the vault.|


### verifyVaultVaultLocal

Verifies that the vault address is in the vault.


```solidity
function verifyVaultVaultLocal(SszProof calldata vaultVaultProof, bytes32 vaultRoot) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vaultVaultProof`|`SszProof`|The proof of the vault address.|
|`vaultRoot`|`bytes32`|The vault root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the vault address is in the vault.|


### verifyVaultVotingPowerLocal

Verifies that the vault's voting power is in the vault.


```solidity
function verifyVaultVotingPowerLocal(SszProof calldata vaultVotingPowerProof, bytes32 vaultRoot)
    internal
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vaultVotingPowerProof`|`SszProof`|The proof of the vault voting power.|
|`vaultRoot`|`bytes32`|The vault root.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|isValid If the vault's voting power is in the vault.|


### processInclusionProofSha256

Processes an inclusion proof with a SHA256 hash.

In case of an invalid proof length, we return false which is to be handled by the caller.
In case of a failed SHA-256 call, we revert.


```solidity
function processInclusionProofSha256(
    bytes32[] calldata proof,
    bytes32 leaf,
    bytes32 root,
    uint256 localIndex,
    uint256 expectedHeight
) internal view returns (bool valid);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`proof`|`bytes32[]`|The inclusion proof.|
|`leaf`|`bytes32`|The leaf to be proven.|
|`root`|`bytes32`|The root to reconcile the proof against.|
|`localIndex`|`uint256`|The local index of the leaf.|
|`expectedHeight`|`uint256`|The height of the tree that the proof is for.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`valid`|`bool`|A boolean indicating whether the derived root from the proof matches the `root` provided.|


## Structs
### Key
The validator's key.


```solidity
struct Key {
    uint8 tag;
    bytes32 payloadHash;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`tag`|`uint8`|The key tag.|
|`payloadHash`|`bytes32`|The hash of the key.|

### Vault
The validator's vault.


```solidity
struct Vault {
    uint64 chainId;
    address vault;
    uint256 votingPower;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`chainId`|`uint64`|The chain ID.|
|`vault`|`address`|The vault address.|
|`votingPower`|`uint256`|The voting power.|

### Validator
The validator.

The voting power may not be equal to the sum of the voting powers inside the vaults.


```solidity
struct Validator {
    address operator;
    uint256 votingPower;
    bool isActive;
    Key[] keys;
    Vault[] vaults;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator address.|
|`votingPower`|`uint256`|The voting power.|
|`isActive`|`bool`|If the validator is active.|
|`keys`|`Key[]`|The validator's keys.|
|`vaults`|`Vault[]`|The validator's vaults.|

### ValidatorSet
The validator set.


```solidity
struct ValidatorSet {
    Validator[] validators;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`validators`|`Validator[]`|The validators in the validator set.|

### SszProof
The Merkle proof.


```solidity
struct SszProof {
    bytes32 leaf;
    bytes32[] proof;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`leaf`|`bytes32`|The leaf to prove.|
|`proof`|`bytes32[]`|The proof.|

