# OzOwnable
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/modules/common/permissions/OzOwnable.sol)

**Inherits:**
[PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), OwnableUpgradeable, [IOzOwnable](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/common/permissions/IOzOwnable.sol/interface.IOzOwnable.md)

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

