# OzOwnable
[Git Source](https://github.com/symbioticfi/middleware-sdk/blob/884279eec0093e42a1a4da847149bdd39176d7f2/src/modules/common/permissions/OzOwnable.sol)

**Inherits:**
[PermissionManager](/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), OwnableUpgradeable, [IOzOwnable](/src/interfaces/modules/common/permissions/IOzOwnable.sol/interface.IOzOwnable.md)

Contract for permission management based on OpenZeppelin's Ownable.


## Functions
### __OzOwnable_init


```solidity
function __OzOwnable_init(
    OzOwnableInitParams memory initParams
) internal virtual onlyInitializing;
```

### _checkPermission


```solidity
function _checkPermission() internal view virtual override;
```

