// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseKeyManager} from "./BaseKeyManager.sol";

abstract contract DefaultKeyManager is BaseKeyManager {
    /* 
     * @notice Updates the key associated with an operator. 
     * If the new key already exists, a DuplicateKey error is thrown.
     * @param operator The address of the operator whose key is to be updated.
     * @param key The new key to associate with the operator.
     */
    function updateKey(address operator, bytes32 key) public virtual onlyOwner {
        _updateKey(operator, key);
    }
}
