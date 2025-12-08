# IOzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/378b3fa543dbcf48fbf7694e797030129cda42ef/src/interfaces/modules/common/permissions/IOzAccessManaged.sol)

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

