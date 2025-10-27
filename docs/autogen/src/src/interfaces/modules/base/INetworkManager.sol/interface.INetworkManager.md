# INetworkManager
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/aa502a4be47c86d613c9f5ee2cc50ded6e2cee52/src/interfaces/modules/base/INetworkManager.sol)

Interface for the NetworkManager contract.


## Functions
### NETWORK

Returns the address of the network.


```solidity
function NETWORK() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the network.|


### SUBNETWORK_IDENTIFIER

Returns the identifier of the subnetwork.


```solidity
function SUBNETWORK_IDENTIFIER() external view returns (uint96);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint96`|The identifier of the subnetwork.|


### SUBNETWORK

Returns the subnetwork (a concatenation of the network and the subnetwork ID).


```solidity
function SUBNETWORK() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The subnetwork.|


## Events
### InitSubnetwork
Emitted during the NetworkManager initialization.


```solidity
event InitSubnetwork(address network, uint96 subnetworkId);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`network`|`address`|The address of the network.|
|`subnetworkId`|`uint96`|The identifier of the subnetwork.|

## Errors
### NetworkManager_InvalidNetwork
Reverts when the network is zero address.


```solidity
error NetworkManager_InvalidNetwork();
```

## Structs
### NetworkManagerStorage
The storage of the NetworkManager contract.

The whole set of contracts supports only a single subnetwork per network.

**Note:**
storage-location: erc7201:symbiotic.storage.NetworkManager


```solidity
struct NetworkManagerStorage {
    address _network;
    uint96 _subnetworkID;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_network`|`address`|The address of the network.|
|`_subnetworkID`|`uint96`|The identifier of the subnetwork.|

### NetworkManagerInitParams
The parameters for the initialization of the NetworkManager contract.

`network` is not obligated to be registered in NetworkRegistry contract, it can be any non-zero address.


```solidity
struct NetworkManagerInitParams {
    address network;
    uint96 subnetworkId;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`network`|`address`|The address of the network.|
|`subnetworkId`|`uint96`|The identifier of the subnetwork.|

