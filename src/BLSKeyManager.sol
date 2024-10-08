// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {MiddlewareStorage} from "./MiddlewareStorage.sol";
import {EnumerableSetWithTimeData} from "./libraries/EnumerableSetWithTimeData.sol";

abstract contract BLSKeyManager is MiddlewareStorage {
    using EnumerableSetWithTimeData for EnumerableSetWithTimeData.Inner;

    error DuplicateBLSKey();
    error FreshBLSKey();

    mapping(address => bytes) public blsKeys;
    mapping(address => bytes) public prevBLSKeys;
    mapping(bytes => EnumerableSetWithTimeData.Inner) internal blsKeyData;

    function operatorByBLSKey(bytes memory key) public view returns (address) {
        return blsKeyData[key].getAddress();
    }

    function operatorBLSKey(address operator) public view returns (bytes memory) {
        if (blsKeyData[blsKeys[operator]].enabled == Time.timestamp()) {
            return prevBLSKeys[operator];
        }

        return blsKeys[operator];
    }

    function blsKeyWasActiveAt(bytes memory key, uint48 timestamp) public view returns (bool) {
        return blsKeyData[key].wasActiveAt(timestamp);
    }

    function updateBLSKey(address operator, bytes memory key) external onlyOwner {
        if (blsKeyData[key].getAddress() != address(0)) {
            revert DuplicateBLSKey();
        }

        if (keccak256(blsKeys[operator]) != keccak256("")) {
            if (blsKeyData[blsKeys[operator]].enabled == Time.timestamp()) {
                revert FreshBLSKey();
            }

            prevBLSKeys[operator] = blsKeys[operator];
        }

        blsKeys[operator] = key;
        blsKeyData[key].set(operator);
    }
}
