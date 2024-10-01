// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {AddressWithTimes} from "./libraries/AddressWithTimes.sol";

contract KeyManager32 is Ownable {
    using AddressWithTimes for AddressWithTimes.Address;

    error DuplicateKey();
    error NotExistKey();
    error NoOperatorKey();

    mapping(address => bytes32) public keys;
    mapping(bytes32 => AddressWithTimes.Address) public keyData;
    uint48 public immutable SLASHING_WINDOW;

    constructor(address owner, uint48 slashingWindow) Ownable(owner) {
        SLASHING_WINDOW = slashingWindow;
    }

    function operatorByKey(bytes32 key) external view returns (address) {
        return keyData[key].getAddress();
    }

    function operatorKey(address operator) external view returns (bytes32) {
        return keys[operator];
    }

    function keyWasActiveAt(bytes32 key, uint48 timestamp) external view returns (bool) {
        return keyData[key].wasActiveAt(timestamp);
    }

    function registerKey(address operator, bytes32 key) external onlyOwner {
        if (keyData[key].getAddress() != address(0)) {
            revert DuplicateKey();
        }

        keys[operator] = key;
        keyData[key].set(operator);
    }

    function pauseKey(bytes32 key) external onlyOwner {
        if (keyData[key].getAddress() == address(0)) {
            revert NotExistKey();
        }

        keyData[key].disable();
    }

    function unpauseKey(bytes32 key) external onlyOwner {
        if (keyData[key].getAddress() == address(0)) {
            revert NotExistKey();
        }

        keyData[key].checkUnpause(SLASHING_WINDOW);
        keyData[key].enable();
    }

    function unregisterKey(bytes32 key) external onlyOwner {
        if (keyData[key].getAddress() == address(0)) {
            revert NotExistKey();
        }

        keyData[key].checkUnregister(SLASHING_WINDOW);
        delete keys[keyData[key].getAddress()];
        delete keyData[key];
    }

    function updateKey(address operator, bytes32 key) external onlyOwner {
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
