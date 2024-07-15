// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IOperatorRegistry {
    function isEntity(address) external view returns (bool);
}
