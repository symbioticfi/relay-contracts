# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/773ae3c4e705581f92fbc339ac410d52ee1220ab/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

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

