// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";

import {Checkpoints} from "../structs/Checkpoints.sol";
import {CheckpointsEnumerableMap} from "../structs/CheckpointsEnumerableMap.sol";
import {Hints} from "../utils/Hints.sol";
import {NetworkManagerLogic} from "./NetworkManagerLogic.sol";

library OperatorManagerLogic {
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

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        uint48 _oldestNeededTimestamp;
        CheckpointsEnumerableMap.AddressToTrace208Map _operators;
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

    function getOldestNeededTimestamp() public view returns (uint48) {
        return _getOperatorManagerStorage()._oldestNeededTimestamp;
    }

    /**
     * @notice Returns the total number of registered operators, including both active and inactive
     * @return The number of registered operators
     */
    function getOperatorsLength() public view returns (uint256) {
        return _getOperatorManagerStorage()._operators.length();
    }

    function getOperators() public view returns (address[] memory) {
        return _getOperatorManagerStorage()._operators.keys();
    }

    function isOperatorRegistered(
        address operator
    ) public view returns (bool) {
        return _getOperatorManagerStorage()._operators.contains(operator);
    }

    function isOperatorUnpaused(
        address operator
    ) public view returns (bool) {
        (bool exists, Checkpoints.Trace208 storage checkpoints) =
            _getOperatorManagerStorage()._operators.tryGet(operator);
        return exists && checkpoints.latest() > 0;
    }

    function isOperatorUnpausedAt(address operator, uint48 timestamp, bytes memory hint) public view returns (bool) {
        (bool exists, Checkpoints.Trace208 storage checkpoints) =
            _getOperatorManagerStorage()._operators.tryGet(operator);
        return exists && checkpoints.upperLookupRecent(timestamp, hint) > 0;
    }

    function getActiveOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory activeOperators) {
        address[] memory registeredOperators = _getOperatorManagerStorage()._operators.keys();
        uint256 registeredOperatorsLength = registeredOperators.length;
        activeOperators = new address[](registeredOperatorsLength);
        hints = hints.normalize(registeredOperatorsLength);
        uint256 length;
        for (uint256 i; i < registeredOperatorsLength; ++i) {
            if (isOperatorUnpausedAt(registeredOperators[i], timestamp, hints[i])) {
                activeOperators[length++] = registeredOperators[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeOperators, length)
        }
    }

    function getActiveOperators() public view returns (address[] memory activeOperators) {
        address[] memory registeredOperators = _getOperatorManagerStorage()._operators.keys();
        uint256 registeredOperatorsLength = registeredOperators.length;
        activeOperators = new address[](registeredOperatorsLength);
        uint256 length;
        for (uint256 i; i < registeredOperatorsLength; ++i) {
            if (isOperatorUnpaused(registeredOperators[i])) {
                activeOperators[length++] = registeredOperators[i];
            }
        }
        assembly ("memory-safe") {
            mstore(activeOperators, length)
        }
    }

    function setOldestNeededTimestamp(
        uint48 oldestNeededTimestamp
    ) public {
        _getOperatorManagerStorage()._oldestNeededTimestamp = oldestNeededTimestamp;
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

        if (!_getOperatorManagerStorage()._operators.set(operator, Time.timestamp(), 1)) {
            revert OperatorAlreadyRegistered();
        }
    }

    /**
     * @notice Pauses a registered operator
     * @param operator The address of the operator to pause
     */
    function pauseOperator(
        address operator
    ) public {
        if (_getOperatorManagerStorage()._operators.set(operator, Time.timestamp(), 0)) {
            revert OperatorNotRegistered();
        }
    }

    /**
     * @notice Unpauses a paused operator
     * @param operator The address of the operator to unpause
     */
    function unpauseOperator(
        address operator
    ) public {
        if (_getOperatorManagerStorage()._operators.set(operator, Time.timestamp(), 1)) {
            revert OperatorNotRegistered();
        }
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function unregisterOperator(
        address operator
    ) public {
        (bool exists, uint48 timestamp, uint208 value) =
            _getOperatorManagerStorage()._operators.get(operator).latestCheckpoint();
        if (!exists || timestamp >= getOldestNeededTimestamp() || value > 0) {
            revert UnregisterNotAllowed();
        }
        _getOperatorManagerStorage()._operators.remove(operator);
    }
}
