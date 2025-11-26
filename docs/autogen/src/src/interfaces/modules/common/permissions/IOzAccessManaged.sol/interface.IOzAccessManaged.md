# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/1eb6435a6ea47694d41a093f5c846d932f6a2f2b/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

**Inherits:**
[IPermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/base/IPermissionManager.sol/interface.IPermissionManager.md), IAccessManaged

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

