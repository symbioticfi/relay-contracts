// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {NetworkStorage} from "./storages/NetworkStorage.sol";
import {SlashingWindowStorage} from "./storages/SlashingWindowStorage.sol";

import {CaptureTimestampManager} from "./extendable/CaptureTimestampManager.sol";

import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

/**
 * @title OperatorManager
 * @notice Manages operator registration and validation for the protocol
 * @dev Inherits from NetworkStorage, SlashingWindowStorage, and CaptureTimestampManager
 * to provide operator management functionality with network awareness and time-based features
 */
abstract contract OperatorManager is NetworkStorage, SlashingWindowStorage, CaptureTimestampManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;

    error NotOperator();
    error OperatorNotOptedIn();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        address _operatorRegistry; // Address of the operator registry
        address _operatorNetOptin; // Address of the operator network opt-in service
        PauseableEnumerableSet.AddressSet _operators;
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
     * @param operatorRegistry The address of the operator registry contract
     * @param operatorNetOptin The address of the operator network opt-in service
     */
    function __OperatorManager_init_private(
        address operatorRegistry,
        address operatorNetOptin
    ) internal onlyInitializing {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operatorRegistry = operatorRegistry;
        $._operatorNetOptin = operatorNetOptin;
    }

    /**
     * @notice Gets the address of the operator registry contract
     * @return The operator registry contract address
     */
    function _OPERATOR_REGISTRY() internal view returns (address) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operatorRegistry;
    }

    /**
     * @notice Gets the address of the operator network opt-in service contract
     * @return The operator network opt-in service contract address
     */
    function _OPERATOR_NET_OPTIN() internal view returns (address) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operatorNetOptin;
    }

    /**
     * @notice Returns the total number of registered operators, including both active and inactive
     * @return The number of registered operators
     */
    function _operatorsLength() internal view returns (uint256) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.length();
    }
    /**
     * @notice Returns the operator and their associated enabled and disabled times at a specific position
     * @param pos The index position in the operators array
     * @return The operator address
     * @return The enabled timestamp
     * @return The disabled timestamp
     */

    function _operatorWithTimesAt(
        uint256 pos
    ) internal view returns (address, uint48, uint48) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.at(pos);
    }

    /**
     * @notice Returns a list of active operators
     * @return Array of addresses representing the active operators
     */
    function _activeOperators() internal view returns (address[] memory) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.getActive(getCaptureTimestamp());
    }

    /**
     * @notice Returns a list of active operators at a specific timestamp
     * @param timestamp The timestamp to check
     * @return Array of addresses representing the active operators at the timestamp
     */
    function _activeOperatorsAt(
        uint48 timestamp
    ) internal view returns (address[] memory) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.getActive(timestamp);
    }

    /**
     * @notice Checks if a given operator was active at a specified timestamp
     * @param timestamp The timestamp to check
     * @param operator The operator address to check
     * @return True if the operator was active at the timestamp, false otherwise
     */
    function _operatorWasActiveAt(uint48 timestamp, address operator) internal view returns (bool) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.wasActiveAt(timestamp, operator);
    }

    /**
     * @notice Checks if an operator is registered
     * @param operator The address of the operator to check
     * @return True if the operator is registered, false otherwise
     */
    function _isOperatorRegistered(
        address operator
    ) internal view returns (bool) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.contains(operator);
    }

    /**
     * @notice Registers a new operator
     * @param operator The address of the operator to register
     */
    function _registerOperator(
        address operator
    ) internal {
        if (!IRegistry(_OPERATOR_REGISTRY()).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(_OPERATOR_NET_OPTIN()).isOptedIn(operator, _NETWORK())) {
            revert OperatorNotOptedIn();
        }

        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.register(_now(), operator);
    }

    /**
     * @notice Pauses a registered operator
     * @param operator The address of the operator to pause
     */
    function _pauseOperator(
        address operator
    ) internal {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.pause(_now(), operator);
    }

    /**
     * @notice Unpauses a paused operator
     * @param operator The address of the operator to unpause
     */
    function _unpauseOperator(
        address operator
    ) internal {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.unpause(_now(), _SLASHING_WINDOW(), operator);
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function _unregisterOperator(
        address operator
    ) internal {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.unregister(_now(), _SLASHING_WINDOW(), operator);
    }
}
