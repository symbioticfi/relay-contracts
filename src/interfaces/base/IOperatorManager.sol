// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PersistentSet} from "../../contracts/libraries/structs/PersistentSet.sol";

interface IOperatorManager {
    error OperatorManager_NotOperator();
    error OperatorManager_OperatorNotOptedIn();
    error OperatorManager_OperatorAlreadyRegistered();
    error OperatorManager_OperatorNotRegistered();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        PersistentSet.AddressSet _operators;
    }

    function OperatorManager_VERSION() external view returns (uint64);

    function OPERATOR_REGISTRY() external view returns (address);

    function OPERATOR_NETWORK_OPT_IN_SERVICE() external view returns (address);

    function getAllOperatorsLength() external view returns (uint256);

    function getAllOperators() external view returns (address[] memory);

    function isOperatorActive(
        address operator
    ) external view returns (bool);

    function isOperatorRegistered(
        address operator
    ) external view returns (bool);

    function isOperatorActiveAt(address operator, uint48 timestamp, bytes memory hint) external view returns (bool);

    function getActiveOperatorsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory);

    function getActiveOperators() external view returns (address[] memory);

    function getActiveOperatorsLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function getActiveOperatorsLength() external view returns (uint256);
}
