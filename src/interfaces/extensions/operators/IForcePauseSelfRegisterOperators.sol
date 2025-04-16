// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISelfRegisterOperators} from "./ISelfRegisterOperators.sol";

/**
 * @title IForcePauseSelfRegisterOperators
 * @notice Interface for force pausing operators and operator-vault pairs
 */
interface IForcePauseSelfRegisterOperators {
    error OperatorForcePaused();
    error OperatorVaultForcePaused();

    struct ForcePauseSelfRegisterOperatorsStorage {
        mapping(address => bool) forcePaused;
        mapping(address => mapping(address => bool)) forcePausedVault;
    }

    event ForcePauseOperator(address operator);
    event ForceUnpauseOperator(address operator);
    event ForcePauseOperatorVault(address operator, address vault);
    event ForceUnpauseOperatorVault(address operator, address vault);

    function ForcePauseSelfRegisterOperators_VERSION() external view returns (uint64);

    /**
     * @notice Forces an operator to be paused
     * @param operator The address of the operator to pause
     */
    function forcePauseOperator(
        address operator
    ) external;

    /**
     * @notice Forces an operator to be unpaused
     * @param operator The address of the operator to unpause
     */
    function forceUnpauseOperator(
        address operator
    ) external;

    /**
     * @notice Forces an operator to be unregistered
     * @param operator The address of the operator to unregister
     */
    function forceUnregisterOperator(
        address operator
    ) external;

    /**
     * @notice Forces a specific operator-vault pair to be paused
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function forcePauseOperatorVault(address operator, address vault) external;

    /**
     * @notice Forces a specific operator-vault pair to be unpaused
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function forceUnpauseOperatorVault(address operator, address vault) external;

    /**
     * @notice Forces a specific operator-vault pair to be unregistered
     * @param operator The address of the operator
     * @param vault The address of the vault
     */
    function forceUnregisterOperatorVault(address operator, address vault) external;
}
