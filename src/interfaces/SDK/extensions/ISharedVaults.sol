// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title ISharedVaults
 * @notice Interface for managing shared vaults that can be used by multiple operators
 */
interface ISharedVaults {
    /**
     * @notice Registers a new shared vault
     * @param sharedVault The address of the vault to register
     */
    function registerSharedVault(
        address sharedVault
    ) external;

    /**
     * @notice Pauses a shared vault
     * @param sharedVault The address of the vault to pause
     */
    function pauseSharedVault(
        address sharedVault
    ) external;

    /**
     * @notice Unpauses a shared vault
     * @param sharedVault The address of the vault to unpause
     */
    function unpauseSharedVault(
        address sharedVault
    ) external;

    /**
     * @notice Unregisters a shared vault
     * @param sharedVault The address of the vault to unregister
     */
    function unregisterSharedVault(
        address sharedVault
    ) external;
}
