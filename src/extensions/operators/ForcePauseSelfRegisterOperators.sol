// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";
import {IForcePauseSelfRegisterOperators} from
    "../../interfaces/extensions/operators/IForcePauseSelfRegisterOperators.sol";

/**
 * @title ForcePauseSelfRegisterOperators
 * @notice Extension of SelfRegisterOperators that allows authorized addresses to forcefully pause operators
 * @dev Implements force pause functionality and prevents unpausing of force-paused operators
 */
abstract contract ForcePauseSelfRegisterOperators is SelfRegisterOperators, IForcePauseSelfRegisterOperators {
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
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePaused[operator] = true;
        _beforePauseOperator(operator);
        if (_operatorWasActiveAt(_now(), operator)) {
            _pauseOperator(operator);
        }
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnpauseOperator(
        address operator
    ) external checkAccess {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePaused[operator] = false;
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnregisterOperator(
        address operator
    ) external checkAccess {
        _beforeUnregisterOperator(operator);
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forcePauseOperatorVault(address operator, address vault) external checkAccess {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePausedVault[operator][vault] = true;
        _beforePauseOperatorVault(operator, vault);
        if (_operatorVaultWasActiveAt(_now(), operator, vault)) {
            _pauseOperatorVault(operator, vault);
        }
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnpauseOperatorVault(address operator, address vault) external checkAccess {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePausedVault[operator][vault] = false;
        _beforeUnpauseOperatorVault(operator, vault);
        _unpauseOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IForcePauseSelfRegisterOperators
     */
    function forceUnregisterOperatorVault(address operator, address vault) external checkAccess {
        _beforeUnregisterOperatorVault(operator, vault);
        _unregisterOperatorVault(operator, vault);
    }

    /**
     * @notice Override to prevent unpausing force-paused operators
     * @param operator The operator address
     */
    function _beforeUnpauseOperator(
        address operator
    ) internal virtual override {
        super._beforeUnpauseOperator(operator);
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePaused[operator]) revert OperatorForcePaused();
    }

    /**
     * @notice Override to prevent unregistering force-paused operators
     * @param operator The operator address
     */
    function _beforeUnregisterOperator(
        address operator
    ) internal virtual override {
        super._beforeUnregisterOperator(operator);
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePaused[operator]) revert OperatorForcePaused();
    }

    /**
     * @notice Override to prevent unpausing force-paused operator-vault pairs
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual override {
        super._beforeUnpauseOperatorVault(operator, vault);
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePausedVault[operator][vault]) revert OperatorVaultForcePaused();
    }

    /**
     * @notice Override to prevent unregistering force-paused operator-vault pairs
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnregisterOperatorVault(address operator, address vault) internal virtual override {
        super._beforeUnregisterOperatorVault(operator, vault);
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePausedVault[operator][vault]) revert OperatorVaultForcePaused();
    }
}
