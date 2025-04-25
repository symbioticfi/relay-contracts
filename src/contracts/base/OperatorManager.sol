// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {StaticDelegateCallable} from "@symbioticfi/core/src/contracts/common/StaticDelegateCallable.sol";

import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";

import {NetworkManager} from "./NetworkManager.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {OperatorManagerLogic} from "./logic/OperatorManagerLogic.sol";

import {IOperatorManager} from "../../interfaces/base/IOperatorManager.sol";

abstract contract OperatorManager is NetworkManager, StaticDelegateCallable, IOperatorManager {
    using Checkpoints for Checkpoints.Trace208;
    using Arrays for address[];

    /**
     * @inheritdoc IOperatorManager
     */
    function OperatorManager_VERSION() public pure returns (uint64) {
        return OperatorManagerLogic.OperatorManager_VERSION;
    }

    /**
     * @inheritdoc IOperatorManager
     */
    address public immutable OPERATOR_REGISTRY;

    /**
     * @inheritdoc IOperatorManager
     */
    address public immutable OPERATOR_NETWORK_OPT_IN_SERVICE;

    constructor(address operatorRegistry, address operatorNetworkOptInService) {
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NETWORK_OPT_IN_SERVICE = operatorNetworkOptInService;
    }

    function __OperatorManager_init() internal virtual onlyInitializing {
        OperatorManagerLogic.initialize();
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getAllOperatorsLength() public view virtual returns (uint256) {
        return OperatorManagerLogic.getAllOperatorsLength();
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getAllOperators() public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getAllOperators();
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function isOperatorActive(
        address operator
    ) public view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorActive(operator);
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function isOperatorRegistered(
        address operator
    ) public view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorRegistered(operator);
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function isOperatorActiveAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorActiveAt(operator, timestamp, hint);
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getActiveOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getActiveOperatorsAt(timestamp, hints);
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getActiveOperators() public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getActiveOperators();
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getActiveOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return OperatorManagerLogic.getActiveOperatorsLengthAt(timestamp, hint);
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getActiveOperatorsLength() public view virtual returns (uint256) {
        return OperatorManagerLogic.getActiveOperatorsLength();
    }

    function _registerOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.registerOperator(OPERATOR_REGISTRY, OPERATOR_NETWORK_OPT_IN_SERVICE, operator);
    }

    function _unregisterOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.unregisterOperator(operator);
    }
}
