# OzOwnable
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9b9397f972967c27019ba88b9cb96dce82bcc4be/src/modules/common/permissions/OzOwnable.sol)

**Inherits:**
[PermissionManager](/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), OwnableUpgradeable, [IOzOwnable](/src/interfaces/modules/common/permissions/IOzOwnable.sol/interface.IOzOwnable.md)

**Title:**
OzOwnable

Contract for permission management based on OpenZeppelin's Ownable.


## Functions
### __OzOwnable_init


```solidity
function __OzOwnable_init(OzOwnableInitParams memory initParams) internal virtual onlyInitializing;
```

### _checkPermission


```solidity
function _checkPermission() internal view virtual override;
```

