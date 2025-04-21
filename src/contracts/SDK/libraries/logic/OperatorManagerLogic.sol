// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbioticfi/core/src/interfaces/service/IOptInService.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {PersistentSet} from "../../../libraries/structs/PersistentSet.sol";
import {NetworkManagerLogic} from "./NetworkManagerLogic.sol";

library OperatorManagerLogic {
    using Checkpoints for Checkpoints.Trace208;
    using Arrays for address[];
    using PersistentSet for PersistentSet.AddressSet;
    using EnumerableSet for EnumerableSet.AddressSet;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorAlreadyRegistered();
    error OperatorNotRegistered();
    error InvalidLength();
    error UnregisterNotAllowed();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        PersistentSet.AddressSet _operators;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorManagerStorageLocation =
        0x3b2b549db680c436ebf9aa3c8eeee850852f16da5cdb5137dbc0299ebb219e00;

    /**
     * @notice Gets the storage pointer for OperatorManager state
     * @return $ Storage pointer to OperatorManagerStorage struct
     */
    function _getOperatorManagerStorage() internal pure returns (OperatorManagerStorage storage $) {
        assembly {
            $.slot := OperatorManagerStorageLocation
        }
    }

    /**
     * @notice Initializes the OperatorManager with required parameters
     */
    function initialize() public {}

    function isOperatorRegistered(
        address operator
    ) public view returns (bool) {
        return _getOperatorManagerStorage()._operators.contains(operator);
    }

    /**
     * @notice Returns the total number of registered operators, including both active and inactive
     * @return The number of registered operators
     */
    function getAllOperatorsLength() public view returns (uint256) {
        return _getOperatorManagerStorage()._operators.allValues().length();
    }

    function getAllOperators() public view returns (address[] memory) {
        return _getOperatorManagerStorage()._operators.allValues().values();
    }

    function isOperatorActive(
        address operator
    ) public view returns (bool) {
        return _getOperatorManagerStorage()._operators.contains(operator);
    }

    function isOperatorActiveAt(address operator, uint48 timestamp, bytes memory hint) public view returns (bool) {
        return _getOperatorManagerStorage()._operators.contains(timestamp, operator, hint);
    }

    function getActiveOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory activeOperators) {
        return _getOperatorManagerStorage()._operators.values(timestamp, hints);
    }

    function getActiveOperators() public view returns (address[] memory activeOperators) {
        return _getOperatorManagerStorage()._operators.values();
    }

    function getActiveOperatorsLength() public view returns (uint256) {
        return _getOperatorManagerStorage()._operators.length();
    }

    function getActiveOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getOperatorManagerStorage()._operators.length(timestamp, hint);
    }

    /**
     * @notice Registers a new operator
     * @param operator The address of the operator to register
     */
    function registerOperator(
        address OPERATOR_REGISTRY,
        address OPERATOR_NETWORK_OPT_IN_SERVICE,
        address operator
    ) public {
        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NETWORK_OPT_IN_SERVICE).isOptedIn(operator, NetworkManagerLogic.NETWORK())) {
            revert OperatorNotOptedIn();
        }

        if (!_getOperatorManagerStorage()._operators.add(Time.timestamp(), operator)) {
            revert OperatorAlreadyRegistered();
        }
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function unregisterOperator(
        address operator
    ) public {
        if (!_getOperatorManagerStorage()._operators.remove(Time.timestamp(), operator)) {
            revert OperatorNotRegistered();
        }
    }
}
