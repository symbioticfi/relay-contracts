// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {NetworkManager} from "./NetworkManager.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {OperatorManagerLogic} from "./logic/OperatorManagerLogic.sol";

import {IOperatorManager} from "../../interfaces/base/IOperatorManager.sol";

abstract contract OperatorManager is NetworkManager, IOperatorManager {
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

    constructor(
        address operatorRegistry
    ) {
        OPERATOR_REGISTRY = operatorRegistry;
    }

    function __OperatorManager_init() internal virtual onlyInitializing {
        OperatorManagerLogic.initialize();
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function isOperatorRegisteredAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return OperatorManagerLogic.isOperatorRegisteredAt(operator, timestamp, hint);
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
    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getOperatorsAt(timestamp, hints);
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getOperators() public view virtual returns (address[] memory) {
        return OperatorManagerLogic.getOperators();
    }

    /**
     * @inheritdoc IOperatorManager
     */
    function getOperatorsLength() public view virtual returns (uint256) {
        return OperatorManagerLogic.getOperatorsLength();
    }

    function _registerOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.registerOperator(OPERATOR_REGISTRY, operator);
    }

    function _unregisterOperator(
        address operator
    ) internal virtual {
        OperatorManagerLogic.unregisterOperator(operator);
    }
}
