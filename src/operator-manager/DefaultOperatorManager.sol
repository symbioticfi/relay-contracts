// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {BaseOperatorManager} from "./BaseOperatorManager.sol";

abstract contract DefaultOperatorManager is BaseOperatorManager {
    /* 
     * @notice Registers a new operator.
     * @param operator The address of the operator to register.
     */
    function registerOperator(address operator) public virtual onlyOwner {
        _registerOperator(operator);
    }

    /* 
     * @notice Pauses a registered operator.
     * @param operator The address of the operator to pause.
     */
    function pauseOperator(address operator) public virtual onlyOwner {
        _pauseOperator(operator);
    }

    /* 
     * @notice Unpauses a paused operator.
     * @param operator The address of the operator to unpause.
     */
    function unpauseOperator(address operator) public virtual onlyOwner {
        _unpauseOperator(operator);
    }

    /* 
     * @notice Unregisters an operator.
     * @param operator The address of the operator to unregister.
     */
    function unregisterOperator(address operator) public virtual onlyOwner {
        _unregisterOperator(operator);
    }
}
