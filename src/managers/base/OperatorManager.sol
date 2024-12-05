// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseManager} from "./BaseManager.sol";
import {PauseableEnumerableSet} from "../../libraries/PauseableEnumerableSet.sol";

abstract contract OperatorManager is BaseManager {
    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;

    error NotOperator();
    error OperatorNotOptedIn();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        PauseableEnumerableSet.AddressSet _operators;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorManagerStorageLocation =
        0x3b2b549db680c436ebf9aa3c8eeee850852f16da5cdb5137dbc0299ebb219e00;

    function _getOperatorManagerStorage() private pure returns (OperatorManagerStorage storage $) {
        assembly {
            $.slot := OperatorManagerStorageLocation
        }
    }

    /**
     * @notice Returns a list of active operators
     * @return Array of addresses representing the active operators
     */
    function activeOperators() internal view returns (address[] memory) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.getActive(getCaptureTimestamp());
    }

    /**
     * @notice Returns a list of active operators at a specific timestamp
     * @param timestamp The timestamp to check
     * @return Array of addresses representing the active operators at the timestamp
     */
    function activeOperatorsAt(
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
    function operatorWasActiveAt(uint48 timestamp, address operator) internal view returns (bool) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.wasActiveAt(timestamp, operator);
    }

    /**
     * @notice Checks if an operator is registered
     * @param operator The address of the operator to check
     * @return True if the operator is registered, false otherwise
     */
    function isOperatorRegistered(
        address operator
    ) internal view returns (bool) {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        return $._operators.contains(operator);
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
        if (!IRegistry(OPERATOR_REGISTRY()).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NET_OPTIN()).isOptedIn(operator, NETWORK())) {
            revert OperatorNotOptedIn();
        }

        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.register(now(), operator);
    }

    /**
     * @notice Pauses a registered operator
     * @param operator The address of the operator to pause
     */
    function _pauseOperator(
        address operator
    ) internal {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.pause(now(), operator);
    }

    /**
     * @notice Unpauses a paused operator
     * @param operator The address of the operator to unpause
     */
    function _unpauseOperator(
        address operator
    ) internal {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.unpause(now(), SLASHING_WINDOW(), operator);
    }

    /**
     * @notice Unregisters an operator
     * @param operator The address of the operator to unregister
     */
    function _unregisterOperator(
        address operator
    ) internal {
        OperatorManagerStorage storage $ = _getOperatorManagerStorage();
        $._operators.unregister(now(), SLASHING_WINDOW(), operator);
    }
}
