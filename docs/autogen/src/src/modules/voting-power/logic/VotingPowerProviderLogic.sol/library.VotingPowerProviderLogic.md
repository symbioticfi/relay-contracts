# VotingPowerProviderLogic
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/743070d7a1fd569c1fffbb25c8d6a65e2730829c/src/modules/voting-power/logic/VotingPowerProviderLogic.sol)

**Title:**
VotingPowerProviderLogic

Library-logic of the voting power provider contract.


## State Variables
### VotingPowerProviderStorageLocation

```solidity
bytes32 private constant VotingPowerProviderStorageLocation =
    0x3671387af6738df83002b4d17260f89ef208ae15fe22fab69d817f0195c74800
```


## Functions
### _getVotingPowerProviderStorage


```solidity
function _getVotingPowerProviderStorage()
    internal
    pure
    returns (IVotingPowerProvider.VotingPowerProviderStorage storage $);
```

### initialize


```solidity
function initialize(IVotingPowerProvider.VotingPowerProviderInitParams memory initParams) public;
```

### getSlashingDataAt


```solidity
function getSlashingDataAt(uint48 timestamp, bytes memory hint) public view returns (bool, uint48);
```

### getSlashingData


```solidity
function getSlashingData() public view returns (bool, uint48);
```

### isTokenRegisteredAt


```solidity
function isTokenRegisteredAt(address token, uint48 timestamp) public view returns (bool);
```

### isTokenRegistered


```solidity
function isTokenRegistered(address token) public view returns (bool);
```

### getTokensAt


```solidity
function getTokensAt(uint48 timestamp) public view returns (address[] memory);
```

### getTokens


```solidity
function getTokens() public view returns (address[] memory);
```

### getTokensLength


```solidity
function getTokensLength() public view returns (uint256);
```

### isOperatorRegisteredAt


```solidity
function isOperatorRegisteredAt(address operator, uint48 timestamp) public view returns (bool);
```

### isOperatorRegistered


```solidity
function isOperatorRegistered(address operator) public view returns (bool);
```

### getOperatorsAt


```solidity
function getOperatorsAt(uint48 timestamp) public view returns (address[] memory);
```

### getOperators


```solidity
function getOperators() public view returns (address[] memory);
```

### getOperatorsLength


```solidity
function getOperatorsLength() public view returns (uint256);
```

### isSharedVaultRegisteredAt


```solidity
function isSharedVaultRegisteredAt(address vault, uint48 timestamp) public view returns (bool);
```

### isSharedVaultRegistered


```solidity
function isSharedVaultRegistered(address vault) public view returns (bool);
```

### getSharedVaultsAt


```solidity
function getSharedVaultsAt(uint48 timestamp) public view returns (address[] memory);
```

### getSharedVaults


```solidity
function getSharedVaults() public view returns (address[] memory);
```

### getSharedVaultsLength


```solidity
function getSharedVaultsLength() public view returns (uint256);
```

### isOperatorVaultRegisteredAt


```solidity
function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) public view returns (bool);
```

### isOperatorVaultRegistered


```solidity
function isOperatorVaultRegistered(address vault) public view returns (bool);
```

### isOperatorVaultRegisteredAt


```solidity
function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) public view returns (bool);
```

### isOperatorVaultRegistered


```solidity
function isOperatorVaultRegistered(address operator, address vault) public view returns (bool);
```

### getOperatorVaultsAt


```solidity
function getOperatorVaultsAt(address operator, uint48 timestamp) public view returns (address[] memory);
```

### getOperatorVaults


```solidity
function getOperatorVaults(address operator) public view returns (address[] memory);
```

### getOperatorVaultsLength


```solidity
function getOperatorVaultsLength(address operator) public view returns (uint256);
```

### getOperatorStakeAt


```solidity
function getOperatorStakeAt(address operator, address vault, uint48 timestamp) public view returns (uint256);
```

### getOperatorStake


```solidity
function getOperatorStake(address operator, address vault) public view returns (uint256);
```

### getOperatorStakesAt


```solidity
function getOperatorStakesAt(address operator, uint48 timestamp)
    public
    view
    returns (IVotingPowerProvider.VaultValue[] memory vaultStakes);
```

### getOperatorStakes


```solidity
function getOperatorStakes(address operator)
    public
    view
    returns (IVotingPowerProvider.VaultValue[] memory vaultStakes);
```

### getOperatorVotingPowerAt


```solidity
function getOperatorVotingPowerAt(address operator, address vault, bytes memory extraData, uint48 timestamp)
    public
    view
    returns (uint256);
```

### getOperatorVotingPower


```solidity
function getOperatorVotingPower(address operator, address vault, bytes memory extraData)
    public
    view
    returns (uint256);
```

### getOperatorVotingPowersAt


```solidity
function getOperatorVotingPowersAt(address operator, bytes memory extraData, uint48 timestamp)
    public
    view
    returns (IVotingPowerProvider.VaultValue[] memory vaultVotingPowers);
```

### getOperatorVotingPowers


```solidity
function getOperatorVotingPowers(address operator, bytes memory extraData)
    public
    view
    returns (IVotingPowerProvider.VaultValue[] memory vaultVotingPowers);
```

### getVotingPowersAt


```solidity
function getVotingPowersAt(bytes[] memory extraData, uint48 timestamp)
    public
    view
    returns (IVotingPowerProvider.OperatorVotingPower[] memory operatorVotingPowers);
```

### getVotingPowers


```solidity
function getVotingPowers(bytes[] memory extraData)
    public
    view
    returns (IVotingPowerProvider.OperatorVotingPower[] memory operatorVotingPowers);
```

### setSlashingData


```solidity
function setSlashingData(bool requireSlasher, uint48 minVaultEpochDuration) public;
```

### registerToken


```solidity
function registerToken(address token) public;
```

### unregisterToken


```solidity
function unregisterToken(address token) public;
```

### registerOperator


```solidity
function registerOperator(address operator) public;
```

### unregisterOperator


```solidity
function unregisterOperator(address operator) public;
```

### registerSharedVault


```solidity
function registerSharedVault(address vault) public;
```

### registerOperatorVault


```solidity
function registerOperatorVault(address operator, address vault) public;
```

### unregisterSharedVault


```solidity
function unregisterSharedVault(address vault) public;
```

### unregisterOperatorVault


```solidity
function unregisterOperatorVault(address operator, address vault) public;
```

### serializeSlashingData


```solidity
function serializeSlashingData(bool requireSlasher, uint48 minVaultEpochDuration) public pure returns (uint208);
```

### deserializeSlashingData


```solidity
function deserializeSlashingData(uint208 slashingData) public pure returns (bool, uint48);
```

### _validateOperator


```solidity
function _validateOperator(address operator) public view returns (bool);
```

### _validateVault


```solidity
function _validateVault(address vault) public view returns (bool);
```

### _validateSharedVault


```solidity
function _validateSharedVault(address vault) public view returns (bool);
```

### _validateOperatorVault


```solidity
function _validateOperatorVault(address operator, address vault) public view returns (bool);
```

### _validateVaultSlashing


```solidity
function _validateVaultSlashing(address vault) public view returns (bool);
```

