// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseOperators} from "./BaseOperators.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {ISelfRegisterOperators} from "../../interfaces/extensions/operators/ISelfRegisterOperators.sol";

/**
 * @title SelfRegisterOperators
 * @notice Contract for self-registration and management of operators with signature verification
 * @dev Extends BaseMiddleware, and EIP712Upgradeable to provide signature-based operator management
 * @dev CAUTION: If activeOperators functionality is needed, use ApprovalRegisterOperators instead to prevent DOS attacks
 */
abstract contract SelfRegisterOperators is BaseOperators, EIP712Upgradeable, ISelfRegisterOperators {
    uint64 public constant SelfRegisterOperators_VERSION = 1;

    // EIP-712 TypeHash constants
    bytes32 private constant REGISTER_OPERATOR_TYPEHASH =
        keccak256("RegisterOperator(address operator,address vault,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_TYPEHASH =
        keccak256("UnregisterOperator(address operator,uint256 nonce)");
    bytes32 private constant PAUSE_OPERATOR_TYPEHASH = keccak256("PauseOperator(address operator,uint256 nonce)");
    bytes32 private constant UNPAUSE_OPERATOR_TYPEHASH = keccak256("UnpauseOperator(address operator,uint256 nonce)");
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

    function nonces(
        address operator
    ) public view returns (uint256) {
        return _getSelfRegisterOperatorsStorage().nonces[operator];
    }

    function minVotingPowerThreshold() external view returns (uint256) {
        return _getSelfRegisterOperatorsStorage().minVotingPowerThreshold;
    }

    /**
     * @notice Initializes the contract with EIP712 domain separator
     * @param name The name to use for the EIP712 domain separator
     */
    function __SelfRegisterOperators_init(
        string memory name,
        uint256 minVotingPowerThreshold_
    ) internal onlyInitializing {
        __EIP712_init(name, "1");
        _getSelfRegisterOperatorsStorage().minVotingPowerThreshold = minVotingPowerThreshold_;
    }

    function registerOperator(
        address vault
    ) external virtual {
        _registerOperatorImpl(msg.sender, vault);
    }

    function registerOperator(address operator, address vault, bytes memory signature) public virtual {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _registerOperatorImpl(operator, vault);
    }

    function unregisterOperator() external override {
        _unregisterOperatorImpl(msg.sender);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperator(address operator, bytes memory signature) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator, keccak256(abi.encode(UNREGISTER_OPERATOR_TYPEHASH, operator, $.nonces[operator]++)), signature
        );
        _unregisterOperatorImpl(operator);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function pauseOperator() external override {
        _pauseOperatorImpl(msg.sender);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function pauseOperator(address operator, bytes memory signature) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator, keccak256(abi.encode(PAUSE_OPERATOR_TYPEHASH, operator, $.nonces[operator]++)), signature
        );
        _pauseOperatorImpl(operator);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unpauseOperator() external override {
        _unpauseOperatorImpl(msg.sender);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unpauseOperator(address operator, bytes memory signature) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator, keccak256(abi.encode(UNPAUSE_OPERATOR_TYPEHASH, operator, $.nonces[operator]++)), signature
        );
        _unpauseOperatorImpl(operator);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorVault(
        address vault
    ) external override {
        _registerOperatorVaultImpl(msg.sender, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorVault(address operator, address vault, bytes memory signature) public {
        if (!_isOperatorRegistered(operator)) {
            revert OperatorNotRegistered();
        }
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _registerOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperatorVault(
        address vault
    ) external override {
        _unregisterOperatorVaultImpl(msg.sender, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unregisterOperatorVault(address operator, address vault, bytes memory signature) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UNREGISTER_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _unregisterOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function pauseOperatorVault(
        address vault
    ) external override {
        _pauseOperatorVaultImpl(msg.sender, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function pauseOperatorVault(address operator, address vault, bytes memory signature) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(PAUSE_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _pauseOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unpauseOperatorVault(
        address vault
    ) external override {
        _unpauseOperatorVaultImpl(msg.sender, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function unpauseOperatorVault(address operator, address vault, bytes memory signature) public {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UNPAUSE_OPERATOR_VAULT_TYPEHASH, operator, vault, $.nonces[operator]++)),
            signature
        );
        _unpauseOperatorVaultImpl(operator, vault);
    }

    /**
     * @notice Updates the minimum power threshold for operators, be careful, this will allow to kick operators below the threshold
     * @param minVotingPowerThreshold_ The new minimum power threshold
     */
    function updatePowerThreshold(
        uint256 minVotingPowerThreshold_
    ) external checkAccess {
        _getSelfRegisterOperatorsStorage().minVotingPowerThreshold = minVotingPowerThreshold_;
    }

    /**
     * @notice Attempts to kick an operator if they are below the power threshold
     * @dev Will pause the operator if they are active, or unregister them if they are inactive
     * @param operator The address of the operator to try kicking
     */
    function pauseOperator(
        address operator
    ) public {
        if (!_isOperatorBelowPowerThreshold(operator, address(0))) {
            revert OperatorAbovePowerThreshold();
        }

        _pauseOperatorImpl(operator);
    }

    /**
     * @notice Attempts to kick an operator if they are below the power threshold
     * @dev Will pause the operator if they are active, or unregister them if they are inactive
     * @param operator The address of the operator to try kicking
     */
    function pauseOperatorVault(address operator, address vault) public {
        if (!_isOperatorBelowPowerThreshold(operator, vault)) {
            revert OperatorAbovePowerThreshold();
        }

        _pauseOperatorVaultImpl(operator, vault);
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

    function _registerOperatorImpl(address operator, address vault) internal virtual override {
        if (_isOperatorBelowPowerThreshold(operator, vault)) {
            revert OperatorPowerBelowThreshold();
        }
        super._registerOperatorImpl(operator, vault);
    }

    function _unpauseOperatorImpl(
        address operator
    ) internal virtual override {
        if (_isOperatorBelowPowerThreshold(operator)) {
            revert OperatorPowerBelowThreshold();
        }
        super._unpauseOperatorImpl(operator);
    }

    function _isOperatorBelowPowerThreshold(
        address operator
    ) internal view returns (bool) {
        return _getOperatorVotingPowerAt(operator, Time.timestamp())
            < _getSelfRegisterOperatorsStorage().minVotingPowerThreshold;
    }

    function _isOperatorBelowPowerThreshold(address operator, address vault) internal view returns (bool) {
        return _getOperatorVotingPowerAt(operator, vault, Time.timestamp())
            < _getSelfRegisterOperatorsStorage().minVotingPowerThreshold;
    }
}
