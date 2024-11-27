# Middleware Development Guide

This repository provides a framework for developing middleware in a modular and extensible way. It leverages various base contracts and extensions to handle key functionalities such as operator management, access control, key storage, and timestamp capturing.

## Key Components:

- **BaseMiddleware**: The foundational contract that combines core manager functionalities from `VaultManager`, `OperatorManager`, `AccessManager`, and `KeyManager`.

- **Extensions**: Modular contracts that provide additional functionalities. Key extensions include:

  - **Operators**: Manages operator registration and vault relationships.
  
  - **KeyStorage**: Manages operator keys. Variants include `KeyStorage256`, `KeyStorageBytes`, and `NoKeyStorage`.
  
  - **AccessManager**: Controls access to restricted functions. Implementations include `OwnableAccessManager`, `OzAccessManaged`, and `NoAccessManager`.
  
  - **CaptureTimestamp**: Captures the active state at specific timestamps. Options are `EpochCapture` and `TimestampCapture`.
  
  - **Signature Verification**: Verifies operator signatures. Implementations include `ECDSASig` and `EdDSASig`.

## Middleware Examples

Below are examples of middleware implementations using different combinations of the extensions.

#### SimplePosMiddleware
```solidity
contract SimplePosMiddleware is SharedVaults, Operators, KeyStorage256, OwnableAccessManager, EpochCapture {
    // Implementation details...
}
```

Features:

- Manages operator keys and stakes.
- Retrieves validator sets and total stakes.
- Implements slashing logic based on epochs.

#### SqrtTaskMiddleware

```solidity
contract SqrtTaskMiddleware is SharedVaults, Operators, NoKeyStorage, EIP712, OwnableAccessManager, TimestampCapture {
    // Implementation details...
}
```

Features:

- Allows creation of computational tasks.
- Verifies task completion using signatures.
- Implements slashing for incorrect task completion.

#### SelfRegisterMiddleware

```solidity
contract SelfRegisterMiddleware is SharedVaults, SelfRegisterOperators, KeyStorage256, ECDSASig, NoAccessManager, TimestampCapture {
    // Implementation details...
}
```

Features:

- Operators can self-register using ECDSA signatures.
- Manages operator keys and vault associations.
- No access restrictions on functions.

#### SelfRegisterEd25519Middleware

```solidity
contract SelfRegisterEd25519Middleware is SharedVaults, SelfRegisterOperators, KeyStorage256, EdDSASig, NoAccessManager, TimestampCapture {
    // Implementation details...
}
```

Features:

- Similar to `SelfRegisterMiddleware` but uses Ed25519 keys and signatures.

## Getting Started

To develop your middleware:

1. **Inherit from `BaseMiddleware`**: This provides access to core functionalities.

2. **Choose Extensions**: Based on your requirements, include extensions for operator management, key storage, access control, and timestamp capturing.

3. **Initialize Properly**: Ensure all inherited contracts are properly initialized. For upgradeable contracts, use the `initializer` modifier and call `_disableInitializers` in the constructor to prevent double initialization.

4. **Implement Required Functions**: Override functions as needed to implement your middleware's logic.

## Example: Creating a Custom Middleware

```solidity
contract MyCustomMiddleware is BaseMiddleware, Operators, KeyStorage256, OwnableAccessManager, TimestampCapture {
    uint64 public constant MyCustomMiddleware_VERSION = 1;

    function initialize(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn,
        address owner
    ) public initializer {
        super.initialize(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptIn);
        __OwnableAccessManaged_init(owner);
    }

    // Additional implementation...
}
```

## Notes

- **Storage Slots**: When creating extensions, ensure you follow the ERC-7201 standard for storage slot allocation to prevent conflicts.

- **Versioning**: Include a public constant variable for versioning in your contracts (e.g., `uint64 public constant MyExtension_VERSION = 1;`).

- **Access Control**: Choose an appropriate `AccessManager` based on your needs. For unrestricted access, use `NoAccessManager`. For owner-based access, use `OwnableAccessManager`.

- **Key Storage**: Select a `KeyStorage` implementation that fits your key requirements. Use `KeyStorage256` for 256-bit keys, `KeyStorageBytes` for arbitrary-length keys, or `NoKeyStorage` if keys are not needed.

This framework provides flexibility in building middleware by allowing you to mix and match various extensions based on your requirements. By following the modular approach and best practices outlined, you can develop robust middleware solutions that integrate seamlessly with the network.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
