// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";
import {StaticDelegateCallable} from "@symbiotic/contracts/common/StaticDelegateCallable.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";

import {NetworkManager} from "./NetworkManager.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {CheckpointsEnumerableMap} from "../../libraries/structs/CheckpointsEnumerableMap.sol";
import {Hints} from "../../libraries/utils/Hints.sol";
import {OperatorManagerLogic} from "../libraries/logic/OperatorManagerLogic.sol";

/**
 * @title OperatorManager
 * @notice Manages operator registration and validation for the protocol
 * @dev Inherits from NetworkManager
 * to provide operator management functionality with network awareness and time-based features
 */
abstract contract OperatorManager is NetworkManager, StaticDelegateCallable {
    using Checkpoints for Checkpoints.Trace208;
    using CheckpointsEnumerableMap for CheckpointsEnumerableMap.AddressToTrace208Map;
    using Hints for bytes[];
    using Arrays for address[];

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorAlreadyRegistered();
    error OperatorNotRegistered();
    error OperatorNotPaused();
    error InvalidLength();
    error UnregisterNotAllowed();

    address public immutable OPERATOR_REGISTRY; // Address of the operator registry

    address public immutable OPERATOR_NETWORK_OPT_IN_SERVICE; // Address of the operator network opt-in service

    constructor(address operatorRegistry, address operatorNetworkOptInService) {
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NETWORK_OPT_IN_SERVICE = operatorNetworkOptInService;
    }

    /**
     * @notice Initializes the OperatorManager with required parameters
     */
    function __OperatorManager_init() internal virtual onlyInitializing {}

    function _getOldestNeededTimestamp() internal view virtual returns (uint48) {
        return OperatorManagerLogic.getOldestNeededTimestamp();
    }

    /**
     * @notice Returns the total number of registered operators, including both active and inactive
     * @return The number of registered operators
     */
    function _getOperatorsLength() internal view virtual returns (uint256) {
        return OperatorManagerLogic.getOperatorsLength();
    }

    function _getOperators() internal view virtual returns (address[] memory) {
        return OperatorManagerLogic.getOperators();
    }

    function _isOperatorRegistered(
        address operator
    ) internal view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorRegistered(operator);
    }

    function _isOperatorUnpaused(
        address operator
    ) internal view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorUnpaused(operator);
    }

    function _isOperatorUnpausedAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) internal view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorUnpausedAt(operator, timestamp, hint);
    }

    function _getActiveOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (address[] memory activeOperators) {
        return OperatorManagerLogic.getActiveOperatorsAt(timestamp, hints);
    }

    function _getActiveOperators() internal view virtual returns (address[] memory activeOperators) {
        return OperatorManagerLogic.getActiveOperators();
    }

    function _setOldestNeededTimestamp(
        uint48 oldestNeededTimestamp
    ) internal virtual {
        OperatorManagerLogic.setOldestNeededTimestamp(oldestNeededTimestamp);
    }

    /**
     * @notice Registers a new operator
     * @param operator The address of the operator to register
     */
    function _registerOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.registerOperator(OPERATOR_REGISTRY, OPERATOR_NETWORK_OPT_IN_SERVICE, operator);
    }

    /**
     * @notice Pauses a registered operator
     * @param operator The address of the operator to pause
     */
    function _pauseOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.pauseOperator(operator);
    }

    /**
     * @notice Unpauses a paused operator
     * @param operator The address of the operator to unpause
     */
    function _unpauseOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.unpauseOperator(operator);
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function _unregisterOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.unregisterOperator(operator);
    }
}
