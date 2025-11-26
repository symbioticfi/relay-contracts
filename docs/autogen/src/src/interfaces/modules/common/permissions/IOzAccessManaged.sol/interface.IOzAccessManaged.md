# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/3555af95a3dd521f0c0f40867fec8f48136f728e/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

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

