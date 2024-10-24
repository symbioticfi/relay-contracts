// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {BaseMiddleware} from "./BaseMiddleware.sol";
import {PauseableEnumerableSet} from "./libraries/PauseableEnumerableSet.sol";

abstract contract BLSKeyManager is BaseMiddleware {
    using PauseableEnumerableSet for PauseableEnumerableSet.Inner;

    error DuplicateBLSKey();

    bytes32 private constant ZERO_BYTES_HASH = keccak256(""); // Constant representing an empty hash

    mapping(address => bytes) public blsKeys; // Mapping from operator addresses to their BLS keys
    mapping(address => bytes) public prevBLSKeys; // Mapping from operator addresses to their previous BLS keys
    mapping(bytes => PauseableEnumerableSet.Inner) internal _blsKeyData; // Mapping from BLS keys to their associated data

    /* 
     * @notice Returns the operator address associated with a given BLS key.
     * @param key The BLS key for which to find the associated operator.
     * @return The address of the operator linked to the specified BLS key.
     */
    function operatorByBLSKey(bytes memory key) public view returns (address) {
        return _blsKeyData[key].getAddress();
    }

    /* 
     * @notice Returns the current BLS key for a given operator. 
     * If the key has changed in the current epoch, returns the previous key.
     * @param operator The address of the operator.
     * @return The BLS key associated with the specified operator.
     */
    function operatorBLSKey(address operator) public view returns (bytes memory) {
        if (_blsKeyData[blsKeys[operator]].enabledEpoch == getCurrentEpoch()) {
            return prevBLSKeys[operator];
        }

        return blsKeys[operator];
    }

    /* 
     * @notice Checks if a given BLS key was active at a specified epoch.
     * @param epoch The epoch to check for key activity.
     * @param key The BLS key to check.
     * @return A boolean indicating whether the BLS key was active at the specified epoch.
     */
    function blsKeyWasActiveAt(uint48 epoch, bytes memory key) public view returns (bool) {
        return _blsKeyData[key].wasActiveAt(epoch);
    }

    /* 
     * @notice Updates the BLS key associated with an operator. 
     * If the new key already exists, a DuplicateBLSKey error is thrown.
     * @param operator The address of the operator whose BLS key is to be updated.
     * @param key The new BLS key to associate with the operator.
     */
    function updateBLSKey(address operator, bytes memory key) public virtual onlyOwner {
        uint48 epoch = getCurrentEpoch();

        if (_blsKeyData[key].getAddress() != address(0)) {
            revert DuplicateBLSKey();
        }

        if (keccak256(blsKeys[operator]) != ZERO_BYTES_HASH && _blsKeyData[blsKeys[operator]].enabledEpoch != epoch) {
            prevBLSKeys[operator] = blsKeys[operator];
        }

        blsKeys[operator] = key;

        if (keccak256(key) != ZERO_BYTES_HASH) {
            _blsKeyData[key].set(epoch, operator);
        }
    }
}
