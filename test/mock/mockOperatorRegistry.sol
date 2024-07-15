// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract MockOperatorRegistry {
    function isEntity(address) external view returns (bool) {
        return true;
    }
}
