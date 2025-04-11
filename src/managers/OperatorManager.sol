// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";
import {StaticDelegateCallable} from "@symbiotic/contracts/common/StaticDelegateCallable.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {NetworkManager} from "./NetworkManager.sol";

import {Checkpoints} from "../libraries/Checkpoints.sol";
import {CheckpointsEnumerableMap} from "../libraries/EnumerableMap.sol";

/**
 * @title OperatorManager
 * @notice Manages operator registration and validation for the protocol
 * @dev Inherits from NetworkManager and SlashingWindowStorage
 * to provide operator management functionality with network awareness and time-based features
 */
abstract contract OperatorManager is NetworkManager, StaticDelegateCallable {
    using Checkpoints for Checkpoints.Trace208;
    using CheckpointsEnumerableMap for CheckpointsEnumerableMap.AddressToTrace208Map;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorAlreadyRegistered();
    error OperatorNotRegistered();
    error OperatorNotPaused();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        uint48 _oldestNeededTimestamp;
        CheckpointsEnumerableMap.AddressToTrace208Map _operators;
    }

    address public immutable OPERATOR_REGISTRY; // Address of the operator registry

    address public immutable OPERATOR_NETWORK_OPT_IN_SERVICE; // Address of the operator network opt-in service

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorManagerStorageLocation =
        0x3b2b549db680c436ebf9aa3c8eeee850852f16da5cdb5137dbc0299ebb219e00;

    constructor(address operatorRegistry, address operatorNetworkOptInService) {
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NETWORK_OPT_IN_SERVICE = operatorNetworkOptInService;
    }

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
    function __OperatorManager_init_private() internal onlyInitializing {}

    function _getOldestNeededTimestamp() internal view returns (uint48) {
        return _getOperatorManagerStorage()._oldestNeededTimestamp;
    }

    /**
     * @notice Returns the total number of registered operators, including both active and inactive
     * @return The number of registered operators
     */
    function _getOperatorsLength() internal view returns (uint256) {
        return _getOperatorManagerStorage()._operators.length();
    }

    function _getOperators() internal view returns (address[] memory) {
        return _getOperatorManagerStorage()._operators.keys();
    }

    function _isOperatorRegistered(
        address operator
    ) internal view returns (bool) {
        return _getOperatorManagerStorage()._operators.contains(operator);
    }

    function _isOperatorUnpaused(
        address operator
    ) internal view returns (bool) {
        (bool exists, Checkpoints.Trace208 storage checkpoints) =
            _getOperatorManagerStorage()._operators.tryGet(operator);
        return exists && checkpoints.latest() > 0;
    }

    function _isOperatorUnpausedAt(address operator, uint48 timestamp) internal view returns (bool) {
        (bool exists, Checkpoints.Trace208 storage checkpoints) =
            _getOperatorManagerStorage()._operators.tryGet(operator);
        return exists && checkpoints.upperLookupRecent(timestamp) > 0;
    }

    function _getActiveOperatorsAt(
        uint48 timestamp
    ) internal view returns (address[] memory activeOperators) {
        activeOperators = _getOperatorManagerStorage()._operators.keys();
        uint256 length;
        for (uint256 i; i < activeOperators.length; ++i) {
            if (_isOperatorUnpausedAt(activeOperators[i], timestamp)) {
                ++length;
            }
        }
        assembly ("memory-safe") {
            mstore(activeOperators, length)
        }
    }

    function _setOldestNeededTimestamp(
        uint48 oldestNeededTimestamp
    ) internal {
        _getOperatorManagerStorage()._oldestNeededTimestamp = oldestNeededTimestamp;
    }

    /**
     * @notice Registers a new operator
     * @param operator The address of the operator to register
     */
    function _registerOperator(
        address operator
    ) internal {
        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NETWORK_OPT_IN_SERVICE).isOptedIn(operator, _NETWORK())) {
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
    function _pauseOperator(
        address operator
    ) internal {
        if (_getOperatorManagerStorage()._operators.set(operator, Time.timestamp(), 0)) {
            revert OperatorNotRegistered();
        }
    }

    /**
     * @notice Unpauses a paused operator
     * @param operator The address of the operator to unpause
     */
    function _unpauseOperator(
        address operator
    ) internal {
        if (_getOperatorManagerStorage()._operators.set(operator, Time.timestamp(), 1)) {
            revert OperatorNotRegistered();
        }
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function _unregisterOperator(
        address operator
    ) internal {
        // TODO: allow to unregister only if no checkpoints after the oldest needed timestamp
        if (_isOperatorUnpaused(operator)) {
            revert OperatorNotPaused();
        }
        if (_getOperatorManagerStorage()._operators.remove(operator)) {
            revert OperatorNotRegistered();
        }
    }
}
