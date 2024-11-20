// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../BaseMiddleware.sol";
import {BaseSig} from "../sigs/BaseSig.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

abstract contract SelfRegisterOperators is BaseMiddleware, BaseSig, EIP712Upgradeable {
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

    mapping(address => uint256) public nonces;

    function __SelfRegisterOperators_init(
        string memory name
    ) internal onlyInitializing {
        __EIP712_init(name, "1.0");
    }

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

    function registerOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) public {
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, keccak256(key), vault, nonces[operator]++)),
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

    function unregisterOperator() public {
        _beforeUnregisterOperator(msg.sender);
        _unregisterOperator(msg.sender);
    }

    function unregisterOperator(address operator, bytes memory signature) public {
        _beforeUnregisterOperator(operator);
        _verifyEIP712(
            operator, keccak256(abi.encode(UNREGISTER_OPERATOR_TYPEHASH, operator, nonces[operator]++)), signature
        );
        _unregisterOperator(operator);
    }

    function pauseOperator() public {
        _beforePauseOperator(msg.sender);
        _pauseOperator(msg.sender);
    }

    function pauseOperator(address operator, bytes memory signature) public {
        _beforePauseOperator(operator);
        _verifyEIP712(operator, keccak256(abi.encode(PAUSE_OPERATOR_TYPEHASH, operator, nonces[operator]++)), signature);
        _pauseOperator(operator);
    }

    function unpauseOperator() public {
        _beforeUnpauseOperator(msg.sender);
        _unpauseOperator(msg.sender);
    }

    function unpauseOperator(address operator, bytes memory signature) public {
        _beforeUnpauseOperator(operator);
        _verifyEIP712(
            operator, keccak256(abi.encode(UNPAUSE_OPERATOR_TYPEHASH, operator, nonces[operator]++)), signature
        );
        _unpauseOperator(operator);
    }

    function updateOperatorKey(bytes memory key, bytes memory signature) public {
        _verifyKey(msg.sender, key, signature);
        _beforeUpdateOperatorKey(msg.sender, key);
        _updateKey(msg.sender, key);
    }

    function updateOperatorKey(
        address operator,
        bytes memory key,
        bytes memory signature,
        bytes memory keySignature
    ) public {
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UPDATE_OPERATOR_KEY_TYPEHASH, operator, keccak256(key), nonces[operator]++)),
            signature
        );
        _verifyKey(operator, key, keySignature);
        _beforeUpdateOperatorKey(operator, key);
        _updateKey(operator, key);
    }

    function registerOperatorVault(
        address vault
    ) public {
        require(isOperatorRegistered(msg.sender), "Operator not registered");
        _beforeRegisterOperatorVault(msg.sender, vault);
        _registerOperatorVault(msg.sender, vault);
    }

    function registerOperatorVault(address operator, address vault, bytes memory signature) public {
        require(isOperatorRegistered(operator), "Operator not registered");
        _beforeRegisterOperatorVault(operator, vault);
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, nonces[operator]++)),
            signature
        );
        _registerOperatorVault(operator, vault);
    }

    function unregisterOperatorVault(
        address vault
    ) public {
        _beforeUnregisterOperatorVault(msg.sender, vault);
        _unregisterOperatorVault(msg.sender, vault);
    }

    function unregisterOperatorVault(address operator, address vault, bytes memory signature) public {
        _beforeUnregisterOperatorVault(operator, vault);
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UNREGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, nonces[operator]++)),
            signature
        );
        _unregisterOperatorVault(operator, vault);
    }

    function pauseOperatorVault(
        address vault
    ) public {
        _beforePauseOperatorVault(msg.sender, vault);
        _pauseOperatorVault(msg.sender, vault);
    }

    function pauseOperatorVault(address operator, address vault, bytes memory signature) public {
        _beforePauseOperatorVault(operator, vault);
        _verifyEIP712(
            operator,
            keccak256(abi.encode(PAUSE_OPERATOR_VAULT_TYPEHASH, operator, vault, nonces[operator]++)),
            signature
        );
        _pauseOperatorVault(operator, vault);
    }

    function unpauseOperatorVault(
        address vault
    ) public {
        _beforeUnpauseOperatorVault(msg.sender, vault);
        _unpauseOperatorVault(msg.sender, vault);
    }

    function unpauseOperatorVault(address operator, address vault, bytes memory signature) public {
        _beforeUnpauseOperatorVault(operator, vault);
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UNPAUSE_OPERATOR_VAULT_TYPEHASH, operator, vault, nonces[operator]++)),
            signature
        );
        _unpauseOperatorVault(operator, vault);
    }

    function _verifyKey(address operator, bytes memory key, bytes memory signature) internal view {
        if (key.length != 0 && !_verifyKeySignature(operator, key, signature)) {
            revert InvalidSignature();
        }
    }

    function _verifyEIP712(address operator, bytes32 structHash, bytes memory signature) internal view {
        if (!SignatureChecker.isValidSignatureNow(operator, _hashTypedDataV4(structHash), signature)) {
            revert InvalidSignature();
        }
    }

    function _beforeUpdateOperatorKey(address operator, bytes memory key) internal virtual {}
    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual {}
    function _beforeUnregisterOperator(
        address operator
    ) internal virtual {}
    function _beforePauseOperator(
        address operator
    ) internal virtual {}
    function _beforeUnpauseOperator(
        address operator
    ) internal virtual {}
    function _beforeRegisterOperatorVault(address operator, address vault) internal virtual {}
    function _beforeUnregisterOperatorVault(address operator, address vault) internal virtual {}
    function _beforePauseOperatorVault(address operator, address vault) internal virtual {}
    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual {}
}
