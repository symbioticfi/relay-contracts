# OzOwnable
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9853e60a660dc25d05a02ef98e2b218dd40efcc4/src/modules/common/permissions/OzOwnable.sol)

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

