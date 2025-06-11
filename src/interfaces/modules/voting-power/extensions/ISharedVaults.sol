// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISharedVaults {
    function registerSharedVault(
        address sharedVault
    ) external;

    function unregisterSharedVault(
        address sharedVault
    ) external;
}
