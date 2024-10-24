# Middleware SDK

The Symbiotic Middleware SDK is a collection of basic contracts and libraries that handle common tasks such as operator management, key handling, vault interactions, subnetwork operations, and slashing mechanisms. It enables developers to easily create network middleware for the Symbiotic platform.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Usage](#usage)
  - [Libraries](#libraries)
    - [PauseableEnumerableSet Library](#pauseableenumerableset-library)
  - [Contracts](#contracts)
    - [BaseMiddleware Contract](#basemiddleware-contract)
    - [OperatorManager Contract](#operatormanager-contract)
    - [VaultManager Contract](#vaultmanager-contract)
    - [KeyManager Contract](#keymanager-contract)
    - [BLSKeyManager Contract](#blskeymanager-contract)
  - [Examples](#examples)
    - [SimpleMiddleware Example](#simplemiddleware-example)
    - [SqrtTaskMiddleware Example](#sqrttaskmiddleware-example)
- [License](#license)

## Features

- **Operator Management**: Register, pause, unpause, and manage operators within the network.
- **Vault Management**: Interact with vaults for staking, power calculation, and slashing mechanisms.
- **Key Management**: Handle operator keys (both standard and BLS keys), including updates and activity checks.
- **Subnetwork Support**: Manage multiple subnetworks within the main network, including registration and pausing.
- **Epoch Management**: Utilities for handling epochs, including start times and durations.
- **Slashing Mechanisms**: Implement instant and veto-based slashing for misbehaving operators.
- **Example Implementations**: Includes example contracts demonstrating how to extend and use the SDK.

## Architecture

The SDK is organized into the following components:

- **Libraries**: Reusable code segments like `PauseableEnumerableSet` for managing enumerable sets with pause functionality.
- **SDK Contracts**: Core contracts such as `BaseMiddleware`, `OperatorManager`, `VaultManager`, and key managers that provide essential middleware functionalities.
- **Examples**: Sample implementations like `SimpleMiddleware` and `SqrtTaskMiddleware` to illustrate how to build upon the SDK.

## Usage

### Libraries

#### PauseableEnumerableSet Library

The `PauseableEnumerableSet` library extends the functionality of enumerable sets by adding pause and unpause capabilities to individual elements within the set.

**Features:**

- Manage sets of `address` or `uint160` values.
- Pause and unpause individual elements.
- Track enabled and disabled epochs for each element.
- Prevent operations on paused elements.

### SDK Contracts

#### BaseMiddleware Contract

The `BaseMiddleware` contract is an abstract base contract that provides foundational middleware functionalities, including epoch management, subnetwork handling, and immutable period configurations.

**Key Features:**

- **Epoch Management**: Calculate current epoch, epoch start times, and manage epoch durations.
- **Subnetwork Management**: Register, pause, unpause, and unregister subnetworks.
- **Immutable Epochs**: Enforce immutable periods before certain actions can be performed.

**Key Functions:**

- `getCurrentEpoch()`: Returns the current epoch based on the timestamp.
- `getEpochStart(uint48 epoch)`: Returns the start timestamp of a given epoch.
- `registerSubnetwork(uint96 subnetwork)`: Registers a new subnetwork.
- `pauseSubnetwork(uint96 subnetwork)`: Pauses a subnetwork.
- `unpauseSubnetwork(uint96 subnetwork)`: Unpauses a subnetwork after the immutable period.
- `unregisterSubnetwork(uint96 subnetwork)`: Unregisters a subnetwork.

#### OperatorManager Contract

The `OperatorManager` contract manages operators within the network. It allows for registering, pausing, unpausing, and unregistering operators.

**Key Features:**

- **Operator Registration**: Register new operators who are part of the network.
- **Operator State Management**: Pause and unpause operators.
- **Operator Activity Checks**: Retrieve active operators for the current epoch.

**Key Functions:**

- `registerOperator(address operator)`: Registers a new operator. Requires that the operator is a valid entity in the operator registry and has opted into the network.
- `pauseOperator(address operator)`: Pauses an operator, making them inactive.
- `unpauseOperator(address operator)`: Unpauses an operator after the immutable period has passed.
- `unregisterOperator(address operator)`: Unregisters an operator from the middleware.
- `activeOperators()`: Returns a list of active operators for the current epoch.
- `operatorsLength()`: Returns the total number of registered operators.

#### VaultManager Contract

The `VaultManager` contract handles interactions with vaults, including registering vaults, calculating operator stakes and power, and implementing slashing mechanisms.

**Key Features:**

- **Vault Registration**: Register shared and operator-specific vaults.
- **Stake and Power Calculation**: Calculate the stake and power of operators at specific epochs.
- **Slashing Mechanisms**: Implement slashing logic for misbehaving operators.

**Key Functions:**

- `registerSharedVault(address vault)`: Registers a shared vault accessible by all operators.
- `registerOperatorVault(address vault, address operator)`: Registers a vault specific to an operator.
- `pauseSharedVault(address vault)`: Pauses a shared vault.
- `unpauseSharedVault(address vault)`: Unpauses a shared vault after the immutable period.
- `pauseOperatorVault(address operator, address vault)`: Pauses an operator's vault.
- `unpauseOperatorVault(address operator, address vault)`: Unpauses an operator's vault after the immutable period.
- `getOperatorStake(uint48 epoch, address operator)`: Retrieves the total stake of an operator at a specific epoch.
- `getOperatorPower(uint48 epoch, address operator)`: Calculates the power of an operator based on their stake. This can be overridden to implement custom stake-to-power logic.

**Implementing `stakeToPower`:**

```solidity
function stakeToPower(address vault, uint256 stake) public view virtual override returns (uint256) {
    // Custom logic to convert stake to power
    return stake; // Simple 1:1 mapping in this example
}
```

#### KeyManager Contract

The `KeyManager` contract manages operator keys, including updating keys, retrieving current and previous keys, and checking if keys were active at specific epochs.

**Key Features:**

- **Key Updates**: Update the keys associated with operators.
- **Key Retrieval**: Get the current or previous key of an operator.
- **Key Activity Checks**: Determine if a key was active during a particular epoch.

**Key Functions:**

- `updateKey(address operator, bytes32 key)`: Updates the key associated with an operator. Throws an error if the key is already in use by another operator.
- `operatorKey(address operator)`: Retrieves the current key of an operator. If the key was updated in the current epoch, it returns the previous key.
- `operatorByKey(bytes32 key)`: Returns the operator associated with a specific key.
- `keyWasActiveAt(uint48 epoch, bytes32 key)`: Checks if a key was active during a specific epoch.

#### BLSKeyManager Contract

The `BLSKeyManager` is similar to `KeyManager` but specifically handles BLS (Boneh-Lynn-Shacham) keys, which are often used in threshold signature schemes.

**Key Features:**

- **BLS Key Management**: Update and retrieve BLS keys for operators.
- **Key Activity Checks**: Check if a BLS key was active during a specific epoch.

**Key Functions:**

- `updateBLSKey(address operator, bytes memory key)`: Updates the BLS key associated with an operator. Throws an error if the key is already in use.
- `operatorBLSKey(address operator)`: Retrieves the current BLS key of an operator. If the key was updated in the current epoch, it returns the previous key.
- `operatorByBLSKey(bytes memory key)`: Returns the operator associated with a specific BLS key.
- `blsKeyWasActiveAt(uint48 epoch, bytes memory key)`: Checks if a BLS key was active during a specific epoch.

### Examples

#### SimpleMiddleware Example

The `SimpleMiddleware` contract is an example implementation that demonstrates how to use the SDK to build a middleware contract that manages validators and handles slashing.

**Features:**

- **Validator Set Management**: Maintains a set of validators with their power and keys.
- **Slashing Mechanism**: Implements a `slash` function to penalize misbehaving operators.
- **Integration**: Utilizes `OperatorManager`, `VaultManager`, and `KeyManager` for comprehensive management.

**Key Structures and Functions:**

- **ValidatorData**: Struct containing `power` and `key` of a validator.
- `getTotalStake()`: Returns the total stake for active operators in the current epoch.
- `getValidatorSet()`: Retrieves the current validator set with their power and keys.
- `slash(...)`: Slashes a validator based on provided parameters.

#### SqrtTaskMiddleware Example

The `SqrtTaskMiddleware` contract is an advanced example that extends the SDK to create computational tasks requiring operators to compute square roots. It includes signature verification and custom slashing logic.

**Features:**

- **Task Creation and Completion**: Allows creating tasks and operators to submit computed answers.
- **Signature Verification**: Uses EIP712 standard for verifying operator signatures.
- **Custom Slashing**: Implements slashing if the operator provides an incorrect answer.

**Key Structures and Functions:**

- **Task**: Struct containing `captureTimestamp`, `value`, `operator`, and `completed` status.
- `createTask(uint256 value, address operator)`: Creates a new computational task.
- `completeTask(...)`: Operators submit answers to tasks with signature verification.
- `_slash(...)`: Internal function to handle slashing logic if the answer is incorrect.

**Note:**

In `SqrtTaskMiddleware`, subnetworks are not used, and attempts to register or manage subnetworks are disabled by overriding the functions and reverting.

```solidity
function registerSubnetwork(uint96 subnetwork) public override {
    revert();
}

// Similarly for other subnetwork functions...
```

## License

This project is licensed under the [MIT License](LICENSE).

---

For any questions, issues, or contributions, please open an issue or submit a pull request on the repository.