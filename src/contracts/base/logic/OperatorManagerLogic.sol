// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";

import {IOperatorManager} from "../../../interfaces/base/IOperatorManager.sol";

library OperatorManagerLogic {
    using Checkpoints for Checkpoints.Trace208;
    using PersistentSet for PersistentSet.AddressSet;
    using EnumerableSet for EnumerableSet.AddressSet;

    uint64 internal constant OperatorManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorManagerStorageLocation =
        0x3b2b549db680c436ebf9aa3c8eeee850852f16da5cdb5137dbc0299ebb219e00;

    function _getOperatorManagerStorage() internal pure returns (IOperatorManager.OperatorManagerStorage storage $) {
        assembly {
            $.slot := OperatorManagerStorageLocation
        }
    }

    function initialize() public {}

    function isOperatorRegisteredAt(address operator, uint48 timestamp, bytes memory hint) public view returns (bool) {
        return _getOperatorManagerStorage()._operators.containsAt(timestamp, operator, hint);
    }

    function isOperatorRegistered(
        address operator
    ) public view returns (bool) {
        return _getOperatorManagerStorage()._operators.contains(operator);
    }

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) public view returns (address[] memory) {
        return _getOperatorManagerStorage()._operators.valuesAt(timestamp, hints);
    }

    function getOperators() public view returns (address[] memory) {
        return _getOperatorManagerStorage()._operators.values();
    }

    function getOperatorsLength() public view returns (uint256) {
        return _getOperatorManagerStorage()._operators.length();
    }

    function registerOperator(address OPERATOR_REGISTRY, address operator) public {
        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert IOperatorManager.OperatorManager_NotOperator();
        }

        if (!_getOperatorManagerStorage()._operators.add(Time.timestamp(), operator)) {
            revert IOperatorManager.OperatorManager_OperatorAlreadyRegistered();
        }

        emit IOperatorManager.RegisterOperator(operator);
    }

    function unregisterOperator(
        address operator
    ) public {
        if (!_getOperatorManagerStorage()._operators.remove(Time.timestamp(), operator)) {
            revert IOperatorManager.OperatorManager_OperatorNotRegistered();
        }

        emit IOperatorManager.UnregisterOperator(operator);
    }
}
