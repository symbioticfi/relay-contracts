// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBaseOperators {
    function unregisterOperatorWithPermission(
        address operator
    ) external;

    function registerOperatorVaultWithPermission(address operator, address vault) external;

    function unregisterOperatorVaultWithPermission(address operator, address vault) external;
}
