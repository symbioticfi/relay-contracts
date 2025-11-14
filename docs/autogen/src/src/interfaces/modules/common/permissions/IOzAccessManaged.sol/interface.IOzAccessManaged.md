# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

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

