# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/743070d7a1fd569c1fffbb25c8d6a65e2730829c/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

**Inherits:**
[IPermissionManager](/src/interfaces/modules/base/IPermissionManager.sol/interface.IPermissionManager.md), IAccessManaged

**Title:**
IOzAccessManaged

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

