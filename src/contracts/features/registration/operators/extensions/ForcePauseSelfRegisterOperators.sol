// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "../SelfRegisterOperators.sol";
import {IForcePauseSelfRegisterOperators} from
    "../../../../../interfaces/features/registration/operators/extensions/IForcePauseSelfRegisterOperators.sol";

abstract contract ForcePauseSelfRegisterOperators is SelfRegisterOperators, IForcePauseSelfRegisterOperators {
    uint64 public constant ForcePauseSelfRegisterOperators_VERSION = 1;

    /// @custom:storage-location erc7201:symbiotic.storage.ForcePauseSelfRegisterOperators
    struct ForcePauseSelfRegisterOperatorsStorage {
        mapping(address => bool) _forcePaused;
        mapping(address => mapping(address => bool)) _forcePausedVault;
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

    function __ForcePauseSelfRegisterOperators_init() internal virtual onlyInitializing {}

    function isOperatorForcePaused(
        address operator
    ) public view virtual returns (bool) {
        return _getForcePauseStorage()._forcePaused[operator];
    }

    function isOperatorVaultForcePaused(address operator, address vault) public view virtual returns (bool) {
        return _getForcePauseStorage()._forcePausedVault[operator][vault];
    }

    function forceUnpauseOperator(
        address operator
    ) public virtual checkPermission {
        if (!isOperatorForcePaused(operator)) {
            revert ForcePauseSelfRegisterOperators_OperatorNotForcePaused();
        }
        _getForcePauseStorage()._forcePaused[operator] = false;
    }

    function forcePauseOperator(
        address operator
    ) public virtual checkPermission {
        if (isOperatorForcePaused(operator)) {
            revert ForcePauseSelfRegisterOperators_OperatorForcePaused();
        }
        _getForcePauseStorage()._forcePaused[operator] = true;
        if (isOperatorActive(operator)) {
            _unregisterOperator(operator);
        }
    }

    function forceUnpauseOperatorVault(address operator, address vault) public virtual checkPermission {
        if (!isOperatorVaultForcePaused(operator, vault)) {
            revert ForcePauseSelfRegisterOperators_OperatorVaultNotForcePaused();
        }
        _getForcePauseStorage()._forcePausedVault[operator][vault] = false;
    }

    function forcePauseOperatorVault(address operator, address vault) public virtual checkPermission {
        if (isOperatorVaultForcePaused(operator, vault)) {
            revert ForcePauseSelfRegisterOperators_OperatorVaultForcePaused();
        }
        _getForcePauseStorage()._forcePausedVault[operator][vault] = true;
        if (isOperatorVaultActive(operator, vault)) {
            _unregisterOperatorVault(operator, vault);
        }
    }

    function _registerOperatorImpl(address operator, address vault, bytes memory extraData) internal virtual override {
        if (isOperatorForcePaused(operator)) {
            revert ForcePauseSelfRegisterOperators_OperatorForcePaused();
        }
        super._registerOperatorImpl(operator, vault, extraData);
    }

    function _registerOperatorVaultImpl(
        address operator,
        address vault,
        bytes memory extraData
    ) internal virtual override {
        if (isOperatorVaultForcePaused(operator, vault)) {
            revert ForcePauseSelfRegisterOperators_OperatorVaultForcePaused();
        }
        super._registerOperatorVaultImpl(operator, vault, extraData);
    }
}
