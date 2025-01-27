// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";
import {IForcePauseSelfRegisterOperators} from
    "../../interfaces/extensions/operators/IForcePauseSelfRegisterOperators.sol";
import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

/**
 * @title ForcePauseSelfRegisterOperators
 * @notice Extension of SelfRegisterOperators that allows authorized addresses to forcefully pause operators
 * @dev Implements force pause functionality and prevents unpausing of force-paused operators
 */
abstract contract ForcePauseSelfRegisterOperators is SelfRegisterOperators, IForcePauseSelfRegisterOperators {
    using EnumerableMap for EnumerableMap.AddressToAddressMap;

    uint64 public constant ForcePauseSelfRegisterOperators_VERSION = 1;

    struct ForcePauseSelfRegisterOperatorsStorage {
        mapping(address => bool) forcePaused;
        mapping(address => mapping(address => bool)) forcePausedVault;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ForcePauseSelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ForcePauseSelfRegisterOperatorsStorageLocation =
        0xf3871d05fd4da42686c3c56dfd4be98b1d278da4bf1fd61b1d6e7a6e37722600;

    function _getForcePauseStorage() internal pure returns (ForcePauseSelfRegisterOperatorsStorage storage $) {
        bytes32 location = ForcePauseSelfRegisterOperatorsStorageLocation;
        assembly {
            $.slot := location
        }
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forcePauseOperator(
        address operator
    ) external checkAccess {
        _getForcePauseStorage().forcePaused[operator] = true;
        if (_operatorWasActiveAt(_now() + 1, operator)) {
            _pauseOperatorImpl(operator);
        }
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnpauseOperator(
        address operator
    ) external checkAccess {
        _getForcePauseStorage().forcePaused[operator] = false;
        if (!_isOperatorRegistered(operator)) {
            return;
        }
        _unpauseOperatorImpl(operator);
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnregisterOperator(
        address operator
    ) external checkAccess {
        _unregisterOperatorImpl(operator);
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forcePauseOperatorVault(address operator, address vault) external checkAccess {
        _getForcePauseStorage().forcePausedVault[operator][vault] = true;
        if (_operatorVaultWasActiveAt(_now() + 1, operator, vault)) {
            _pauseOperatorVaultImpl(operator, vault);
        }
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnpauseOperatorVault(address operator, address vault) external checkAccess {
        _getForcePauseStorage().forcePausedVault[operator][vault] = false;
        if (!_getVaultManagerStorage()._vaultOperator.contains(vault)) {
            return;
        }
        _unpauseOperatorVaultImpl(operator, vault);
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnregisterOperatorVault(address operator, address vault) external checkAccess {
        _unregisterOperatorVaultImpl(operator, vault);
    }

    /**
     * @notice Override to prevent unpausing force-paused operators
     * @param operator The operator address
     */
    function _beforeUnpauseOperator(
        address operator
    ) internal virtual override {
        super._beforeUnpauseOperator(operator);
        if (_operatorForcePaused(operator)) revert OperatorForcePaused();
    }

    /**
     * @notice Override to prevent registering force-paused operators
     * @param operator The operator address
     * @param key The operator's public key
     * @param vault The vault address
     */
    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual override {
        super._beforeRegisterOperator(operator, key, vault);
        if (_operatorForcePaused(operator)) revert OperatorForcePaused();
    }

    /**
     * @notice Override to prevent unpausing force-paused operator-vault pairs
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual override {
        super._beforeUnpauseOperatorVault(operator, vault);
        if (_operatorVaultForcePaused(operator, vault)) revert OperatorVaultForcePaused();
    }

    /**
     * @notice Override to prevent registering force-paused operator-vault pairs
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeRegisterOperatorVault(address operator, address vault) internal virtual override {
        super._beforeRegisterOperatorVault(operator, vault);
        if (_operatorVaultForcePaused(operator, vault)) revert OperatorVaultForcePaused();
    }

    function _operatorForcePaused(
        address operator
    ) private view returns (bool) {
        return _getForcePauseStorage().forcePaused[operator];
    }

    function _operatorVaultForcePaused(address operator, address vault) private view returns (bool) {
        return _getForcePauseStorage().forcePausedVault[operator][vault];
    }
}
