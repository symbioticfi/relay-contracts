// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {MiddlewareStorage} from "./MiddlewareStorage.sol";
import {ArrayWithTimes} from "./libraries/ArrayWithTimes.sol";

abstract contract KeyManager is MiddlewareStorage {
    using ArrayWithTimes for ArrayWithTimes.Address;

    error DuplicateKey();
    error NotExistKey();
    error NoOperatorKey();

    mapping(address => bytes) public keys;
    mapping(bytes => ArrayWithTimes.Address) internal keyData;

    function operatorByKey(bytes memory key) external view returns (address) {
        return keyData[key].getAddress();
    }

    function operatorKey(address operator) external view returns (bytes memory) {
        return keys[operator];
    }

    function keyWasActiveAt(bytes memory key, uint48 timestamp) external view returns (bool) {
        return keyData[key].wasActiveAt(timestamp);
    }

    function registerKey(address operator, bytes memory key) external onlyOwner {
        if (keyData[key].getAddress() != address(0)) {
            revert DuplicateKey();
        }

        keys[operator] = key;
        keyData[key].set(operator);
    }

    function pauseKey(bytes memory key) external onlyOwner {
        if (keyData[key].getAddress() == address(0)) {
            revert NotExistKey();
        }

        keyData[key].disable();
    }

    function unpauseKey(bytes memory key) external onlyOwner {
        if (keyData[key].getAddress() == address(0)) {
            revert NotExistKey();
        }

        keyData[key].checkUnpause(SLASHING_WINDOW);
        keyData[key].enable();
    }

    function unregisterKey(bytes memory key) external onlyOwner {
        if (keyData[key].getAddress() == address(0)) {
            revert NotExistKey();
        }

        keyData[key].checkUnregister(SLASHING_WINDOW);
        delete keys[keyData[key].getAddress()];
        delete keyData[key];
    }

    function updateKey(address operator, bytes memory key) external onlyOwner {
        if (keyData[keys[operator]].getAddress() == address(0)) {
            revert NoOperatorKey();
        }

        if (keyData[key].getAddress() != address(0)) {
            revert DuplicateKey();
        }

        keyData[keys[operator]].checkUnregister(SLASHING_WINDOW);
        keys[operator] = key;
        keyData[key].set(operator);
    }
}
