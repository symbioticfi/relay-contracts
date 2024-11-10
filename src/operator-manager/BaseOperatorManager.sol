// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseManager} from "../BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

abstract contract BaseOperatorManager is BaseManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorNotRegistered();
    error OperatorAlreadyRegistred();

    PauseableEnumerableSet.AddressSet internal _operators;

    /* 
     * @notice Returns the total number of registered operators, including both active and inactive.
     * @return The number of registered operators.
     */
    function operatorsLength() public view returns (uint256) {
        return _operators.length();
    }

    /* 
     * @notice Returns the operator and their associated enabled and disabled times at a specific position.
     * @param pos The index position in the operators array.
     * @return The address, enabled epoch, disabled epoch and enabled before disabled epoch of the operator.
     */
    function operatorWithTimesAt(uint256 pos) public view returns (address, uint48, uint48) {
        return _operators.at(pos);
    }

    /* 
     * @notice Returns a list of active operators.
     * @return An array of addresses representing the active operators.
     */
    function activeOperators() public view returns (address[] memory) {
        return _operators.getActive(getCaptureTimestamp());
    }

    /* 
     * @notice Checks if a given operator was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param operator The operator to check.
     * @return A boolean indicating whether the operator was active at the specified timestamp.
     */
    function operatorWasActiveAt(uint48 timestamp, address operator) public view returns (bool) {
        return _operators.wasActiveAt(timestamp, operator);
    }

    /* 
     * @notice Registers a new operator.
     * @param operator The address of the operator to register.
     */
    function _registerOperator(address operator) internal {
        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NET_OPTIN).isOptedIn(operator, NETWORK)) {
            revert OperatorNotOptedIn();
        }

        _operators.register(getCaptureTimestamp(), operator);
    }

    /* 
     * @notice Pauses a registered operator.
     * @param operator The address of the operator to pause.
     */
    function _pauseOperator(address operator) internal {
        _operators.pause(Time.timestamp(), operator);
    }

    /* 
     * @notice Unpauses a paused operator.
     * @param operator The address of the operator to unpause.
     */
    function _unpauseOperator(address operator) internal {
        _operators.unpause(Time.timestamp(), SLASHING_WINDOW, operator);
    }

    /* 
     * @notice Unregisters an operator.
     * @param operator The address of the operator to unregister.
     */
    function _unregisterOperator(address operator) internal {
        _operators.unregister(Time.timestamp(), SLASHING_WINDOW, operator);
    }
}
