// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../../base/VaultManager.sol";
import {PermissionManager} from "../../../base/PermissionManager.sol";

import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

import {ISelfRegisterOperators} from "../../../../interfaces/features/registration/operators/ISelfRegisterOperators.sol";

/**
 * @title SelfRegisterOperators
 * @notice Contract for self-registration and management of operators with signature verification
 * @dev Extends EIP712Upgradeable to provide signature-based operator management
 * @dev CAUTION: If activeOperators functionality is needed, use ApprovalRegisterOperators instead to prevent DOS attacks
 */
abstract contract SelfRegisterOperators is
    VaultManager,
    EIP712Upgradeable,
    PermissionManager,
    ISelfRegisterOperators
{
    uint64 public constant SelfRegisterOperators_VERSION = 1;

    // EIP-712 TypeHash constants
    bytes32 private constant REGISTER_OPERATOR_TYPEHASH =
        keccak256("RegisterOperator(address operator,address vault,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_TYPEHASH =
        keccak256("UnregisterOperator(address operator,uint256 nonce)");
    bytes32 private constant REGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("RegisterOperatorVault(address operator,address vault,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_VAULT_TYPEHASH =
        keccak256("UnregisterOperatorVault(address operator,address vault,uint256 nonce)");

    /// @custom:storage-location erc7201:symbiotic.storage.SelfRegisterOperators
    struct SelfRegisterOperatorsStorage {
        mapping(address => uint256) nonces;
        uint256 minVotingPowerThreshold;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SelfResgisterOperators_STORAGE_LOCATION =
        0x7c1bcd600c3fcfbc53470fac03a90d5cf6aa7b77c3f1ed10e6c6bd4d192eaf00;

    function _getSelfRegisterOperatorsStorage() internal pure returns (SelfRegisterOperatorsStorage storage $) {
        bytes32 location = SelfResgisterOperators_STORAGE_LOCATION;
        assembly {
            $.slot := location
        }
    }

    function __SelfRegisterOperators_init(
        SelfRegisterOperatorsInitParams memory initParams
    ) internal virtual onlyInitializing {
        _getSelfRegisterOperatorsStorage().minVotingPowerThreshold = initParams.minVotingPowerThreshold;
    }

    function nonces(
        address operator
    ) public view virtual returns (uint256) {
        return _getSelfRegisterOperatorsStorage().nonces[operator];
    }

    function getMinVotingPowerThreshold() public view virtual returns (uint256) {
        return _getSelfRegisterOperatorsStorage().minVotingPowerThreshold;
    }

    function isOperatorBelowPowerThreshold(
        address operator,
        bytes memory extraData
    ) public view virtual returns (bool) {
        return getOperatorVotingPower(operator, extraData) < getMinVotingPowerThreshold();
    }

    function isOperatorBelowPowerThreshold(
        address operator,
        address vault,
        bytes memory extraData
    ) public view virtual returns (bool) {
        return getOperatorVotingPower(operator, vault, extraData) < getMinVotingPowerThreshold();
    }

    function registerOperator(address vault, bytes memory extraData) public virtual {
        _registerOperatorImpl(msg.sender, vault, extraData);
    }

    function registerOperatorWithSignature(
        address operator,
        address vault,
        bytes memory signature,
        bytes memory extraData
    ) public virtual {
        _verifyEIP712(
            operator,
            keccak256(
                abi.encode(
                    REGISTER_OPERATOR_TYPEHASH, operator, vault, _getSelfRegisterOperatorsStorage().nonces[operator]++
                )
            ),
            signature
        );
        _registerOperatorImpl(operator, vault, extraData);
    }

    function unregisterOperator() public virtual {
        _unregisterOperator(msg.sender);
    }

    function unregisterOperatorWithSignature(address operator, bytes memory signature) public virtual {
        _verifyEIP712(
            operator,
            keccak256(
                abi.encode(
                    UNREGISTER_OPERATOR_TYPEHASH, operator, _getSelfRegisterOperatorsStorage().nonces[operator]++
                )
            ),
            signature
        );
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperator(address operator, bytes memory extraData) public virtual {
        if (!isOperatorBelowPowerThreshold(operator, extraData)) {
            revert SelfRegisterOperators_OperatorPowerAboveThreshold();
        }
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorVault(address vault, bytes memory extraData) public virtual {
        _registerOperatorVaultImpl(msg.sender, vault, extraData);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorVaultWithSignature(
        address operator,
        address vault,
        bytes memory signature,
        bytes memory extraData
    ) public virtual {
        _verifyEIP712(
            operator,
            keccak256(
                abi.encode(
                    REGISTER_OPERATOR_VAULT_TYPEHASH,
                    operator,
                    vault,
                    _getSelfRegisterOperatorsStorage().nonces[operator]++
                )
            ),
            signature
        );
        _registerOperatorVaultImpl(operator, vault, extraData);
    }

    function unregisterOperatorVault(
        address vault
    ) public virtual {
        _unregisterOperatorVault(msg.sender, vault);
    }

    function unregisterOperatorVaultWithSignature(
        address operator,
        address vault,
        bytes memory signature
    ) public virtual {
        _verifyEIP712(
            operator,
            keccak256(
                abi.encode(
                    UNREGISTER_OPERATOR_VAULT_TYPEHASH,
                    operator,
                    vault,
                    _getSelfRegisterOperatorsStorage().nonces[operator]++
                )
            ),
            signature
        );
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperatorVault(address operator, address vault, bytes memory extraData) public virtual {
        if (!isOperatorBelowPowerThreshold(operator, vault, extraData)) {
            revert SelfRegisterOperators_OperatorVaultPowerAboveThreshold();
        }
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @notice Updates the minimum power threshold for operators, be careful, this will allow to kick operators below the threshold
     * @param minVotingPowerThreshold_ The new minimum power threshold
     */
    function updatePowerThreshold(
        uint256 minVotingPowerThreshold_
    ) public virtual checkPermission {
        _getSelfRegisterOperatorsStorage().minVotingPowerThreshold = minVotingPowerThreshold_;
    }

    function _registerOperatorImpl(address operator, address vault, bytes memory extraData) internal virtual {
        _registerOperator(operator);
        if (vault != address(0)) {
            _registerOperatorVaultImpl(operator, vault, extraData);
        } else if (isOperatorBelowPowerThreshold(operator, extraData)) {
            revert SelfRegisterOperators_OperatorPowerBelowThreshold();
        }
    }

    function _registerOperatorVaultImpl(address operator, address vault, bytes memory extraData) internal virtual {
        _registerOperatorVault(operator, vault);
        if (isOperatorBelowPowerThreshold(operator, vault, extraData)) {
            revert SelfRegisterOperators_OperatorVaultPowerBelowThreshold();
        }
    }

    function _verifyEIP712(address operator, bytes32 structHash, bytes memory signature) internal view {
        if (!SignatureChecker.isValidSignatureNow(operator, _hashTypedDataV4(structHash), signature)) {
            revert SelfRegisterOperators_InvalidSignature();
        }
    }
}
