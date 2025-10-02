# IVerifier
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/interfaces/modules/settlement/sig-verifiers/zk/IVerifier.sol)


## Functions
### verifyProof

Verifies a ZK proof for the given input.

*Reverts if the proof is invalid.*


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


