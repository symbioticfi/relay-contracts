// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PauseableEnumerableSet} from "../../libraries/PauseableEnumerableSet.sol";

import {INetworkStorage} from "./storages/INetworkStorage.sol";
import {ISlashingWindowStorage} from "./storages/ISlashingWindowStorage.sol";
import {ICaptureTimestampManager} from "./extendable/ICaptureTimestampManager.sol";

interface IOperatorManager {
    error NotOperator();
    error OperatorNotOptedIn();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        address _operatorRegistry; // Address of the operator registry
        address _operatorNetOptin; // Address of the operator network opt-in service
        PauseableEnumerableSet.AddressSet _operators;
    }

    event RegisterOperator(address operator);
    event PauseOperator(address operator);
    event UnpauseOperator(address operator);
    event UnregisterOperator(address operator);
}
