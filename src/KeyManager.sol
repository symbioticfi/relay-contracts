// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {MiddlewareStorage} from "./MiddlewareStorage.sol";
import {EnumerableSetWithTimeData} from "./libraries/EnumerableSetWithTimeData.sol";

abstract contract KeyManager is MiddlewareStorage {
    using EnumerableSetWithTimeData for EnumerableSetWithTimeData.Inner;

    error DuplicateKey();
    error FreshKey();

    mapping(address => bytes32) public keys;
    mapping(address => bytes32) public prevKeys;
    mapping(bytes32 => EnumerableSetWithTimeData.Inner) internal keyData;

    function operatorByKey(bytes32 key) public view returns (address) {
        return keyData[key].getAddress();
    }

    function operatorKey(address operator) public view returns (bytes32) {
        if (keyData[keys[operator]].enabled == Time.timestamp()) {
            return prevKeys[operator];
        }

        return keys[operator];
    }

    function keyWasActiveAt(bytes32 key, uint48 timestamp) public view returns (bool) {
        return keyData[key].wasActiveAt(timestamp);
    }

    function updateKey(address operator, bytes32 key) external onlyOwner {
        if (keyData[key].getAddress() != address(0)) {
            revert DuplicateKey();
        }

        if (keys[operator] != bytes32(0)) {
            if (keyData[keys[operator]].enabled == Time.timestamp()) {
                revert FreshKey();
            }

            prevKeys[operator] = keys[operator];
        }

        keys[operator] = key;
        keyData[key].set(operator);
    }
}
