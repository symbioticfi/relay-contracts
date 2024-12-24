// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseOperators} from "./BaseOperators.sol";
import {SigManager} from "../../managers/extendable/SigManager.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import {ISelfRegisterOperators} from "../../interfaces/extensions/operators/ISelfRegisterOperators.sol";

/**
 * @title SelfRegisterOperators
 * @notice Contract for self-registration and management of operators with signature verification
 * @dev Extends BaseMiddleware, SigManager, and EIP712Upgradeable to provide signature-based operator management
 * @dev CAUTION: If activeOperators functionality is needed, use ApprovalRegisterOperators instead to prevent DOS attacks
 */
abstract contract SelfRegisterOperators is BaseOperators, SigManager, EIP712Upgradeable, ISelfRegisterOperators {
    uint64 public constant SelfRegisterOperators_VERSION = 1;

    // EIP-712 TypeHash constants
    bytes32 internal constant REGISTER_OPERATOR_TYPEHASH =
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
        uint256 minPower;
        mapping(address => uint256) nonces;
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

    /**
     * @notice Initializes the contract with EIP712 domain separator and minimum power threshold
     * @param name The name to use for the EIP712 domain separator
     * @param _minPower The minimum power threshold
     */
    function __SelfRegisterOperators_init(string memory name, uint256 _minPower) internal onlyInitializing {
        __EIP712_init(name, "1");
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        $.minPower = _minPower;
    }

    function nonces(
        address operator
    ) public view returns (uint256) {
        return _getSelfRegisterOperatorsStorage().nonces[operator];
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperator(bytes memory key, address vault, bytes memory signature) external virtual {
        _verifyKey(msg.sender, key, signature);
        _checkMinPower(msg.sender, vault);
        _registerOperatorImpl(msg.sender, key, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) public virtual {
        _verifyKey(operator, key, keySignature);
        _checkMinPower(operator, vault);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, keccak256(key), vault, $.nonces[operator]++)),
            signature
        );
        _registerOperatorImpl(operator, key, vault);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
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
    function updateOperatorKey(bytes memory key, bytes memory signature) external override {
        _verifyKey(msg.sender, key, signature);
        _updateOperatorKeyImpl(msg.sender, key);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function updateOperatorKey(
        address operator,
        bytes memory key,
        bytes memory signature,
        bytes memory keySignature
    ) public {
        _verifyKey(operator, key, keySignature);
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(UPDATE_OPERATOR_KEY_TYPEHASH, operator, keccak256(key), $.nonces[operator]++)),
            signature
        );
        _updateOperatorKeyImpl(operator, key);
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

    function _checkMinPower(address operator, address vault) internal view {
        SelfRegisterOperatorsStorage storage $ = _getSelfRegisterOperatorsStorage();
        address[] memory vaults = _activeVaults();
        uint160[] memory subnetworks = _activeSubnetworks();
        uint256 power = _getOperatorPower(operator, vaults, subnetworks);
        if (address(vault) != address(0)) {
            vaults = new address[](1);
            vaults[0] = vault;
            power += _getOperatorPower(operator, vaults, subnetworks);
        }
        if (power < $.minPower) {
            revert NotEnoughPower();
        }
    }

    /**
     * @notice Verifies a key signature
     * @param operator The address of the operator
     * @param key The public key to verify (zero key is allowed for deletion)
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
}
