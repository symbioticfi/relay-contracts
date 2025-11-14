# IVerifier
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/interfaces/modules/settlement/sig-verifiers/zk/IVerifier.sol)

Interface for the gnark verifier contracts.


## Functions
### verifyProof

Verifies a ZK proof for the given input.

Reverts if the proof is invalid.


```solidity
function verifyProof(
    uint256[8] calldata proof,
    uint256[2] calldata commitments,
    uint256[2] calldata commitmentPok,
    uint256[1] calldata input
) external view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`proof`|`uint256[8]`|The ZK proof.|
|`commitments`|`uint256[2]`|The commitments.|
|`commitmentPok`|`uint256[2]`|The commitment proof of knowledge.|
|`input`|`uint256[1]`|The circuit public input.|


