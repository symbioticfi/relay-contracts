// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseSelfRegisterOperators} from "../../BaseSelfRegisterOperators.sol";
import {IBaseForcePauseSelfRegisterOperators} from
    "../../../../../../../interfaces/features/registration/operators/self-register-operators/extensions/force-pause/IBaseForcePauseSelfRegisterOperators.sol";

abstract contract BaseForcePauseSelfRegisterOperators is
    BaseSelfRegisterOperators,
    IBaseForcePauseSelfRegisterOperators
{
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.BaseForcePauseSelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BaseForcePauseSelfRegisterOperatorsStorageLocation =
        0xf3871d05fd4da42686c3c56dfd4be98b1d278da4bf1fd61b1d6e7a6e37722600;

    function _getForcePauseStorage() internal pure returns (BaseForcePauseSelfRegisterOperatorsStorage storage $) {
        bytes32 location = BaseForcePauseSelfRegisterOperatorsStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __BaseForcePauseSelfRegisterOperators_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc IBaseForcePauseSelfRegisterOperators
     */
    function isOperatorForcePaused(
        address operator
    ) public view virtual returns (bool) {
        return _getForcePauseStorage()._forcePaused[operator];
    }

    /**
     * @inheritdoc IBaseForcePauseSelfRegisterOperators
     */
    function isOperatorVaultForcePaused(address operator, address vault) public view virtual returns (bool) {
        return _getForcePauseStorage()._forcePausedVault[operator][vault];
    }

    /**
     * @inheritdoc IBaseForcePauseSelfRegisterOperators
     */
    function forceUnpauseOperator(
        address operator
    ) public virtual checkPermission {
        if (!isOperatorForcePaused(operator)) {
            revert BaseForcePauseSelfRegisterOperators_OperatorNotForcePaused();
        }
        _getForcePauseStorage()._forcePaused[operator] = false;
    }

    /**
     * @inheritdoc IBaseForcePauseSelfRegisterOperators
     */
    function forcePauseOperator(
        address operator
    ) public virtual checkPermission {
        if (isOperatorForcePaused(operator)) {
            revert BaseForcePauseSelfRegisterOperators_OperatorForcePaused();
        }
        _getForcePauseStorage()._forcePaused[operator] = true;
        if (isOperatorActive(operator)) {
            _unregisterOperator(operator);
        }
    }

    /**
     * @inheritdoc IBaseForcePauseSelfRegisterOperators
     */
    function forceUnpauseOperatorVault(address operator, address vault) public virtual checkPermission {
        if (!isOperatorVaultForcePaused(operator, vault)) {
            revert BaseForcePauseSelfRegisterOperators_OperatorVaultNotForcePaused();
        }
        _getForcePauseStorage()._forcePausedVault[operator][vault] = false;
    }

    /**
     * @inheritdoc IBaseForcePauseSelfRegisterOperators
     */
    function forcePauseOperatorVault(address operator, address vault) public virtual checkPermission {
        if (isOperatorVaultForcePaused(operator, vault)) {
            revert BaseForcePauseSelfRegisterOperators_OperatorVaultForcePaused();
        }
        _getForcePauseStorage()._forcePausedVault[operator][vault] = true;
        if (isOperatorVaultActive(operator, vault)) {
            _unregisterOperatorVault(operator, vault);
        }
    }

    function _registerOperatorImpl(address operator, address vault, bytes memory extraData) internal virtual override {
        if (isOperatorForcePaused(operator)) {
            revert BaseForcePauseSelfRegisterOperators_OperatorForcePaused();
        }
        super._registerOperatorImpl(operator, vault, extraData);
    }

    function _registerOperatorVaultImpl(
        address operator,
        address vault,
        bytes memory extraData
    ) internal virtual override {
        if (isOperatorVaultForcePaused(operator, vault)) {
            revert BaseForcePauseSelfRegisterOperators_OperatorVaultForcePaused();
        }
        super._registerOperatorVaultImpl(operator, vault, extraData);
    }
}
