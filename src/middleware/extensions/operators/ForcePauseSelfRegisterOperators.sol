// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";

/**
 * @title ForcePauseSelfRegisterOperators
 * @notice Extension of SelfRegisterOperators that allows authorized addresses to forcefully pause operators
 * @dev Implements force pause functionality and prevents unpausing of force-paused operators
 */
abstract contract ForcePauseSelfRegisterOperators is SelfRegisterOperators {
    struct ForcePauseSelfRegisterOperatorsStorage {
        mapping(address => bool) forcePaused;
        mapping(address => mapping(address => bool)) forcePausedVault;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ForcePauseSelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ForcePauseSelfRegisterOperatorsStorageLocation =
        0xdd349876372c6239a846e50336b70d810259637738fd42711d201341e1e8d600;

    function _getForcePauseStorage() private pure returns (ForcePauseSelfRegisterOperatorsStorage storage $) {
        bytes32 location = ForcePauseSelfRegisterOperatorsStorageLocation;
        assembly {
            $.slot := location
        }
    }

    error OperatorForcePaused();
    error OperatorVaultForcePaused();

    /**
     * @notice Forces an operator to be paused
     * @param operator The address of the operator to pause
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forcePauseOperator(
        address operator
    ) public checkAccess {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePaused[operator] = true;
        _beforePauseOperator(operator);
        _pauseOperator(operator);
    }

    /**
     * @notice Forces an operator to be unpaused
     * @param operator The address of the operator to unpause
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forceUnpauseOperator(
        address operator
    ) public checkAccess {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePaused[operator] = false;
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
    }

    /**
     * @notice Forces a specific operator-vault pair to be paused
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forcePauseOperatorVault(address operator, address vault) public checkAccess {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePausedVault[operator][vault] = true;
        _beforePauseOperatorVault(operator, vault);
        _pauseOperatorVault(operator, vault);
    }

    /**
     * @notice Forces a specific operator-vault pair to be unpaused
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @dev Can only be called by authorized addresses (checkAccess modifier)
     */
    function forceUnpauseOperatorVault(address operator, address vault) public checkAccess {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        $.forcePausedVault[operator][vault] = false;
        _beforeUnpauseOperatorVault(operator, vault);
        _unpauseOperatorVault(operator, vault);
    }

    /**
     * @notice Override to prevent unpausing force-paused operators
     * @param operator The operator address
     */
    function _beforeUnpauseOperator(
        address operator
    ) internal virtual override {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePaused[operator]) revert OperatorForcePaused();
        super._beforeUnpauseOperator(operator);
    }

    /**
     * @notice Override to prevent unregistering force-paused operators
     * @param operator The operator address
     */
    function _beforeUnregisterOperator(
        address operator
    ) internal virtual override {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePaused[operator]) revert OperatorForcePaused();
        super._beforeUnregisterOperator(operator);
    }

    /**
     * @notice Override to prevent unpausing force-paused operator-vault pairs
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual override {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePausedVault[operator][vault]) revert OperatorVaultForcePaused();
        super._beforeUnpauseOperatorVault(operator, vault);
    }

    /**
     * @notice Override to prevent unregistering force-paused operator-vault pairs
     * @param operator The operator address
     * @param vault The vault address
     */
    function _beforeUnregisterOperatorVault(address operator, address vault) internal virtual override {
        ForcePauseSelfRegisterOperatorsStorage storage $ = _getForcePauseStorage();
        if ($.forcePausedVault[operator][vault]) revert OperatorVaultForcePaused();
        super._beforeUnregisterOperatorVault(operator, vault);
    }
}
