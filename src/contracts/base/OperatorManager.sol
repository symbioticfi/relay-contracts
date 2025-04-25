// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbioticfi/core/src/interfaces/service/IOptInService.sol";
import {StaticDelegateCallable} from "@symbioticfi/core/src/contracts/common/StaticDelegateCallable.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";

import {NetworkManager} from "./NetworkManager.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {OperatorManagerLogic} from "./logic/OperatorManagerLogic.sol";

/**
 * @title OperatorManager
 * @notice Manages operator registration and validation for the protocol
 * @dev Inherits from NetworkManager
 * to provide operator management functionality with network awareness and time-based features
 */
abstract contract OperatorManager is NetworkManager, StaticDelegateCallable {
    using Checkpoints for Checkpoints.Trace208;
    using Arrays for address[];

    function OperatorManager_VERSION() public pure returns (uint64) {
        return OperatorManagerLogic.OperatorManager_VERSION;
    }

    address public immutable OPERATOR_REGISTRY; // Address of the operator registry

    address public immutable OPERATOR_NETWORK_OPT_IN_SERVICE; // Address of the operator network opt-in service

    constructor(address operatorRegistry, address operatorNetworkOptInService) {
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NETWORK_OPT_IN_SERVICE = operatorNetworkOptInService;
    }

    /**
     * @notice Initializes the OperatorManager with required parameters
     */
    function __OperatorManager_init() internal virtual onlyInitializing {
        OperatorManagerLogic.initialize();
    }

    function getAllOperatorsLength() public view virtual returns (uint256) {
        return OperatorManagerLogic.getAllOperatorsLength();
    }

    function getAllOperators() public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getAllOperators();
    }

    function isOperatorActive(
        address operator
    ) public view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorActive(operator);
    }

    function isOperatorRegistered(
        address operator
    ) public view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorRegistered(operator);
    }

    function isOperatorActiveAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorActiveAt(operator, timestamp, hint);
    }

    function getActiveOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getActiveOperatorsAt(timestamp, hints);
    }

    function getActiveOperators() public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getActiveOperators();
    }

    function getActiveOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return OperatorManagerLogic.getActiveOperatorsLengthAt(timestamp, hint);
    }

    function getActiveOperatorsLength() public view virtual returns (uint256) {
        return OperatorManagerLogic.getActiveOperatorsLength();
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
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function _unregisterOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.unregisterOperator(operator);
    }
}
