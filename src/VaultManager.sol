// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbiotic/interfaces/common/IEntity.sol";
import {IVetoSlasher} from "@symbiotic/interfaces/slasher/IVetoSlasher.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";
import {ISlasher} from "@symbiotic/interfaces/slasher/ISlasher.sol";
import {IVetoSlasher} from "@symbiotic/interfaces/slasher/IVetoSlasher.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseMiddleware} from "./BaseMiddleware.sol";
import {PauseableEnumerableSet} from "./libraries/PauseableEnumerableSet.sol";

abstract contract VaultManager is BaseMiddleware {
    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;
    using PauseableEnumerableSet for PauseableEnumerableSet.Uint160Set;
    using Subnetwork for address;

    error NotVault();
    error VaultNotInitialized();
    error VaultNotRegistered();
    error VaultAlreadyRegistred();
    error VaultEpochTooShort();
    error TooOldEpoch();
    error InvalidEpoch();
    error InvalidSubnetworksCnt();
    error UnknownSlasherType();
    error NonVetoSlasher();
    error TooOldTimestampSlash();

    PauseableEnumerableSet.AddressSet internal sharedVaults;
    mapping(address => PauseableEnumerableSet.AddressSet) internal operatorVaults;

    struct SlashResponse {
        address vault;
        uint64 slasherType;
        bytes32 subnetwork;
        uint256 response; // if instant slashed amount else slash index
    }

    /* 
     * @notice Returns the length of shared vaults.
     * @return The number of shared vaults.
     */
    function sharedVaultsLength() external view returns (uint256) {
        return sharedVaults.length();
    }

    /* 
     * @notice Returns the address and epoch information of a shared vault at a specific position.
     * @param pos The index position in the shared vaults array.
     * @return The address, enabled epoch, and disabled epoch of the vault.
     */
    function sharedVaultWithEpochsAt(uint256 pos) external view returns (address, uint48, uint48) {
        return sharedVaults.at(pos);
    }

    /* 
     * @notice Returns the length of operator vaults for a specific operator.
     * @param operator The address of the operator.
     * @return The number of vaults associated with the operator.
     */
    function operatorVaultsLength(address operator) external view returns (uint256) {
        return operatorVaults[operator].length();
    }

    /* 
     * @notice Returns the address and epoch information of an operator vault at a specific position.
     * @param operator The address of the operator.
     * @param pos The index position in the operator vaults array.
     * @return The address, enabled epoch, and disabled epoch of the vault.
     */
    function operatorVaultWithEpochsAt(address operator, uint256 pos) external view returns (address, uint48, uint48) {
        return operatorVaults[operator].at(pos);
    }

    /* 
     * @notice Converts stake to power for a vault.
     * @param vault The address of the vault.
     * @param stake The amount of stake to convert.
     * @return The power calculated from the stake.
     */
    function stakeToPower(address vault, uint256 stake) public view virtual returns (uint256) {
        return stake;
    }

    /* 
     * @notice Returns the list of active vaults for a specific operator.
     * @param operator The address of the operator.
     * @return An array of addresses representing the active vaults.
     */
    function activeVaults(address operator) public view returns (address[] memory) {
        uint48 epoch = getCurrentEpoch();
        address[] memory activeSharedVaults = sharedVaults.getActive(epoch);
        address[] memory activeOperatorVaults = operatorVaults[operator].getActive(epoch);

        uint256 activeSharedVaultsLen = activeSharedVaults.length;
        address[] memory vaults = new address[](activeSharedVaultsLen + activeOperatorVaults.length);
        for (uint256 i; i < activeSharedVaultsLen; ++i) {
            vaults[i] = activeSharedVaults[i];
        }
        for (uint256 i; i < activeOperatorVaults.length; ++i) {
            vaults[activeSharedVaultsLen + i] = activeOperatorVaults[i];
        }

        return vaults;
    }

    /* 
     * @notice Registers a new shared vault.
     * @param vault The address of the vault to register.
     */
    function registerSharedVault(address vault) external onlyOwner {
        _validateVault(vault);
        sharedVaults.register(getCurrentEpoch(), vault);
    }

    /* 
     * @notice Registers a new operator vault.
     * @param vault The address of the vault to register.
     * @param operator The address of the operator.
     */
    function registerOperatorVault(address vault, address operator) external onlyOwner {
        _validateVault(vault);
        operatorVaults[operator].register(getCurrentEpoch(), vault);
    }

    /* 
     * @notice Pauses a shared vault.
     * @param vault The address of the vault to pause.
     */
    function pauseSharedVault(address vault) external onlyOwner {
        sharedVaults.pause(getCurrentEpoch(), vault);
    }

    /* 
     * @notice Unpauses a shared vault.
     * @param vault The address of the vault to unpause.
     */
    function unpauseSharedVault(address vault) external onlyOwner {
        sharedVaults.unpause(getCurrentEpoch(), IMMUTABLE_EPOCHS, vault);
    }

    /* 
     * @notice Pauses an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to pause.
     */
    function pauseOperatorVault(address operator, address vault) external onlyOwner {
        operatorVaults[operator].pause(getCurrentEpoch(), vault);
    }

    /* 
     * @notice Unpauses an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to unpause.
     */
    function unpauseOperatorVault(address operator, address vault) external onlyOwner {
        operatorVaults[operator].unpause(getCurrentEpoch(), IMMUTABLE_EPOCHS, vault);
    }

    /* 
     * @notice Unregisters a shared vault.
     * @param vault The address of the vault to unregister.
     */
    function unregisterSharedVault(address vault) external onlyOwner {
        sharedVaults.unregister(getCurrentEpoch(), IMMUTABLE_EPOCHS, vault);
    }

    /* 
     * @notice Unregisters an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to unregister.
     */
    function unregisterOperatorVault(address operator, address vault) external onlyOwner {
        operatorVaults[operator].unregister(getCurrentEpoch(), IMMUTABLE_EPOCHS, vault);
    }

    /* 
     * @notice Returns the stake of an operator at a specific epoch.
     * @param epoch The epoch to check.
     * @param operator The address of the operator.
     * @return The stake of the operator.
     */
    function getOperatorStake(uint48 epoch, address operator) public view returns (uint256 stake) {
        uint48 timestamp = getEpochStart(epoch);
        address[] memory vaults = activeVaults(operator);
        uint160[] memory _subnetworks = activeSubnetworks();

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < _subnetworks.length; ++j) {
                bytes32 subnetwork = NETWORK.subnetwork(uint96(_subnetworks[j]));
                stake += IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, timestamp, "");
            }
        }

        return stake;
    }

    /* 
     * @notice Returns the power of an operator at a specific epoch.
     * @param epoch The epoch to check.
     * @param operator The address of the operator.
     * @return The power of the operator.
     */
    function getOperatorPower(uint48 epoch, address operator) public view returns (uint256 power) {
        uint48 timestamp = getEpochStart(epoch);
        address[] memory vaults = activeVaults(operator);
        uint160[] memory _subnetworks = activeSubnetworks();

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < _subnetworks.length; ++j) {
                bytes32 subnetwork = NETWORK.subnetwork(uint96(_subnetworks[j]));
                uint256 stake = IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, timestamp, "");
                power += stakeToPower(vault, stake);
            }
        }

        return power;
    }

    /* 
     * @notice Returns the total stake of multiple operators at a specific epoch.
     * @param epoch The epoch to check.
     * @param operators The list of operator addresses.
     * @return The total stake of the operators.
     */
    function totalStake(uint48 epoch, address[] memory operators) internal view returns (uint256 stake) {
        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = getOperatorStake(epoch, operators[i]);
            stake += operatorStake;
        }

        return stake;
    }

    /* 
     * @notice Slashes a vault based on provided conditions.
     * @param timestamp The timestamp when the slash occurs.
     * @param vault The address of the vault.
     * @param subnetwork The subnetwork identifier.
     * @param operator The operator to slash.
     * @param amount The amount to slash.
     * @param hints Additional data for the slasher.
     * @return A struct containing information about the slash response.
     */
    function slashVault(
        uint48 timestamp,
        address vault,
        bytes32 subnetwork,
        address operator,
        uint256 amount,
        bytes calldata hints
    ) internal returns (SlashResponse memory resp) {
        if (!sharedVaults.contains(vault)) {
            revert NotVault();
        }

        if (timestamp + SLASHING_WINDOW < Time.timestamp()) {
            revert TooOldTimestampSlash();
        }

        address slasher = IVault(vault).slasher();
        uint64 slasherType = IEntity(slasher).TYPE();
        resp.vault = vault;
        resp.slasherType = slasherType;
        resp.subnetwork = subnetwork;
        if (slasherType == INSTANT_SLASHER_TYPE) {
            resp.response = ISlasher(slasher).slash(subnetwork, operator, amount, timestamp, hints);
        } else if (slasherType == VETO_SLASHER_TYPE) {
            resp.response = IVetoSlasher(slasher).requestSlash(subnetwork, operator, amount, timestamp, hints);
        } else {
            revert UnknownSlasherType();
        }
    }

    /* 
     * @notice Executes a veto-based slash for a vault.
     * @param vault The address of the vault.
     * @param operator The address of the operator.
     * @param slashIndex The index of the slash to execute.
     * @param hints Additional data for the veto slasher.
     * @return The amount that was slashed.
     */
    function executeSlash(address vault, address operator, uint256 slashIndex, bytes calldata hints)
        external
        onlyOwner
        returns (uint256 slashedAmount)
    {
        if (!(sharedVaults.contains(vault) || operatorVaults[operator].contains(vault))) {
            revert NotVault();
        }

        address slasher = IVault(vault).slasher();
        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType != VETO_SLASHER_TYPE) {
            revert NonVetoSlasher();
        }

        return IVetoSlasher(slasher).executeSlash(slashIndex, hints);
    }

    /* 
     * @notice Validates if the vault is properly initialized and registered.
     * @param vault The address of the vault to validate.
     */
    function _validateVault(address vault) private view {
        if (!IRegistry(VAULT_REGISTRY).isEntity(vault)) {
            revert NotVault();
        }

        if (!IVault(vault).isInitialized()) {
            revert VaultNotInitialized();
        }

        uint48 vaultEpoch = IVault(vault).epochDuration();

        address slasher = IVault(vault).slasher();
        if (slasher != address(0) && IEntity(slasher).TYPE() == VETO_SLASHER_TYPE) {
            vaultEpoch -= IVetoSlasher(slasher).vetoDuration();
        }

        if (vaultEpoch < SLASHING_WINDOW) {
            revert VaultEpochTooShort();
        }
    }
}
