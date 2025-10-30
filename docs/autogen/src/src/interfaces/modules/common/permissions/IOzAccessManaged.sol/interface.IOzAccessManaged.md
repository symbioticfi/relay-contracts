# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/70dc1ae21bdebf08e2f01246a42e31aee6a1c39d/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

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

