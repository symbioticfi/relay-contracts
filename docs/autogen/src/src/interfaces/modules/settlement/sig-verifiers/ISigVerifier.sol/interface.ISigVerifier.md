# ISigVerifier
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/f15b7f1298f3e89ef5f17b3ef10b20d2dc6845d4/src/interfaces/modules/settlement/sig-verifiers/ISigVerifier.sol)

Interface for the signature verifier contracts.


## Functions
### VERIFICATION_TYPE

Returns the type of the signature verification.


```solidity
function VERIFICATION_TYPE() external view returns (uint32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint32`|The type of the signature verification.|


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
) external view returns (bool);
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


