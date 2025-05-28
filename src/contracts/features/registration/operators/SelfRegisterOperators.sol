// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../base/VaultManager.sol";
import {PermissionManager} from "../../../base/PermissionManager.sol";
import {OzEIP712} from "../../../base/common/OzEIP712.sol";

import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

import {ISelfRegisterOperators} from "../../../../interfaces/features/registration/operators/ISelfRegisterOperators.sol";

import {NoncesUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/NoncesUpgradeable.sol";

abstract contract SelfRegisterOperators is
    VaultManager,
    OzEIP712,
    PermissionManager,
    NoncesUpgradeable,
    ISelfRegisterOperators
{
    /**
     * @inheritdoc ISelfRegisterOperators
     */
    uint64 public constant SelfRegisterOperators_VERSION = 1;

    bytes32 private constant UNREGISTER_OPERATOR_TYPEHASH =
        keccak256("UnregisterOperator(address operator,uint256 nonce)");
    bytes32 private constant REGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("RegisterOperatorVault(address operator,address vault,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("UnregisterOperatorVault(address operator,address vault,uint256 nonce)");
    bytes32 private constant REGISTER_OPERATOR_TYPEHASH =
        keccak256("RegisterOperator(address operator,address vault,uint256 nonce)");

    function __SelfRegisterOperators_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperator(
        address vault
    ) public virtual {
        _registerOperatorImpl(msg.sender, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorWithSignature(address operator, address vault, bytes memory signature) public virtual {
        _verifyEIP712(
            operator, keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, vault, _useNonce(operator))), signature
        );
        _registerOperatorImpl(operator, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperator() public virtual {
        _unregisterOperator(msg.sender);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperatorWithSignature(address operator, bytes memory signature) public virtual {
        _verifyEIP712(
            operator, keccak256(abi.encode(UNREGISTER_OPERATOR_TYPEHASH, operator, _useNonce(operator))), signature
        );
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorVault(
        address vault
    ) public virtual {
        _registerOperatorVaultImpl(msg.sender, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorVaultWithSignature(
        address operator,
        address vault,
        bytes memory signature
    ) public virtual {
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, _useNonce(operator))),
            signature
        );
        _registerOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperatorVault(
        address vault
    ) public virtual {
        _unregisterOperatorVault(msg.sender, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperatorVaultWithSignature(
        address operator,
        address vault,
        bytes memory signature
    ) public virtual {
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UNREGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, _useNonce(operator))),
            signature
        );
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function increaseNonce() public virtual {
        _useNonce(msg.sender);
    }

    function _registerOperatorImpl(address operator, address vault) internal virtual {
        _registerOperator(operator);
        if (vault != address(0)) {
            _registerOperatorVaultImpl(operator, vault);
        }
    }

    function _registerOperatorVaultImpl(address operator, address vault) internal virtual {
        _registerOperatorVault(operator, vault);
    }

    function _verifyEIP712(address operator, bytes32 structHash, bytes memory signature) internal view {
        if (!SignatureChecker.isValidSignatureNow(operator, hashTypedDataV4(structHash), signature)) {
            revert SelfRegisterOperators_InvalidSignature();
        }
    }
}
