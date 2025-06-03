// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../VotingPowerProvider.sol";

import {IOperatorsBlacklist} from "../../../../interfaces/modules/voting-power/extensions/IOperatorsBlacklist.sol";

abstract contract OperatorsBlacklist is VotingPowerProvider, IOperatorsBlacklist {
    /**
     * @inheritdoc IOperatorsBlacklist
     */
    uint64 public constant OperatorsBlacklist_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorsBlacklist")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorsBlacklistStorageLocation =
        0xf3871d05fd4da42686c3c56dfd4be98b1d278da4bf1fd61b1d6e7a6e37722600;

    function _getForcePauseStorage() internal pure returns (OperatorsBlacklistStorage storage $) {
        bytes32 location = OperatorsBlacklistStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __OperatorsBlacklist_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc IOperatorsBlacklist
     */
    function isOperatorForcePaused(
        address operator
    ) public view virtual returns (bool) {
        return _getForcePauseStorage()._forcePaused[operator];
    }

    /**
     * @inheritdoc IOperatorsBlacklist
     */
    function isOperatorVaultForcePaused(address operator, address vault) public view virtual returns (bool) {
        return _getForcePauseStorage()._forcePausedVault[operator][vault];
    }

    /**
     * @inheritdoc IOperatorsBlacklist
     */
    function forcePauseOperator(
        address operator
    ) public virtual checkPermission {
        if (isOperatorForcePaused(operator)) {
            revert OperatorsBlacklist_OperatorForcePaused();
        }
        _getForcePauseStorage()._forcePaused[operator] = true;
        if (isOperatorRegistered(operator)) {
            _unregisterOperator(operator);
        }

        emit ForcePauseOperator(operator);
    }

    /**
     * @inheritdoc IOperatorsBlacklist
     */
    function forceUnpauseOperator(
        address operator
    ) public virtual checkPermission {
        if (!isOperatorForcePaused(operator)) {
            revert OperatorsBlacklist_OperatorNotForcePaused();
        }
        _getForcePauseStorage()._forcePaused[operator] = false;

        emit ForceUnpauseOperator(operator);
    }

    /**
     * @inheritdoc IOperatorsBlacklist
     */
    function forcePauseOperatorVault(address operator, address vault) public virtual checkPermission {
        if (isOperatorVaultForcePaused(operator, vault)) {
            revert OperatorsBlacklist_OperatorVaultForcePaused();
        }
        _getForcePauseStorage()._forcePausedVault[operator][vault] = true;
        if (isOperatorVaultRegistered(operator, vault)) {
            _unregisterOperatorVault(operator, vault);
        }

        emit ForcePauseOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IOperatorsBlacklist
     */
    function forceUnpauseOperatorVault(address operator, address vault) public virtual checkPermission {
        if (!isOperatorVaultForcePaused(operator, vault)) {
            revert OperatorsBlacklist_OperatorVaultNotForcePaused();
        }
        _getForcePauseStorage()._forcePausedVault[operator][vault] = false;

        emit ForceUnpauseOperatorVault(operator, vault);
    }

    function _registerOperatorImpl(address operator, address vault) internal virtual override {
        if (isOperatorForcePaused(operator)) {
            revert OperatorsBlacklist_OperatorForcePaused();
        }
        super._registerOperatorImpl(operator, vault);
    }

    function _registerOperatorVaultImpl(address operator, address vault) internal virtual override {
        if (isOperatorVaultForcePaused(operator, vault)) {
            revert OperatorsBlacklist_OperatorVaultForcePaused();
        }
        super._registerOperatorVaultImpl(operator, vault);
    }
}
