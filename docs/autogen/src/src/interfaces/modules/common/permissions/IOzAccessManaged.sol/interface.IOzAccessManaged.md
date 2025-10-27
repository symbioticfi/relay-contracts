# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/140d36e839baf722c6672300f13ab7489a8ea2bc/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

Interface for the OzAccessManaged contract.


## Structs
### OzAccessManagedInitParams
The parameters for the initialization of the OzAccessManaged contract.


```solidity
struct OzAccessManagedInitParams {
    address authority;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`authority`|`address`|The address of the authority that will check the access.|

