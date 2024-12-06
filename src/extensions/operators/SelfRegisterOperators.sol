// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {SigManager} from "../../managers/extendable/SigManager.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

/**
 * @title SelfRegisterOperators
 * @notice Contract for self-registration and management of operators with signature verification
 * @dev Extends BaseMiddleware, SigManager, and EIP712Upgradeable to provide signature-based operator management
 */
abstract contract SelfRegisterOperators is BaseMiddleware, SigManager, EIP712Upgradeable {
    uint64 public constant SelfRegisterOperators_VERSION = 1;

    error InvalidSignature();

    // EIP-712 TypeHash constants
    bytes32 private constant REGISTER_OPERATOR_TYPEHASH =
        keccak256("RegisterOperator(address operator,bytes key,address vault,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_TYPEHASH =
        keccak256("UnregisterOperator(address operator,uint256 nonce)");
    bytes32 private constant PAUSE_OPERATOR_TYPEHASH = keccak256("PauseOperator(address operator,uint256 nonce)");
    bytes32 private constant UNPAUSE_OPERATOR_TYPEHASH = keccak256("UnpauseOperator(address operator,uint256 nonce)");
    bytes32 private constant UPDATE_OPERATOR_KEY_TYPEHASH =
        keccak256("UpdateOperatorKey(address operator,bytes key,uint256 nonce)");
    bytes32 private constant REGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("RegisterOperatorVault(address operator,address vault,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("UnregisterOperatorVault(address operator,address vault,uint256 nonce)");
    bytes32 private constant PAUSE_OPERATOR_VAULT_TYPEHASH =
        keccak256("PauseOperatorVault(address operator,address vault,uint256 nonce)");
    bytes32 private constant UNPAUSE_OPERATOR_VAULT_TYPEHASH =
        keccak256("UnpauseOperatorVault(address operator,address vault,uint256 nonce)");

    struct SelfRegisterOperatorsStorage {
        mapping(address => uint256) nonces;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SelfResgisterOperators_STORAGE_LOCATION =
        0x7c1bcd600c3fcfbc53470fac03a90d5cf6aa7b77c3f1ed10e6c6bd4d192eaf00;

    function _getSelfRegisterOperatorsStorage() private pure returns (SelfRegisterOperatorsStorage storage $) {
        bytes32 location = SelfResgisterOperators_STORAGE_LOCATION;
        assembly {
            $.slot := location
        }
    }

    function nonces(
        address operator
    ) public view returns (uint256) {
        return _getSelfRegisterOperatorsStorage().nonces[operator];
    }

    /**
     * @notice Initializes the contract with EIP712 domain separator
     * @param name The name to use for the EIP712 domain separator
     */
    function __SelfRegisterOperators_init(
        string memory name
    ) public onlyInitializing {
        __EIP712_init(name, "1.0");
    }

    /**
     * @notice Allows an operator to self-register with a key and optional vault
     * @param key The operator's public key
     * @param vault Optional vault address to associate with the operator
     * @param signature Signature proving ownership of the key
     */
    function registerOperator(bytes memory key, address vault, bytes memory signature) public {
        _verifyKey(msg.sender, key, signature);
        _beforeRegisterOperator(msg.sender, key, vault);
        _registerOperator(msg.sender);
        _beforeUpdateOperatorKey(msg.sender, key);
        _updateKey(msg.sender, key);
        if (vault != address(0)) {
            _beforeRegisterOperatorVault(msg.sender, vault);
            _registerOperatorVault(msg.sender, vault);
        }
    }

    /**
     * @notice Registers an operator on behalf of another address with signature verification
     * @param operator The address of the operator to register
     * @param key The operator's public key
     * @param vault Optional vault address to associate
     * @param signature EIP712 signature authorizing registration
     * @param keySignature Signature proving ownership of the key
     */
    function registerOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, keccak256(key), vault, $.nonces[operator]++)),
            signature
        );
        _verifyKey(operator, key, keySignature);
        _beforeRegisterOperator(operator, key, vault);
        _registerOperator(operator);
        _beforeUpdateOperatorKey(operator, key);
        _updateKey(operator, key);
        if (vault != address(0)) {
            _beforeRegisterOperatorVault(operator, vault);
            _registerOperatorVault(operator, vault);
        }
    }

    /**
     * @notice Allows an operator to unregister themselves
     */
    function unregisterOperator() public {
        _beforeUnregisterOperator(msg.sender);
        _unregisterOperator(msg.sender);
    }

    /**
     * @notice Unregisters an operator with signature verification
     * @param operator The address of the operator to unregister
     * @param signature EIP712 signature authorizing unregistration
     */
    function unregisterOperator(address operator, bytes memory signature) public {
        _beforeUnregisterOperator(operator);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator, keccak256(abi.encode(UNREGISTER_OPERATOR_TYPEHASH, operator, $.nonces[operator]++)), signature
        );
        _unregisterOperator(operator);
    }

    /**
     * @notice Allows an operator to pause themselves
     */
    function pauseOperator() public {
        _beforePauseOperator(msg.sender);
        _pauseOperator(msg.sender);
    }

    /**
     * @notice Pauses an operator with signature verification
     * @param operator The address of the operator to pause
     * @param signature EIP712 signature authorizing pause
     */
    function pauseOperator(address operator, bytes memory signature) public {
        _beforePauseOperator(operator);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator, keccak256(abi.encode(PAUSE_OPERATOR_TYPEHASH, operator, $.nonces[operator]++)), signature
        );
        _pauseOperator(operator);
    }

    /**
     * @notice Allows an operator to unpause themselves
     */
    function unpauseOperator() public {
        _beforeUnpauseOperator(msg.sender);
        _unpauseOperator(msg.sender);
    }

    /**
     * @notice Unpauses an operator with signature verification
     * @param operator The address of the operator to unpause
     * @param signature EIP712 signature authorizing unpause
     */
    function unpauseOperator(address operator, bytes memory signature) public {
        _beforeUnpauseOperator(operator);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator, keccak256(abi.encode(UNPAUSE_OPERATOR_TYPEHASH, operator, $.nonces[operator]++)), signature
        );
        _unpauseOperator(operator);
    }

    /**
     * @notice Allows an operator to update their own key
     * @param key The new public key
     * @param signature Signature proving ownership of the key
     */
    function updateOperatorKey(bytes memory key, bytes memory signature) public {
        _verifyKey(msg.sender, key, signature);
        _beforeUpdateOperatorKey(msg.sender, key);
        _updateKey(msg.sender, key);
    }

    /**
     * @notice Updates an operator's key with signature verification
     * @param operator The address of the operator
     * @param key The new public key
     * @param signature EIP712 signature authorizing key update
     * @param keySignature Signature proving ownership of the new key
     */
    function updateOperatorKey(
        address operator,
        bytes memory key,
        bytes memory signature,
        bytes memory keySignature
    ) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UPDATE_OPERATOR_KEY_TYPEHASH, operator, keccak256(key), $.nonces[operator]++)),
            signature
        );
        _verifyKey(operator, key, keySignature);
        _beforeUpdateOperatorKey(operator, key);
        _updateKey(operator, key);
    }

    /**
     * @notice Allows an operator to register a vault association
     * @param vault The address of the vault to associate
     */
    function registerOperatorVault(
        address vault
    ) public {
        require(_isOperatorRegistered(msg.sender), "Operator not registered");
        _beforeRegisterOperatorVault(msg.sender, vault);
        _registerOperatorVault(msg.sender, vault);
    }

    /**
     * @notice Registers a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault registration
     */
    function registerOperatorVault(address operator, address vault, bytes memory signature) public {
        require(_isOperatorRegistered(operator), "Operator not registered");
        _beforeRegisterOperatorVault(operator, vault);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _registerOperatorVault(operator, vault);
    }

    /**
     * @notice Allows an operator to unregister a vault association
     * @param vault The address of the vault to unregister
     */
    function unregisterOperatorVault(
        address vault
    ) public {
        _beforeUnregisterOperatorVault(msg.sender, vault);
        _unregisterOperatorVault(msg.sender, vault);
    }

    /**
     * @notice Unregisters a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault unregistration
     */
    function unregisterOperatorVault(address operator, address vault, bytes memory signature) public {
        _beforeUnregisterOperatorVault(operator, vault);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UNREGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @notice Allows an operator to pause a vault association
     * @param vault The address of the vault to pause
     */
    function pauseOperatorVault(
        address vault
    ) public {
        _beforePauseOperatorVault(msg.sender, vault);
        _pauseOperatorVault(msg.sender, vault);
    }

    /**
     * @notice Pauses a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault pause
     */
    function pauseOperatorVault(address operator, address vault, bytes memory signature) public {
        _beforePauseOperatorVault(operator, vault);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(PAUSE_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _pauseOperatorVault(operator, vault);
    }

    /**
     * @notice Allows an operator to unpause a vault association
     * @param vault The address of the vault to unpause
     */
    function unpauseOperatorVault(
        address vault
    ) public {
        _beforeUnpauseOperatorVault(msg.sender, vault);
        _unpauseOperatorVault(msg.sender, vault);
    }

    /**
     * @notice Unpauses a vault association with signature verification
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param signature EIP712 signature authorizing vault unpause
     */
    function unpauseOperatorVault(address operator, address vault, bytes memory signature) public {
        _beforeUnpauseOperatorVault(operator, vault);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UNPAUSE_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _unpauseOperatorVault(operator, vault);
    }

    /**
     * @notice Verifies a key signature
     * @param operator The address of the operator
     * @param key The public key to verify
     * @param signature The signature to verify
     */
    function _verifyKey(address operator, bytes memory key, bytes memory signature) internal {
        if (key.length != 0 && !_verifyKeySignature(operator, key, signature)) {
            revert InvalidSignature();
        }
    }

    /**
     * @notice Verifies an EIP712 signature
     * @param operator The address of the operator
     * @param structHash The hash of the EIP712 struct
     * @param signature The signature to verify
     */
    function _verifyEIP712(address operator, bytes32 structHash, bytes memory signature) internal view {
        if (!SignatureChecker.isValidSignatureNow(operator, _hashTypedDataV4(structHash), signature)) {
            revert InvalidSignature();
        }
    }

    /**
     * @notice Hook called before updating an operator's key
     * @param operator The operator address
     * @param key The new key
     */
    function _beforeUpdateOperatorKey(address operator, bytes memory key) internal virtual {}

    /**
     * @notice Hook called before registering an operator
     * @param operator The operator address
     * @param key The operator's key
     * @param vault Optional vault address
     */
    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual {}

    /**
     * @notice Hook called before unregistering an operator
     * @param operator The operator address
     */
    function _beforeUnregisterOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called before pausing an operator
     * @param operator The operator address
     */
    function _beforePauseOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called before unpausing an operator
     * @param operator The operator address
     */
    function _beforeUnpauseOperator(
        address operator
    ) internal virtual {}

    /**
     * @notice Hook called before registering an operator vault
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeRegisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before unregistering an operator vault
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnregisterOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before pausing an operator vault
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforePauseOperatorVault(address operator, address vault) internal virtual {}

    /**
     * @notice Hook called before unpausing an operator vault
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual {}
}
