// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseManager} from "./BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

abstract contract OperatorManager is BaseManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorNotRegistered();
    error OperatorAlreadyRegistred();

    PauseableEnumerableSet.AddressSet internal _operators;

    /**
     * @notice Returns the total number of registered operators, including both active and inactive
     * @return The number of registered operators
     */
    function operatorsLength() public view returns (uint256) {
        return _operators.length();
    }

    /**
     * @notice Returns the operator and their associated enabled and disabled times at a specific position
     * @param pos The index position in the operators array
     * @return The operator address
     * @return The enabled timestamp
     * @return The disabled timestamp
     */
    function operatorWithTimesAt(
        uint256 pos
    ) public view returns (address, uint48, uint48) {
        return _operators.at(pos);
    }

    /**
     * @notice Returns a list of active operators
     * @return Array of addresses representing the active operators
     */
    function activeOperators() public view returns (address[] memory) {
        return _operators.getActive(getCaptureTimestamp());
    }

    /**
     * @notice Returns a list of active operators at a specific timestamp
     * @param timestamp The timestamp to check
     * @return Array of addresses representing the active operators at the timestamp
     */
    function activeOperatorsAt(
        uint48 timestamp
    ) public view returns (address[] memory) {
        return _operators.getActive(timestamp);
    }

    /**
     * @notice Checks if a given operator was active at a specified timestamp
     * @param timestamp The timestamp to check
     * @param operator The operator address to check
     * @return True if the operator was active at the timestamp, false otherwise
     */
    function operatorWasActiveAt(uint48 timestamp, address operator) public view returns (bool) {
        return _operators.wasActiveAt(timestamp, operator);
    }

    /**
     * @notice Checks if an operator is registered
     * @param operator The address of the operator to check
     * @return True if the operator is registered, false otherwise
     */
    function isOperatorRegistered(
        address operator
    ) public view returns (bool) {
        return _operators.contains(operator);
    }

    /**
     * @notice Registers a new operator
     * @param operator The address of the operator to register
     * @custom:throws NotOperator if operator is not registered in the operator registry
     * @custom:throws OperatorNotOptedIn if operator has not opted into the network
     */
    function _registerOperator(
        address operator
    ) internal {
        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NET_OPTIN).isOptedIn(operator, NETWORK)) {
            revert OperatorNotOptedIn();
        }

        _operators.register(Time.timestamp(), operator);
    }

    /**
     * @notice Pauses a registered operator
     * @param operator The address of the operator to pause
     */
    function _pauseOperator(
        address operator
    ) internal {
        _operators.pause(Time.timestamp(), operator);
    }

    /**
     * @notice Unpauses a paused operator
     * @param operator The address of the operator to unpause
     */
    function _unpauseOperator(
        address operator
    ) internal {
        _operators.unpause(Time.timestamp(), SLASHING_WINDOW, operator);
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function _unregisterOperator(
        address operator
    ) internal {
        _operators.unregister(Time.timestamp(), SLASHING_WINDOW, operator);
    }
}
