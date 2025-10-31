# ISettlement
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/90b476bb8f01dc59dc602dcd0b4e541b7aed48d5/src/interfaces/modules/settlement/ISettlement.sol)

Interface for the Settlement contract.


## Functions
### VALIDATOR_SET_VERSION

Returns the version of the validator set.


```solidity
function VALIDATOR_SET_VERSION() external view returns (uint8);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The version of the validator set.|


### getSigVerifierAt

Returns the quorum signature verifier at the given epoch.


```solidity
function getSigVerifierAt(uint48 epoch, bytes memory hint) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|
|`hint`|`bytes`|The hint for the quorum signature verifier.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The quorum signature verifier at the given epoch.|


### getSigVerifier

Returns the quorum signature verifier.


```solidity
function getSigVerifier() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The quorum signature verifier.|


### getLastCommittedHeaderEpoch

Returns the epoch of the last committed validator set header.


```solidity
function getLastCommittedHeaderEpoch() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The epoch of the last committed validator set header.|


### isValSetHeaderCommittedAt

Returns if the validator set header is committed at the given epoch.


```solidity
function isValSetHeaderCommittedAt(uint48 epoch) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the validator set header is committed at the given epoch.|


### getValSetHeaderHashAt

Returns the hash of the validator set header at the given epoch.


```solidity
function getValSetHeaderHashAt(uint48 epoch) external view returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The hash of the validator set header at the given epoch.|


### getValSetHeaderHash

Returns the hash of the last committed validator set header.


```solidity
function getValSetHeaderHash() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The hash of the last committed validator set header.|


### getValSetHeaderAt

Returns the validator set header at the given epoch.


```solidity
function getValSetHeaderAt(uint48 epoch) external view returns (ValSetHeader memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`ValSetHeader`|The validator set header at the given epoch.|


### getValSetHeader

Returns the last committed validator set header.


```solidity
function getValSetHeader() external view returns (ValSetHeader memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`ValSetHeader`|The last committed validator set header.|


### getVersionFromValSetHeaderAt

Returns the version of the validator set header at the given epoch.


```solidity
function getVersionFromValSetHeaderAt(uint48 epoch) external view returns (uint8);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The version of the validator set header at the given epoch.|


### getVersionFromValSetHeader

Returns the version from the last committed validator set header.


```solidity
function getVersionFromValSetHeader() external view returns (uint8);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The version from the last committed validator set header.|


### getRequiredKeyTagFromValSetHeaderAt

Returns the required key tag from the validator set header at the given epoch.


```solidity
function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) external view returns (uint8);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The required key tag from the validator set header at the given epoch.|


### getRequiredKeyTagFromValSetHeader

Returns the required key tag from the last committed validator set header.


```solidity
function getRequiredKeyTagFromValSetHeader() external view returns (uint8);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The required key tag from the last committed validator set header.|


### getCaptureTimestampFromValSetHeaderAt

Returns the capture timestamp from the validator set header at the given epoch.


```solidity
function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) external view returns (uint48);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The capture timestamp from the validator set header at the given epoch.|


### getCaptureTimestampFromValSetHeader

Returns the capture timestamp from the last committed validator set header.


```solidity
function getCaptureTimestampFromValSetHeader() external view returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The capture timestamp from the last committed validator set header.|


### getQuorumThresholdFromValSetHeaderAt

Returns the quorum threshold from the validator set header at the given epoch.


```solidity
function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The quorum threshold from the validator set header at the given epoch.|


### getQuorumThresholdFromValSetHeader

Returns the quorum threshold from the last committed validator set header.


```solidity
function getQuorumThresholdFromValSetHeader() external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The quorum threshold from the last committed validator set header.|


### getTotalVotingPowerFromValSetHeaderAt

Returns the total voting power from the validator set header at the given epoch.


```solidity
function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The total voting power from the validator set header at the given epoch.|


### getTotalVotingPowerFromValSetHeader

Returns the total voting power from the last committed validator set header.


```solidity
function getTotalVotingPowerFromValSetHeader() external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The total voting power from the last committed validator set header.|


### getValidatorsSszMRootFromValSetHeaderAt

Returns the validator set SSZ root from the validator set header at the given epoch.


```solidity
function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) external view returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The validator set SSZ root from the validator set header at the given epoch.|


### getValidatorsSszMRootFromValSetHeader

Returns the validator set SSZ root from the last committed validator set header.


```solidity
function getValidatorsSszMRootFromValSetHeader() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The validator set SSZ root from the last committed validator set header.|


### getExtraDataAt

Returns the extra data at the given epoch for a certain key.


```solidity
function getExtraDataAt(uint48 epoch, bytes32 key) external view returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`epoch`|`uint48`|The epoch.|
|`key`|`bytes32`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The extra data at the given epoch for a certain key.|


### getExtraData

Returns the extra data from the last committed epoch for a certain key.


```solidity
function getExtraData(bytes32 key) external view returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`key`|`bytes32`|The key.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The extra data from the last committed epoch for a certain key.|


### verifyQuorumSigAt

Returns the result of the quorum signature verification for the given message at the given epoch.


```solidity
function verifyQuorumSigAt(
    bytes memory message,
    uint8 keyTag,
    uint256 quorumThreshold,
    bytes calldata proof,
    uint48 epoch,
    bytes memory hint
) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`message`|`bytes`|The message to verify.|
|`keyTag`|`uint8`|The key tag to use for the quorum signature verification.|
|`quorumThreshold`|`uint256`|The quorum threshold to require for the quorum signature verification.|
|`proof`|`bytes`|The proof to verify the quorum signature.|
|`epoch`|`uint48`|The epoch.|
|`hint`|`bytes`|The hint to optimize the signature verifier fetching.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The result of the quorum signature verification for the given message at the given epoch.|


### verifyQuorumSig

Returns the result of the quorum signature verification for the given message using the last committed validator set header.


```solidity
function verifyQuorumSig(bytes memory message, uint8 keyTag, uint256 quorumThreshold, bytes calldata proof)
    external
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`message`|`bytes`|The message to verify.|
|`keyTag`|`uint8`|The key tag to use for the quorum signature verification.|
|`quorumThreshold`|`uint256`|The quorum threshold to require for the quorum signature verification.|
|`proof`|`bytes`|The proof to verify the quorum signature.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The result of the quorum signature verification for the given message using the last committed validator set header.|


### setSigVerifier

Sets the quorum signature verifier.

The new verifier will be "committed" only in the next epoch.

The caller must have the needed permission.


```solidity
function setSigVerifier(address sigVerifier) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sigVerifier`|`address`|The address of the quorum signature verifier.|


### setGenesis

Sets the genesis validator set header and its extra data.

The caller must have the needed permission.
Can be called multiple times.


```solidity
function setGenesis(ValSetHeader calldata valSetHeader, ExtraData[] calldata extraData) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`valSetHeader`|`ValSetHeader`|The validator set header.|
|`extraData`|`ExtraData[]`|The extra data.|


### commitValSetHeader

Commits the validator set header and its extra data.

The caller can be anyone, the call is validated by verification of the validator set's attestation.


```solidity
function commitValSetHeader(ValSetHeader calldata header, ExtraData[] calldata extraData, bytes calldata proof)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`header`|`ValSetHeader`|The validator set header.|
|`extraData`|`ExtraData[]`|The extra data.|
|`proof`|`bytes`|The proof to verify the quorum signature.|


## Events
### InitSigVerifier
Emitted during the Settlement initialization.


```solidity
event InitSigVerifier(address sigVerifier);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sigVerifier`|`address`|The address of the quorum signature verifier.|

### SetSigVerifier
Emitted when the quorum signature verifier is set.

The new verifier will be "committed" only in the next epoch.


```solidity
event SetSigVerifier(address sigVerifier);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sigVerifier`|`address`|The address of the quorum signature verifier.|

### SetGenesis
Emitted when the genesis is set.


```solidity
event SetGenesis(ValSetHeader valSetHeader, ExtraData[] extraData);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`valSetHeader`|`ValSetHeader`|The validator set header.|
|`extraData`|`ExtraData[]`|The extra data.|

### CommitValSetHeader
Emitted when the validator set header is committed.


```solidity
event CommitValSetHeader(ValSetHeader valSetHeader, ExtraData[] extraData);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`valSetHeader`|`ValSetHeader`|The validator set header.|
|`extraData`|`ExtraData[]`|The extra data.|

## Errors
### Settlement_DuplicateExtraDataKey
Reverts when the extra data key is duplicated.


```solidity
error Settlement_DuplicateExtraDataKey();
```

### Settlement_InvalidCaptureTimestamp
Reverts when the capture timestamp is less than or equal to the capture timestamp of the latest committed header,
or greater than or equal to the current timestamp.


```solidity
error Settlement_InvalidCaptureTimestamp();
```

### Settlement_InvalidEpoch
Reverts when the proposed during the commit epoch is less than or equal to the latest committed one.


```solidity
error Settlement_InvalidEpoch();
```

### Settlement_InvalidSigVerifier
Reverts when the new quorum signature verifier is zero.


```solidity
error Settlement_InvalidSigVerifier();
```

### Settlement_InvalidValidatorsSszMRoot
Reverts when the validator set SSZ root is zero.


```solidity
error Settlement_InvalidValidatorsSszMRoot();
```

### Settlement_InvalidVersion
Reverts when the version to be committed is not the same as the version inside the contract.

Can be triggered during the upgrades.


```solidity
error Settlement_InvalidVersion();
```

### Settlement_QuorumThresholdGtTotalVotingPower
Reverts when the quorum threshold is greater than the total voting power.


```solidity
error Settlement_QuorumThresholdGtTotalVotingPower();
```

### Settlement_ValSetHeaderAlreadyCommitted
Reverts when the validator set header is already committed for the proposed epoch.


```solidity
error Settlement_ValSetHeaderAlreadyCommitted();
```

### Settlement_VerificationFailed
Reverts when the quorum signature verification fails.


```solidity
error Settlement_VerificationFailed();
```

## Structs
### SettlementStorage
The storage of the Settlement contract.

**Note:**
storage-location: ERC-7201 slot: erc7201:symbiotic.storage.Settlement.


```solidity
struct SettlementStorage {
    uint48 _lastCommittedHeaderEpoch;
    Checkpoints.Trace208 _sigVerifier;
    mapping(uint48 epoch => ValSetHeader) _valSetHeader;
    mapping(uint48 epoch => mapping(bytes32 key => bytes32 value)) _extraData;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_lastCommittedHeaderEpoch`|`uint48`|The epoch of the last committed header.|
|`_sigVerifier`|`Checkpoints.Trace208`|The address of the quorum signature verifier.|
|`_valSetHeader`|`mapping(uint48 epoch => ValSetHeader)`|The mapping from the epoch to the validator set header.|
|`_extraData`|`mapping(uint48 epoch => mapping(bytes32 key => bytes32 value))`|The mapping from the epoch and the key to the extra data.|

### SettlementInitParams
The parameters for the initialization of the Settlement contract.


```solidity
struct SettlementInitParams {
    INetworkManager.NetworkManagerInitParams networkManagerInitParams;
    IOzEIP712.OzEIP712InitParams ozEip712InitParams;
    address sigVerifier;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`networkManagerInitParams`|`INetworkManager.NetworkManagerInitParams`|The parameters for the initialization of the NetworkManager.|
|`ozEip712InitParams`|`IOzEIP712.OzEIP712InitParams`|The parameters for the initialization of the OzEIP712.|
|`sigVerifier`|`address`|The address of the quorum signature verifier.|

### ValSetHeader
The validator set header.


```solidity
struct ValSetHeader {
    uint8 version;
    uint8 requiredKeyTag;
    uint48 epoch;
    uint48 captureTimestamp;
    uint256 quorumThreshold;
    uint256 totalVotingPower;
    bytes32 validatorsSszMRoot;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`version`|`uint8`|The version of the validator set header.|
|`requiredKeyTag`|`uint8`|The required key tag for the validator set header using which the next header will be committed.|
|`epoch`|`uint48`|The epoch of the validator set.|
|`captureTimestamp`|`uint48`|The capture timestamp of the validator set.|
|`quorumThreshold`|`uint256`|The quorum threshold of the validator set header which will need to be reached to commit the next header.|
|`totalVotingPower`|`uint256`|The total voting power of the validator set.|
|`validatorsSszMRoot`|`bytes32`|The validator set SSZ root.|

### ExtraData
The extra data.

This key-value storage is fully flexible and can be used to store any data (e.g., verification-specific aggregated data).


```solidity
struct ExtraData {
    bytes32 key;
    bytes32 value;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`key`|`bytes32`|The key to store the extra data with.|
|`value`|`bytes32`|The value of the extra data.|

