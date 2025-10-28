# IVotingPowerProvider
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/79659f66a6349a5ecb86c9437ba656cf1fdf5fe5/src/interfaces/modules/voting-power/IVotingPowerProvider.sol)

Interface for the VotingPowerProvider contract.


## Functions
### OPERATOR_REGISTRY

Returns the address of the OperatorRegistry contract.


```solidity
function OPERATOR_REGISTRY() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the OperatorRegistry contract.|


### VAULT_FACTORY

Returns the address of the VaultFactory contract.


```solidity
function VAULT_FACTORY() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the VaultFactory contract.|


### getSlashingDataAt

Returns the slashing data at a specific timestamp.


```solidity
function getSlashingDataAt(uint48 timestamp, bytes memory hint)
    external
    view
    returns (bool requireSlasher, uint48 minVaultEpochDuration);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|
|`hint`|`bytes`|The hint.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`requireSlasher`|`bool`|If to require slashers.|
|`minVaultEpochDuration`|`uint48`|The minimum epoch duration for the vaults.|


### getSlashingData

Returns the slashing data.


```solidity
function getSlashingData() external view returns (bool requireSlasher, uint48 minVaultEpochDuration);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`requireSlasher`|`bool`|If to require slashers.|
|`minVaultEpochDuration`|`uint48`|The minimum epoch duration for the vaults.|


### isTokenRegisteredAt

Returns the status of the token registration at a specific timestamp.


```solidity
function isTokenRegisteredAt(address token, uint48 timestamp) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the token registration.|


### isTokenRegistered

Returns the status of the token registration.


```solidity
function isTokenRegistered(address token) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the token registration.|


### getTokensAt

Returns the tokens at a specific timestamp.


```solidity
function getTokensAt(uint48 timestamp) external view returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The tokens.|


### getTokens

Returns the tokens.


```solidity
function getTokens() external view returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The tokens.|


### isOperatorRegistered

Returns the status of the operator registration.


```solidity
function isOperatorRegistered(address operator) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the operator registration.|


### isOperatorRegisteredAt

Returns the status of the operator registration at a specific timestamp.


```solidity
function isOperatorRegisteredAt(address operator, uint48 timestamp) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the operator registration.|


### getOperatorsAt

Returns the operators at a specific timestamp.


```solidity
function getOperatorsAt(uint48 timestamp) external view returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operators.|


### getOperators

Returns the operators.


```solidity
function getOperators() external view returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operators.|


### isSharedVaultRegistered

Returns the status of the shared vault registration.


```solidity
function isSharedVaultRegistered(address vault) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The shared vault.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the shared vault registration.|


### isSharedVaultRegisteredAt

Returns the status of the shared vault registration at a specific timestamp.


```solidity
function isSharedVaultRegisteredAt(address vault, uint48 timestamp) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The shared vault.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the shared vault registration.|


### getSharedVaultsAt

Returns the shared vaults at a specific timestamp.


```solidity
function getSharedVaultsAt(uint48 timestamp) external view returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The shared vaults.|


### getSharedVaults

Returns the shared vaults.


```solidity
function getSharedVaults() external view returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The shared vaults.|


### isOperatorVaultRegisteredAt

Returns the status of the operator vault registration.


```solidity
function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The operator vault.|
|`timestamp`|`uint48`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the operator vault registration.|


### isOperatorVaultRegistered

Returns the status of the operator vault registration.


```solidity
function isOperatorVaultRegistered(address vault) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The operator vault.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the operator vault registration.|


### isOperatorVaultRegisteredAt

Returns the status of the operator vault registration at a specific timestamp.


```solidity
function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`vault`|`address`|The operator vault.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the operator vault registration.|


### isOperatorVaultRegistered

Returns the status of the operator vault registration.


```solidity
function isOperatorVaultRegistered(address operator, address vault) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`vault`|`address`|The operator vault.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the operator vault registration.|


### getOperatorVaultsAt

Returns the operator vaults at a specific timestamp.


```solidity
function getOperatorVaultsAt(address operator, uint48 timestamp) external view returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operator vaults.|


### getOperatorVaults

Returns the operator vaults.


```solidity
function getOperatorVaults(address operator) external view returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operator vaults.|


### getOperatorStakesAt

Returns the vaults with stakes of the operator at a specific timestamp.


```solidity
function getOperatorStakesAt(address operator, uint48 timestamp) external view returns (VaultValue[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`VaultValue[]`|The vaults with stakes of the operator.|


### getOperatorStakes

Returns the vaults with stakes of the operator.


```solidity
function getOperatorStakes(address operator) external view returns (VaultValue[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`VaultValue[]`|The vaults with stakes of the operator.|


### getOperatorVotingPowersAt

Returns the vaults with voting powers of the operator at a specific timestamp.


```solidity
function getOperatorVotingPowersAt(address operator, bytes memory extraData, uint48 timestamp)
    external
    view
    returns (VaultValue[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`extraData`|`bytes`|The extra data.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`VaultValue[]`|The vaults with voting powers of the operator.|


### getOperatorVotingPowers

Returns the vaults with voting powers of the operator.


```solidity
function getOperatorVotingPowers(address operator, bytes memory extraData)
    external
    view
    returns (VaultValue[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`extraData`|`bytes`|The extra data.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`VaultValue[]`|The vaults with voting powers of the operator.|


### getVotingPowersAt

Returns operators and their vaults with voting powers at a specific timestamp.


```solidity
function getVotingPowersAt(bytes[] memory extraData, uint48 timestamp)
    external
    view
    returns (OperatorVotingPower[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`extraData`|`bytes[]`|The extra data.|
|`timestamp`|`uint48`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`OperatorVotingPower[]`|The operators and their vaults with voting powers.|


### getVotingPowers

Returns operators and their vaults with voting powers.


```solidity
function getVotingPowers(bytes[] memory extraData) external view returns (OperatorVotingPower[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`extraData`|`bytes[]`|The extra data.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`OperatorVotingPower[]`|The operators and their vaults with voting powers.|


### registerOperator

Registers the caller as an operator.

The caller can be anyone.


```solidity
function registerOperator() external;
```

### registerOperatorWithSignature

Registers the operator with a signature.

The caller can be anyone.


```solidity
function registerOperatorWithSignature(address operator, bytes memory signature) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`signature`|`bytes`|The signature of the operator.|


### unregisterOperator

Unregisters the operator.

The caller can be anyone.


```solidity
function unregisterOperator() external;
```

### unregisterOperatorWithSignature

Unregisters the operator with a signature.

The caller can be anyone.


```solidity
function unregisterOperatorWithSignature(address operator, bytes memory signature) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`signature`|`bytes`|The signature of the operator.|


### invalidateOldSignatures

Invalidates the old signatures of the caller.

The caller can be anyone.
Increases the signatures' nonce by one.


```solidity
function invalidateOldSignatures() external;
```

## Events
### SetSlashingData
Emitted when the slashing data is set.

It doesn't force non-suitable vaults to unregister.


```solidity
event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`requireSlasher`|`bool`|If to require slashers.|
|`minVaultEpochDuration`|`uint48`|The minimum epoch duration for the vaults.|

### RegisterToken
Emitted when the token is registered.


```solidity
event RegisterToken(address indexed token);
```

### UnregisterToken
Emitted when the token is unregistered.


```solidity
event UnregisterToken(address indexed token);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|The token.|

### RegisterOperator
Emitted when the operator is registered.


```solidity
event RegisterOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|

### UnregisterOperator
Emitted when the operator is unregistered.


```solidity
event UnregisterOperator(address indexed operator);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|

### RegisterSharedVault
Emitted when the shared vault is registered.


```solidity
event RegisterSharedVault(address indexed vault);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The shared vault.|

### UnregisterSharedVault
Emitted when the shared vault is unregistered.


```solidity
event UnregisterSharedVault(address indexed vault);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The shared vault.|

### RegisterOperatorVault
Emitted when the operator vault is registered.


```solidity
event RegisterOperatorVault(address indexed operator, address indexed vault);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`vault`|`address`|The operator vault.|

### UnregisterOperatorVault
Emitted when the operator vault is unregistered.


```solidity
event UnregisterOperatorVault(address indexed operator, address indexed vault);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|
|`vault`|`address`|The operator vault.|

## Errors
### VotingPowerProvider_InvalidOperator
Reverts when the operator is not registered in the OperatorRegistry.


```solidity
error VotingPowerProvider_InvalidOperator();
```

### VotingPowerProvider_InvalidOperatorVault
Reverts when the operator vault is invalid.


```solidity
error VotingPowerProvider_InvalidOperatorVault();
```

### VotingPowerProvider_InvalidSharedVault
Reverts when the shared vault is invalid.


```solidity
error VotingPowerProvider_InvalidSharedVault();
```

### VotingPowerProvider_InvalidSignature
Reverts when the signature is invalid.


```solidity
error VotingPowerProvider_InvalidSignature();
```

### VotingPowerProvider_InvalidToken
Reverts when the token is zero address.


```solidity
error VotingPowerProvider_InvalidToken();
```

### VotingPowerProvider_InvalidVault
Reverts when the vault is invalid.


```solidity
error VotingPowerProvider_InvalidVault();
```

### VotingPowerProvider_OperatorAlreadyRegistered
Reverts when the operator is already registered.


```solidity
error VotingPowerProvider_OperatorAlreadyRegistered();
```

### VotingPowerProvider_OperatorNotRegistered
Reverts when the operator is not registered.


```solidity
error VotingPowerProvider_OperatorNotRegistered();
```

### VotingPowerProvider_OperatorVaultAlreadyIsRegistered
Reverts when the operator vault is already registered.


```solidity
error VotingPowerProvider_OperatorVaultAlreadyIsRegistered();
```

### VotingPowerProvider_OperatorVaultNotRegistered
Reverts when the operator vault is not registered.


```solidity
error VotingPowerProvider_OperatorVaultNotRegistered();
```

### VotingPowerProvider_SharedVaultAlreadyIsRegistered
Reverts when the shared vault is already registered.


```solidity
error VotingPowerProvider_SharedVaultAlreadyIsRegistered();
```

### VotingPowerProvider_SharedVaultNotRegistered
Reverts when the shared vault is not registered.


```solidity
error VotingPowerProvider_SharedVaultNotRegistered();
```

### VotingPowerProvider_TokenAlreadyIsRegistered
Reverts when the token is already registered.


```solidity
error VotingPowerProvider_TokenAlreadyIsRegistered();
```

### VotingPowerProvider_TokenNotRegistered
Reverts when the token is not registered.


```solidity
error VotingPowerProvider_TokenNotRegistered();
```

## Structs
### VotingPowerProviderStorage
The storage of the VotingPowerProvider contract.

**Note:**
storage-location: erc7201:symbiotic.storage.VotingPowerProvider


```solidity
struct VotingPowerProviderStorage {
    PersistentSet.AddressSet _tokens;
    PersistentSet.AddressSet _operators;
    PersistentSet.AddressSet _sharedVaults;
    PersistentSet.AddressSet _allOperatorVaults;
    mapping(address operator => PersistentSet.AddressSet set) _operatorVaults;
    Checkpoints.Trace208 _slashingData;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`_tokens`|`PersistentSet.AddressSet`|The set of the tokens.|
|`_operators`|`PersistentSet.AddressSet`|The set of the operators.|
|`_sharedVaults`|`PersistentSet.AddressSet`|The set of the shared vaults.|
|`_allOperatorVaults`|`PersistentSet.AddressSet`|The set of the all operator vaults.|
|`_operatorVaults`|`mapping(address operator => PersistentSet.AddressSet set)`|The mapping from the operator to the set of the operator vaults.|
|`_slashingData`|`Checkpoints.Trace208`|The slashing data (if to require slasher, and a minimum epoch duration).|

### VotingPowerProviderInitParams
The parameters for the initialization of the VotingPowerProvider contract.


```solidity
struct VotingPowerProviderInitParams {
    INetworkManager.NetworkManagerInitParams networkManagerInitParams;
    IOzEIP712.OzEIP712InitParams ozEip712InitParams;
    bool requireSlasher;
    uint48 minVaultEpochDuration;
    address token;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`networkManagerInitParams`|`INetworkManager.NetworkManagerInitParams`|The parameters for the initialization of the NetworkManager contract.|
|`ozEip712InitParams`|`IOzEIP712.OzEIP712InitParams`|The parameters for the initialization of the OzEIP712 contract.|
|`requireSlasher`|`bool`|If to require slashers.|
|`minVaultEpochDuration`|`uint48`|The minimum epoch duration for the vaults.|
|`token`|`address`|The acceptable token (zero address if not applicable).|

### VaultValue
The value of the vault.


```solidity
struct VaultValue {
    address vault;
    uint256 value;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The address of the vault.|
|`value`|`uint256`|The value (voting power or stake).|

### OperatorVotingPower
The voting power of the operator.


```solidity
struct OperatorVotingPower {
    address operator;
    VaultValue[] vaults;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The address of the operator.|
|`vaults`|`VaultValue[]`|The voting power of the operator for each vault.|

### OperatorVotingPowersExtraData
The extra data for the voting power of the operator.


```solidity
struct OperatorVotingPowersExtraData {
    bytes[] sharedVaultsExtraData;
    bytes[] operatorVaultsExtraData;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`sharedVaultsExtraData`|`bytes[]`|The extra data for the shared vaults.|
|`operatorVaultsExtraData`|`bytes[]`|The extra data for the operator vaults.|

## Enums
### DelegatorType
The types of the delegator.


```solidity
enum DelegatorType {
    NETWORK_RESTAKE,
    FULL_RESTAKE,
    OPERATOR_SPECIFIC,
    OPERATOR_NETWORK_SPECIFIC
}
```

### SlasherType
The types of the slasher.


```solidity
enum SlasherType {
    INSTANT,
    VETO
}
```

