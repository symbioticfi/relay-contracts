// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {MiddlewareStorage} from "./MiddlewareStorage.sol";
import {ArrayWithTimes} from "./libraries/ArrayWithTimes.sol";

abstract contract KeyManager is MiddlewareStorage {
    using ArrayWithTimes for ArrayWithTimes.Address;

    error DuplicateKey();

    mapping(address => bytes32) public keys;
    mapping(bytes32 => ArrayWithTimes.Address) internal keyData;

    function operatorByKey(bytes32 key) public view returns (address) {
        return keyData[key].getAddress();
    }

    function operatorKey(address operator) public view returns (bytes32) {
        return keys[operator];
    }

    function keyWasActiveAt(bytes32 key, uint48 timestamp) public view returns (bool) {
        return keyData[key].wasActiveAt(timestamp);
    }

    function updateKey(address operator, bytes32 key) external onlyOwner {
        if (keyData[key].getAddress() != address(0)) {
            revert DuplicateKey();
        }

        keys[operator] = key;
        keyData[key].set(operator);
    }
}
