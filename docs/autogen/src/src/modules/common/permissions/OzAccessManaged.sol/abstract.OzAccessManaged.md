# OzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/743070d7a1fd569c1fffbb25c8d6a65e2730829c/src/modules/common/permissions/OzAccessManaged.sol)

**Inherits:**
[PermissionManager](/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), AccessManagedUpgradeable, [IOzAccessManaged](/src/interfaces/modules/common/permissions/IOzAccessManaged.sol/interface.IOzAccessManaged.md)

**Title:**
OzAccessManaged

Contract for permission management based on OpenZeppelin's AccessManaged.


## Functions
### __OzAccessManaged_init


```solidity
function __OzAccessManaged_init(OzAccessManagedInitParams memory initParams) internal virtual onlyInitializing;
```

### _checkPermission


```solidity
function _checkPermission() internal virtual override;
```

