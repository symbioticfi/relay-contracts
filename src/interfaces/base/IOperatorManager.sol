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

    event RegisterOperator(address indexed operator);
    
    event UnregisterOperator(address indexed operator);

    function OperatorManager_VERSION() external view returns (uint64);

    function OPERATOR_REGISTRY() external view returns (address);

    function isOperatorRegistered(
        address operator
    ) external view returns (bool);

    function isOperatorRegisteredAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bool);

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory);

    function getOperators() external view returns (address[] memory);

    function getOperatorsLength() external view returns (uint256);
}
