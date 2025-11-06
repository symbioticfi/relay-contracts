# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1e5359cf6070a0b4aae5d36e84302fa6de3a57c7/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

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

