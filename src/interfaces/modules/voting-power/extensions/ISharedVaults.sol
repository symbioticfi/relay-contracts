// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISharedVaults {
    /**
     * @notice Registers the shared vault.
     * @param sharedVault The address of the shared vault.
     * @dev The caller must have the needed permission.
     */
    function registerSharedVault(
        address sharedVault
    ) external;

    /**
     * @notice Unregisters the shared vault.
     * @param sharedVault The address of the shared vault.
     * @dev The caller must have the needed permission.
     */
    function unregisterSharedVault(
        address sharedVault
    ) external;
}
