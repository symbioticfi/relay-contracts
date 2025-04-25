// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISelfRegisterOperators} from "../ISelfRegisterOperators.sol";

/**
 * @title IForcePauseSelfRegisterOperators
 * @notice Interface for force pausing operators and operator-vault pairs
 */
interface IForcePauseSelfRegisterOperators {
    error ForcePauseSelfRegisterOperators_OperatorNotRegistered();
    error ForcePauseSelfRegisterOperators_OperatorNotForcePaused();
    error ForcePauseSelfRegisterOperators_OperatorForcePaused();
    error ForcePauseSelfRegisterOperators_OperatorVaultNotForcePaused();
    error ForcePauseSelfRegisterOperators_OperatorVaultForcePaused();

    /**
     * @notice Forces an operator to be unregistered
     * @param operator The address of the operator to unregister
     */
    function forceUnregisterOperator(
        address operator
    ) external;

    /**
     * @notice Forces a specific operator-vault pair to be unregistered
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function forceUnregisterOperatorVault(address operator, address vault) external;
}
