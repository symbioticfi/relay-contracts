// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IOperatorVaults {
    function registerOperatorVault(address operator, address vault) external;

    function unregisterOperatorVault(address operator, address vault) external;
}
