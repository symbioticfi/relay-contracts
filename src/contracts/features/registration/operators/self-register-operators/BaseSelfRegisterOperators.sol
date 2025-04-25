// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../../base/VaultManager.sol";
import {PermissionManager} from "../../../../base/PermissionManager.sol";
import {OzEIP712} from "../../../../base/common/OzEIP712.sol";

import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

import {IBaseSelfRegisterOperators} from
    "../../../../../interfaces/features/registration/operators/self-register-operators/IBaseSelfRegisterOperators.sol";

import {NoncesUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/NoncesUpgradeable.sol";

abstract contract BaseSelfRegisterOperators is
    VaultManager,
    OzEIP712,
    PermissionManager,
    NoncesUpgradeable,
    IBaseSelfRegisterOperators
{
    bytes32 private constant UNREGISTER_OPERATOR_TYPEHASH =
        keccak256("UnregisterOperator(address operator,uint256 nonce)");
    bytes32 private constant REGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("RegisterOperatorVault(address operator,address vault,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("UnregisterOperatorVault(address operator,address vault,uint256 nonce)");

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.BaseSelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BaseSelfResgisterOperators_STORAGE_LOCATION =
        0x7c1bcd600c3fcfbc53470fac03a90d5cf6aa7b77c3f1ed10e6c6bd4d192eaf00;

    function _getBaseSelfRegisterOperatorsStorage()
        internal
        pure
        returns (BaseSelfRegisterOperatorsStorage storage $)
    {
        bytes32 location = BaseSelfResgisterOperators_STORAGE_LOCATION;
        assembly {
            $.slot := location
        }
    }

    function __BaseSelfRegisterOperators_init(
        uint256 minVotingPowerThreshold
    ) internal virtual onlyInitializing {
        _getBaseSelfRegisterOperatorsStorage().minVotingPowerThreshold = minVotingPowerThreshold;
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function getMinVotingPowerThreshold() public view virtual returns (uint256) {
        return _getBaseSelfRegisterOperatorsStorage().minVotingPowerThreshold;
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function isOperatorBelowPowerThreshold(
        address operator,
        bytes memory extraData
    ) public view virtual returns (bool) {
        return getOperatorVotingPower(operator, extraData) < getMinVotingPowerThreshold();
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function isOperatorBelowPowerThreshold(
        address operator,
        address vault,
        bytes memory extraData
    ) public view virtual returns (bool) {
        return getOperatorVotingPower(operator, vault, extraData) < getMinVotingPowerThreshold();
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function unregisterOperator() public virtual {
        _unregisterOperator(msg.sender);
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function unregisterOperatorWithSignature(address operator, bytes memory signature) public virtual {
        _verifyEIP712(
            operator, keccak256(abi.encode(UNREGISTER_OPERATOR_TYPEHASH, operator, _useNonce(operator))), signature
        );
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function unregisterOperator(address operator, bytes memory extraData) public virtual {
        if (!isOperatorBelowPowerThreshold(operator, extraData)) {
            revert BaseSelfRegisterOperators_OperatorPowerAboveThreshold();
        }
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function registerOperatorVault(address vault, bytes memory extraData) public virtual {
        _registerOperatorVaultImpl(msg.sender, vault, extraData);
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function registerOperatorVaultWithSignature(
        address operator,
        address vault,
        bytes memory signature,
        bytes memory extraData
    ) public virtual {
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, _useNonce(operator))),
            signature
        );
        _registerOperatorVaultImpl(operator, vault, extraData);
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function unregisterOperatorVault(
        address vault
    ) public virtual {
        _unregisterOperatorVault(msg.sender, vault);
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
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
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function unregisterOperatorVault(address operator, address vault, bytes memory extraData) public virtual {
        if (!isOperatorBelowPowerThreshold(operator, vault, extraData)) {
            revert BaseSelfRegisterOperators_OperatorVaultPowerAboveThreshold();
        }
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function updatePowerThreshold(
        uint256 minVotingPowerThreshold_
    ) public virtual checkPermission {
        _getBaseSelfRegisterOperatorsStorage().minVotingPowerThreshold = minVotingPowerThreshold_;
    }

    /**
     * @inheritdoc IBaseSelfRegisterOperators
     */
    function increaseNonce() public virtual {
        _useNonce(msg.sender);
    }

    function _registerOperatorImpl(address operator, address vault, bytes memory extraData) internal virtual {
        _registerOperator(operator);
        if (vault != address(0)) {
            _registerOperatorVaultImpl(operator, vault, extraData);
        } else if (isOperatorBelowPowerThreshold(operator, extraData)) {
            revert BaseSelfRegisterOperators_OperatorPowerBelowThreshold();
        }
    }

    function _registerOperatorVaultImpl(address operator, address vault, bytes memory extraData) internal virtual {
        _registerOperatorVault(operator, vault);
        if (isOperatorBelowPowerThreshold(operator, vault, extraData)) {
            revert BaseSelfRegisterOperators_OperatorVaultPowerBelowThreshold();
        }
    }

    function _verifyEIP712(address operator, bytes32 structHash, bytes memory signature) internal view {
        if (!SignatureChecker.isValidSignatureNow(operator, _hashTypedDataV4(structHash), signature)) {
            revert BaseSelfRegisterOperators_InvalidSignature();
        }
    }
}
