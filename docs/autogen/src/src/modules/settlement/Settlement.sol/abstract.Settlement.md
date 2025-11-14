# Settlement
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/modules/settlement/Settlement.sol)

**Inherits:**
[NetworkManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/NetworkManager.sol/abstract.NetworkManager.md), [OzEIP712](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/OzEIP712.sol/abstract.OzEIP712.md), [PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), [ISettlement](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/settlement/ISettlement.sol/interface.ISettlement.md)

Contract for processing the validator sets through epochs and allowing verifying their attestations on-chain.


## State Variables
### VALIDATOR_SET_VERSION
Returns the version of the validator set.


```solidity
uint8 public constant VALIDATOR_SET_VERSION = 1
```


### VALSET_HEADER_COMMIT_TYPEHASH

```solidity
bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
    keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash,bytes32 extraDataHash)")
```


### SettlementStorageLocation

```solidity
bytes32 private constant SettlementStorageLocation =
    0xad58d27706f0faa4634000571d7d9c19a0123d182a06ad775cbe8a9c22f64400
```


## Functions
### _getSettlementStorage


```solidity
function _getSettlementStorage() internal pure returns (SettlementStorage storage $);
```

### __Settlement_init


```solidity
function __Settlement_init(SettlementInitParams memory settlementInitParams) internal virtual onlyInitializing;
```

### getSigVerifierAt

Returns the quorum signature verifier at the given epoch.


```solidity
function getSigVerifierAt(uint48 epoch, bytes memory hint) public view virtual returns (address);
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
function getSigVerifier() public view virtual returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The quorum signature verifier.|


### getLastCommittedHeaderEpoch

Returns the epoch of the last committed validator set header.


```solidity
function getLastCommittedHeaderEpoch() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The epoch of the last committed validator set header.|


### isValSetHeaderCommittedAt

Returns if the validator set header is committed at the given epoch.


```solidity
function isValSetHeaderCommittedAt(uint48 epoch) public view virtual returns (bool);
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
function getValSetHeaderHashAt(uint48 epoch) public view returns (bytes32);
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
function getValSetHeaderHash() public view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The hash of the last committed validator set header.|


### getValSetHeaderAt

Returns the validator set header at the given epoch.


```solidity
function getValSetHeaderAt(uint48 epoch) public view virtual returns (ValSetHeader memory);
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
function getValSetHeader() public view virtual returns (ValSetHeader memory header);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`header`|`ValSetHeader`|The last committed validator set header.|


### getVersionFromValSetHeaderAt

Returns the version of the validator set header at the given epoch.


```solidity
function getVersionFromValSetHeaderAt(uint48 epoch) public view virtual returns (uint8);
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
function getVersionFromValSetHeader() public view virtual returns (uint8);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The version from the last committed validator set header.|


### getRequiredKeyTagFromValSetHeaderAt

Returns the required key tag from the validator set header at the given epoch.


```solidity
function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) public view virtual returns (uint8);
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
function getRequiredKeyTagFromValSetHeader() public view virtual returns (uint8);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint8`|The required key tag from the last committed validator set header.|


### getCaptureTimestampFromValSetHeaderAt

Returns the capture timestamp from the validator set header at the given epoch.


```solidity
function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) public view virtual returns (uint48);
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
function getCaptureTimestampFromValSetHeader() public view virtual returns (uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint48`|The capture timestamp from the last committed validator set header.|


### getQuorumThresholdFromValSetHeaderAt

Returns the quorum threshold from the validator set header at the given epoch.


```solidity
function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) public view virtual returns (uint256);
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
function getQuorumThresholdFromValSetHeader() public view virtual returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The quorum threshold from the last committed validator set header.|


### getTotalVotingPowerFromValSetHeaderAt

Returns the total voting power from the validator set header at the given epoch.


```solidity
function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) public view virtual returns (uint256);
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
function getTotalVotingPowerFromValSetHeader() public view virtual returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The total voting power from the last committed validator set header.|


### getValidatorsSszMRootFromValSetHeaderAt

Returns the validator set SSZ root from the validator set header at the given epoch.


```solidity
function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) public view virtual returns (bytes32);
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
function getValidatorsSszMRootFromValSetHeader() public view virtual returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The validator set SSZ root from the last committed validator set header.|


### getExtraDataAt

Returns the extra data at the given epoch for a certain key.


```solidity
function getExtraDataAt(uint48 epoch, bytes32 key) public view virtual returns (bytes32);
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
function getExtraData(bytes32 key) public view virtual returns (bytes32);
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
) public view virtual returns (bool);
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
    public
    view
    virtual
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


```solidity
function setSigVerifier(address sigVerifier) public virtual checkPermission;
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
function setGenesis(ValSetHeader calldata valSetHeader, ExtraData[] calldata extraData)
    public
    virtual
    checkPermission;
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
    public
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`header`|`ValSetHeader`|The validator set header.|
|`extraData`|`ExtraData[]`|The extra data.|
|`proof`|`bytes`|The proof to verify the quorum signature.|


### _setValSetHeader


```solidity
function _setValSetHeader(ValSetHeader calldata header, ExtraData[] calldata extraData) internal virtual;
```

### _getCurrentValue


```solidity
function _getCurrentValue(Checkpoints.Trace208 storage trace, uint48 currentTimepoint)
    internal
    view
    virtual
    returns (uint208);
```

