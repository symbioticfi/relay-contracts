# OzAccessManaged
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/90b476bb8f01dc59dc602dcd0b4e541b7aed48d5/src/modules/common/permissions/OzAccessManaged.sol)

**Inherits:**
[PermissionManager](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), AccessManagedUpgradeable, [IOzAccessManaged](/Users/andreikorokhov/symbiotic/relay-contracts/docs/autogen/src/src/interfaces/modules/common/permissions/IOzAccessManaged.sol/interface.IOzAccessManaged.md)

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

