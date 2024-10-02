// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {MiddlewareStorage} from "./MiddlewareStorage.sol";
import {ArrayWithTimes} from "./libraries/ArrayWithTimes.sol";

abstract contract BLSKeyManager is MiddlewareStorage {
    using ArrayWithTimes for ArrayWithTimes.Address;

    error DuplicateBLSKey();

    mapping(address => bytes) public blsKeys;
    mapping(bytes => ArrayWithTimes.Address) internal blsKeyData;

    function operatorByBLSKey(bytes memory key) public view returns (address) {
        return blsKeyData[key].getAddress();
    }

    function operatorBLSKey(address operator) public view returns (bytes memory) {
        return blsKeys[operator];
    }

    function blsKeyWasActiveAt(bytes memory key, uint48 timestamp) public view returns (bool) {
        return blsKeyData[key].wasActiveAt(timestamp);
    }

    function updateBLSKey(address operator, bytes memory key) external onlyOwner {
        if (blsKeyData[key].getAddress() != address(0)) {
            revert DuplicateBLSKey();
        }

        blsKeys[operator] = key;
        blsKeyData[key].set(operator);
    }
}
