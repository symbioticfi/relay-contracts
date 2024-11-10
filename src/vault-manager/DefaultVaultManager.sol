// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseVaultManager} from "./BaseVaultManager.sol";

abstract contract DefaultVaultManager is BaseVaultManager {
    /* 
     * @notice Registers a new subnetwork.
     * @param subnetwork The identifier of the subnetwork to register.
     */
    function registerSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        _registerSubnetwork(subnetwork);
    }

    /* 
     * @notice Pauses a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to pause.
     */
    function pauseSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        _pauseSubnetwork(subnetwork);
    }

    /* 
     * @notice Unpauses a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to unpause.
     */
    function unpauseSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        _unpauseSubnetwork(subnetwork);
    }

    /* 
     * @notice Unregisters a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to unregister.
     */
    function unregisterSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        _unregisterSubnetwork(subnetwork);
    }

    /* 
     * @notice Registers a new shared vault.
     * @param vault The address of the vault to register.
     */
    function registerSharedVault(address vault) public virtual onlyOwner {
        _registerSharedVault(vault);
    }

    /* 
     * @notice Registers a new operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to register.
     */
    function registerOperatorVault(address operator, address vault) public virtual onlyOwner {
        _registerOperatorVault(operator, vault);
    }

    /* 
     * @notice Pauses a shared vault.
     * @param vault The address of the vault to pause.
     */
    function pauseSharedVault(address vault) public virtual onlyOwner {
        _pauseSharedVault(vault);
    }

    /* 
     * @notice Unpauses a shared vault.
     * @param vault The address of the vault to unpause.
     */
    function unpauseSharedVault(address vault) public virtual onlyOwner {
        _unpauseSharedVault(vault);
    }

    /* 
     * @notice Pauses an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to pause.
     */
    function pauseOperatorVault(address operator, address vault) public virtual onlyOwner {
        _pauseOperatorVault(operator, vault);
    }

    /* 
     * @notice Unpauses an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to unpause.
     */
    function unpauseOperatorVault(address operator, address vault) public virtual onlyOwner {
        _unpauseOperatorVault(operator, vault);
    }

    /* 
     * @notice Unregisters a shared vault.
     * @param vault The address of the vault to unregister.
     */
    function unregisterSharedVault(address vault) public virtual onlyOwner {
        _unregisterSharedVault(vault);
    }

    /* 
     * @notice Unregisters an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to unregister.
     */
    function unregisterOperatorVault(address operator, address vault) public virtual onlyOwner {
        _unregisterOperatorVault(operator, vault);
    }

    /* 
     * @notice Executes a veto-based slash for a vault.
     * @param vault The address of the vault.
     * @param slashIndex The index of the slash to execute.
     * @param hints Additional data for the veto slasher.
     * @return The amount that was slashed.
     */
    function executeSlash(address vault, uint256 slashIndex, bytes calldata hints)
        public
        virtual
        onlyOwner
        returns (uint256 slashedAmount)
    {
        return _executeSlash(vault, slashIndex, hints);
    }
}
