// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {BaseBLSKeyManager} from "./BaseBLSKeyManager.sol";

abstract contract DefaultBLSKeyManager is BaseBLSKeyManager {
    /* 
     * @notice Updates the BLS key associated with an operator. 
     * If the new key already exists, a DuplicateBLSKey error is thrown.
     * @param operator The address of the operator whose BLS key is to be updated.
     * @param key The new BLS key to associate with the operator.
     */
    function updateBLSKey(address operator, bytes memory key) public virtual onlyOwner {
        _updateBLSKey(operator, key);
    }
}
