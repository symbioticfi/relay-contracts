# VotingPowerProvider
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9b9397f972967c27019ba88b9cb96dce82bcc4be/src/modules/voting-power/VotingPowerProvider.sol)

**Inherits:**
[NetworkManager](/src/modules/base/NetworkManager.sol/abstract.NetworkManager.md), [VotingPowerCalcManager](/src/modules/voting-power/base/VotingPowerCalcManager.sol/abstract.VotingPowerCalcManager.md), [OzEIP712](/src/modules/base/OzEIP712.sol/abstract.OzEIP712.md), [PermissionManager](/src/modules/base/PermissionManager.sol/abstract.PermissionManager.md), NoncesUpgradeable, MulticallUpgradeable, [IVotingPowerProvider](/src/interfaces/modules/voting-power/IVotingPowerProvider.sol/interface.IVotingPowerProvider.md)

**Title:**
VotingPowerProvider

Contract for managing tokens, operators, vaults, and their voting powers.


## State Variables
### OPERATOR_REGISTRY
Returns the address of the OperatorRegistry contract.


```solidity
address public immutable OPERATOR_REGISTRY
```


### VAULT_FACTORY
Returns the address of the VaultFactory contract.


```solidity
address public immutable VAULT_FACTORY
```


### REGISTER_OPERATOR_TYPEHASH

```solidity
bytes32 private constant REGISTER_OPERATOR_TYPEHASH = keccak256("RegisterOperator(address operator,uint256 nonce)")
```


### UNREGISTER_OPERATOR_TYPEHASH

```solidity
bytes32 private constant UNREGISTER_OPERATOR_TYPEHASH =
    keccak256("UnregisterOperator(address operator,uint256 nonce)")
```


## Functions
### constructor


```solidity
constructor(address operatorRegistry, address vaultFactory) ;
```

### __VotingPowerProvider_init


```solidity
function __VotingPowerProvider_init(VotingPowerProviderInitParams memory votingPowerProviderInitParams)
    internal
    virtual
    onlyInitializing;
```

### getSlashingDataAt

Returns the slashing data at a specific timestamp.


```solidity
function getSlashingDataAt(uint48 timestamp, bytes memory hint) public view virtual returns (bool, uint48);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint48`|The timestamp.|
|`hint`|`bytes`|The hint.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|requireSlasher If to require slashers.|
|`<none>`|`uint48`|minVaultEpochDuration The minimum epoch duration for the vaults.|


### getSlashingData

Returns the slashing data.


```solidity
function getSlashingData() public view virtual returns (bool, uint48);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|requireSlasher If to require slashers.|
|`<none>`|`uint48`|minVaultEpochDuration The minimum epoch duration for the vaults.|


### isTokenRegisteredAt

Returns the status of the token registration at a specific timestamp.


```solidity
function isTokenRegisteredAt(address token, uint48 timestamp) public view virtual returns (bool);
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
function isTokenRegistered(address token) public view virtual returns (bool);
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
function getTokensAt(uint48 timestamp) public view virtual returns (address[] memory);
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
function getTokens() public view virtual returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The tokens.|


### isOperatorRegisteredAt

Returns the status of the operator registration at a specific timestamp.


```solidity
function isOperatorRegisteredAt(address operator, uint48 timestamp) public view virtual returns (bool);
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


### isOperatorRegistered

Returns the status of the operator registration.


```solidity
function isOperatorRegistered(address operator) public view virtual returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`operator`|`address`|The operator.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the operator registration.|


### getOperatorsAt

Returns the operators at a specific timestamp.


```solidity
function getOperatorsAt(uint48 timestamp) public view virtual returns (address[] memory);
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
function getOperators() public view virtual returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The operators.|


### isSharedVaultRegisteredAt

Returns the status of the shared vault registration at a specific timestamp.


```solidity
function isSharedVaultRegisteredAt(address vault, uint48 timestamp) public view virtual returns (bool);
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


### isSharedVaultRegistered

Returns the status of the shared vault registration.


```solidity
function isSharedVaultRegistered(address vault) public view virtual returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault`|`address`|The shared vault.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The status of the shared vault registration.|


### getSharedVaultsAt

Returns the shared vaults at a specific timestamp.


```solidity
function getSharedVaultsAt(uint48 timestamp) public view virtual returns (address[] memory);
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
function getSharedVaults() public view virtual returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|The shared vaults.|


### isOperatorVaultRegisteredAt

Returns the status of the operator vault registration.


```solidity
function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) public view virtual returns (bool);
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
function isOperatorVaultRegistered(address vault) public view virtual returns (bool);
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
function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp)
    public
    view
    virtual
    returns (bool);
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
function isOperatorVaultRegistered(address operator, address vault) public view virtual returns (bool);
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
function getOperatorVaultsAt(address operator, uint48 timestamp) public view virtual returns (address[] memory);
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
function getOperatorVaults(address operator) public view virtual returns (address[] memory);
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
function getOperatorStakesAt(address operator, uint48 timestamp) public view virtual returns (VaultValue[] memory);
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
function getOperatorStakes(address operator) public view virtual returns (VaultValue[] memory);
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
    public
    view
    virtual
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
    public
    view
    virtual
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
    public
    view
    virtual
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
function getVotingPowers(bytes[] memory extraData) public view virtual returns (OperatorVotingPower[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`extraData`|`bytes[]`|The extra data.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`OperatorVotingPower[]`|The operators and their vaults with voting powers.|


### _getTokensLength

Returns the length of the tokens.


```solidity
function _getTokensLength() internal view virtual returns (uint256);
```

### _getOperatorsLength

Returns the length of the operators.


```solidity
function _getOperatorsLength() internal view virtual returns (uint256);
```

### _getSharedVaultsLength

Returns the length of the shared vaults.


```solidity
function _getSharedVaultsLength() internal view virtual returns (uint256);
```

### _getOperatorVaultsLength

Returns the length of the operator vaults.


```solidity
function _getOperatorVaultsLength(address operator) internal view virtual returns (uint256);
```

### _getOperatorStakeAt

Returns the stake of the operator at a specific timestamp.


```solidity
function _getOperatorStakeAt(address operator, address vault, uint48 timestamp)
    internal
    view
    virtual
    returns (uint256);
```

### _getOperatorStake

Returns the stake of the operator.


```solidity
function _getOperatorStake(address operator, address vault) internal view virtual returns (uint256);
```

### _getOperatorVotingPowerAt

Returns the voting power of the operator at a specific timestamp.


```solidity
function _getOperatorVotingPowerAt(address operator, address vault, bytes memory extraData, uint48 timestamp)
    internal
    view
    virtual
    returns (uint256);
```

### _getOperatorVotingPower

Returns the voting power of the operator.


```solidity
function _getOperatorVotingPower(address operator, address vault, bytes memory extraData)
    internal
    view
    virtual
    returns (uint256);
```

### registerOperator

Registers the caller as an operator.

The caller can be anyone.


```solidity
function registerOperator() public virtual;
```

### registerOperatorWithSignature

Registers the operator with a signature.

The caller can be anyone.


```solidity
function registerOperatorWithSignature(address operator, bytes memory signature) public virtual;
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
function unregisterOperator() public virtual;
```

### unregisterOperatorWithSignature

Unregisters the operator with a signature.

The caller can be anyone.


```solidity
function unregisterOperatorWithSignature(address operator, bytes memory signature) public virtual;
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
function invalidateOldSignatures() public virtual;
```

### _setSlashingData


```solidity
function _setSlashingData(bool requireSlasher, uint48 minVaultEpochDuration) internal virtual;
```

### _registerToken


```solidity
function _registerToken(address token) internal virtual;
```

### _unregisterToken


```solidity
function _unregisterToken(address token) internal virtual;
```

### _registerOperator


```solidity
function _registerOperator(address operator) internal virtual;
```

### _unregisterOperator


```solidity
function _unregisterOperator(address operator) internal virtual;
```

### _registerSharedVault


```solidity
function _registerSharedVault(address vault) internal virtual;
```

### _registerOperatorVault


```solidity
function _registerOperatorVault(address operator, address vault) internal virtual;
```

### _unregisterSharedVault


```solidity
function _unregisterSharedVault(address vault) internal virtual;
```

### _unregisterOperatorVault


```solidity
function _unregisterOperatorVault(address operator, address vault) internal virtual;
```

### _registerOperatorImpl


```solidity
function _registerOperatorImpl(address operator) internal virtual;
```

### _unregisterOperatorImpl


```solidity
function _unregisterOperatorImpl(address operator) internal virtual;
```

### _registerOperatorVaultImpl


```solidity
function _registerOperatorVaultImpl(address operator, address vault) internal virtual;
```

### _unregisterOperatorVaultImpl


```solidity
function _unregisterOperatorVaultImpl(address operator, address vault) internal virtual;
```

### _verifyEIP712


```solidity
function _verifyEIP712(address operator, bytes32 structHash, bytes memory signature) internal view;
```

