// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SlashingWindowStorage} from "../storages/SlashingWindowStorage.sol";
import {CaptureTimestampManager} from "./CaptureTimestampManager.sol";
import {IKeyManager} from "../../interfaces/managers/extendable/IKeyManager.sol";

/**
 * @title KeyManager
 * @notice Abstract contract for managing keys
 */
abstract contract KeyManager is SlashingWindowStorage, CaptureTimestampManager, IKeyManager {
    /**
     * @inheritdoc IKeyManager
     */
    function operatorByKey(
        bytes memory key
    ) public view virtual returns (address);

    /**
     * @inheritdoc IKeyManager
     */
    function operatorKey(
        address operator
    ) public view virtual returns (bytes memory);

    /**
     * @inheritdoc IKeyManager
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key) public view virtual returns (bool);

    /**
     * @notice Updates the key associated with an operator
     * @param operator The address of the operator
     * @param key The key to update, or empty bytes to delete the key
     */
    function _updateKey(address operator, bytes memory key) internal virtual;
}
