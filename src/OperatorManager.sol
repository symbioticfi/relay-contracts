// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseMiddleware} from "./BaseMiddleware.sol";
import {PauseableEnumerableSet} from "./libraries/PauseableEnumerableSet.sol";

abstract contract OperatorManager is BaseMiddleware {
    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorNotRegistered();
    error OperatorAlreadyRegistred();

    PauseableEnumerableSet.AddressSet internal operators;

    /* 
     * Returns the length of the operators list.
     * @return The number of registered operators.
     */
    function operatorsLength() external view returns (uint256) {
        return operators.length();
    }

    /* 
     * Returns the operator and their associated enabled and disabled times at a specific position.
     * @param pos The index position in the operators array.
     * @return The address, enabled epoch, and disabled epoch of the operator.
     */
    function operatorWithTimesAt(uint256 pos) external view returns (address, uint48, uint48) {
        return operators.at(pos);
    }

    /* 
     * Returns a list of active operators.
     * @return An array of addresses representing the active operators.
     */
    function activeOperators() public view returns (address[] memory) {
        return operators.getActive(getCurrentEpoch());
    }

    /* 
     * Registers a new operator.
     * @param operator The address of the operator to register.
     */
    function registerOperator(address operator) external onlyOwner {
        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NET_OPTIN).isOptedIn(operator, NETWORK)) {
            revert OperatorNotOptedIn();
        }

        operators.register(getNextEpoch(), operator);
    }

    /* 
     * Pauses a registered operator.
     * @param operator The address of the operator to pause.
     */
    function pauseOperator(address operator) external onlyOwner {
        operators.pause(getNextEpoch(), operator);
    }

    /* 
     * Unpauses a paused operator.
     * @param operator The address of the operator to unpause.
     */
    function unpauseOperator(address operator) external onlyOwner {
        operators.unpause(getNextEpoch(), SLASHING_WINDOW, operator);
    }

    /* 
     * Unregisters an operator.
     * @param operator The address of the operator to unregister.
     */
    function unregisterOperator(address operator) external onlyOwner {
        operators.unregister(getNextEpoch(), SLASHING_WINDOW, operator);
    }
}
