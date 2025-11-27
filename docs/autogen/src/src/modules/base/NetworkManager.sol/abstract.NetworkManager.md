# NetworkManager
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/fe77da97c5078ce867ab7509d4925a7d24b41b38/src/modules/base/NetworkManager.sol)

**Inherits:**
Initializable, StaticDelegateCallable, [INetworkManager](/src/interfaces/modules/base/INetworkManager.sol/interface.INetworkManager.md)

**Title:**
NetworkManager

Contract for managing the network and subnetwork getters.


## State Variables
### NetworkManagerLocation

```solidity
bytes32 private constant NetworkManagerLocation =
    0x779150488f5e984d1f840ba606e388ada6c73b44f261274c3595c61a30023e00
```


## Functions
### _getNetworkManagerStorage


```solidity
function _getNetworkManagerStorage() internal pure returns (INetworkManager.NetworkManagerStorage storage $);
```

### __NetworkManager_init


```solidity
function __NetworkManager_init(NetworkManagerInitParams memory initParams) internal virtual onlyInitializing;
```

### NETWORK

Returns the address of the network.


```solidity
function NETWORK() public view virtual returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the network.|


### SUBNETWORK_IDENTIFIER

Returns the identifier of the subnetwork.


```solidity
function SUBNETWORK_IDENTIFIER() public view virtual returns (uint96);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint96`|The identifier of the subnetwork.|


### SUBNETWORK

Returns the subnetwork (a concatenation of the network and the subnetwork ID).


```solidity
function SUBNETWORK() public view virtual returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The subnetwork.|


