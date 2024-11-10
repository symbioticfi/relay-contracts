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
import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

import {BaseManager} from "../BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

abstract contract BaseVaultManager is BaseManager {
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    using EnumerableMap for EnumerableMap.AddressToAddressMap;
    using PauseableEnumerableSet for PauseableEnumerableSet.AddressSet;
    using PauseableEnumerableSet for PauseableEnumerableSet.Uint160Set;
    using Subnetwork for address;

    error NotVault();
    error NotOperatorVault();
    error VaultNotInitialized();
    error VaultAlreadyRegistred();
    error VaultEpochTooShort();
    error InactiveVaultSlash();
    error UnknownSlasherType();
    error NonVetoSlasher();
    error TooOldTimestampSlash();

    PauseableEnumerableSet.Uint160Set internal _subnetworks;
    PauseableEnumerableSet.AddressSet internal _sharedVaults;
    mapping(address => PauseableEnumerableSet.AddressSet) internal _operatorVaults;
    EnumerableMap.AddressToAddressMap internal _vaultOperator;

    struct SlashResponse {
        address vault;
        uint64 slasherType;
        bytes32 subnetwork;
        uint256 response; // if instant slashed amount else slash index
    }

    /* 
     * @notice Returns the number of subnetworks registered.
     * @return The count of registered subnetworks.
     */
    function subnetworksLength() public view returns (uint256) {
        return _subnetworks.length();
    }

    /* 
     * @notice Returns the subnetwork information at a specified position.
     * @param pos The index of the subnetwork.
     * @return The subnetwork details including address and timing information.
     */
    function subnetworkWithTimesAt(uint256 pos) public view returns (uint160, uint48, uint48) {
        return _subnetworks.at(pos);
    }

    /* 
     * @notice Returns an array of active subnetworks.
     * @return An array of active subnetwork addresses.
     */
    function activeSubnetworks() public view returns (uint160[] memory) {
        return _subnetworks.getActive(getCaptureTimestamp());
    }

        /* 
     * @notice Returns an array of active subnetworks.
     * @return An array of active subnetwork addresses.
     */
    function activeSubnetworksAt(uint48 timestamp) public view returns (uint160[] memory) {
        return _subnetworks.getActive(timestamp);
    }

    /* 
     * @notice Checks if a given subnetwork was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param subnetwork The subnetwork to check.
     * @return A boolean indicating whether the subnetwork was active at the specified timestamp.
     */
    function subnetworkWasActiveAt(uint48 timestamp, uint96 subnetwork) public view returns (bool) {
        return _subnetworks.wasActiveAt(timestamp, uint160(subnetwork));
    }

    /* 
     * @notice Returns the length of shared vaults.
     * @return The number of shared vaults.
     */
    function sharedVaultsLength() public view returns (uint256) {
        return _sharedVaults.length();
    }

    /* 
     * @notice Returns the address and timing information of a shared vault at a specific position.
     * @param pos The index position in the shared vaults array.
     * @return The address and timing information of the vault.
     */
    function sharedVaultWithTimesAt(uint256 pos) public view returns (address, uint48, uint48) {
        return _sharedVaults.at(pos);
    }

    /*
     * @notice Returns an array of active shared vaults.
     * @return An array of active shared vault addresses.
     */
    function activeSharedVaults() public view returns (address[] memory) {
        return _sharedVaults.getActive(getCaptureTimestamp());
    }

    /* 
     * @notice Returns the length of operator vaults for a specific operator.
     * @param operator The address of the operator.
     * @return The number of vaults associated with the operator.
     */
    function operatorVaultsLength(address operator) public view returns (uint256) {
        return _operatorVaults[operator].length();
    }

    /* 
     * @notice Returns the address and timing information of an operator vault at a specific position.
     * @param operator The address of the operator.
     * @param pos The index position in the operator vaults array.
     * @return The address and timing information of the vault.
     */
    function operatorVaultWithTimesAt(address operator, uint256 pos)
        public
        view
        returns (address, uint48, uint48)
    {
        return _operatorVaults[operator].at(pos);
    }

    /*
     * @notice Returns an array of active operator vaults for a specific operator.
     * @param operator The address of the operator.
     * @return An array of active operator vault addresses.
     */
    function activeOperatorVaults(address operator) public view returns (address[] memory) {
        return _operatorVaults[operator].getActive(getCaptureTimestamp());
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
     * @notice Returns the list of network's active vaults.
     * @return An array of addresses representing the active vaults.
     */
    function activeVaults() public view virtual returns (address[] memory) {
        uint48 timestamp = getCaptureTimestamp();
        address[] memory activeSharedVaults_ = _sharedVaults.getActive(timestamp);
        uint256 len = activeSharedVaults_.length;
        address[] memory vaults = new address[](len + _vaultOperator.length());

        for (uint256 i; i < len; ++i) {
            vaults[i] = activeSharedVaults_[i];
        }

        uint256 operatorVaultsLen = _vaultOperator.length();
        for (uint256 i; i < operatorVaultsLen; ++i) {
            (address vault, address operator) = _vaultOperator.at(i);
            if (_operatorVaults[operator].wasActiveAt(timestamp, vault)) {
                vaults[len++] = vault;
            }
        }

        assembly ("memory-safe") {
            mstore(vaults, len)
        }

        return vaults;
    }

    function activeVaultsAt(uint48 timestamp) public view virtual returns (address[] memory) {
        address[] memory activeSharedVaults_ = _sharedVaults.getActive(timestamp);
        uint256 len = activeSharedVaults_.length;
        address[] memory vaults = new address[](len + _vaultOperator.length());

        for (uint256 i; i < len; ++i) {
            vaults[i] = activeSharedVaults_[i];
        }

        uint256 operatorVaultsLen = _vaultOperator.length();
        for (uint256 i; i < operatorVaultsLen; ++i) {
            (address vault, address operator) = _vaultOperator.at(i);
            if (_operatorVaults[operator].wasActiveAt(timestamp, vault)) {
                vaults[len++] = vault;
            }
        }

        assembly ("memory-safe") {
            mstore(vaults, len)
        }

        return vaults;
    }

    /* 
     * @notice Returns the list of active vaults for a specific operator.
     * @param operator The address of the operator.
     * @return An array of addresses representing the active vaults.
     */
    function activeVaults(address operator) public view virtual returns (address[] memory) {
        uint48 timestamp = getCaptureTimestamp();
        address[] memory activeSharedVaults_ = _sharedVaults.getActive(timestamp);
        address[] memory activeOperatorVaults_ = _operatorVaults[operator].getActive(timestamp);

        uint256 activeSharedVaultsLen = activeSharedVaults_.length;
        address[] memory vaults = new address[](activeSharedVaultsLen + activeOperatorVaults_.length);
        for (uint256 i; i < activeSharedVaultsLen; ++i) {
            vaults[i] = activeSharedVaults_[i];
        }
        for (uint256 i; i < activeOperatorVaults_.length; ++i) {
            vaults[activeSharedVaultsLen + i] = activeOperatorVaults_[i];
        }

        return vaults;
    }

    /* 
     * @notice Returns the list of active vaults for a specific operator.
     * @param timestamp The timestamp to check.
     * @param operator The address of the operator.
     * @return An array of addresses representing the active vaults.
     */
    function activeVaultsAt(uint48 timestamp, address operator) public view virtual returns (address[] memory) {
        address[] memory activeSharedVaults_ = _sharedVaults.getActive(timestamp);
        address[] memory activeOperatorVaults_ = _operatorVaults[operator].getActive(timestamp);

        uint256 activeSharedVaultsLen = activeSharedVaults_.length;
        address[] memory vaults = new address[](activeSharedVaultsLen + activeOperatorVaults_.length);
        for (uint256 i; i < activeSharedVaultsLen; ++i) {
            vaults[i] = activeSharedVaults_[i];
        }
        for (uint256 i; i < activeOperatorVaults_.length; ++i) {
            vaults[activeSharedVaultsLen + i] = activeOperatorVaults_[i];
        }

        return vaults;
    }

    /* 
     * @notice Checks if a given vault was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param operator The address of operator.
     * @param vault The vault to check.
     * @return A boolean indicating whether the vault was active at the specified timestamp.
     */
    function vaultWasActiveAt(uint48 timestamp, address operator, address vault) public view returns (bool) {
        return sharedVaultWasActiveAt(timestamp, vault) || operatorVaultWasActiveAt(timestamp, operator, vault);
    }

    /* 
     * @notice Checks if a given shared vault was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param vault The vault to check.
     * @return A boolean indicating whether the shared vault was active at the specified timestamp.
     */
    function sharedVaultWasActiveAt(uint48 timestamp, address vault) public view returns (bool) {
        return _sharedVaults.wasActiveAt(timestamp, vault);
    }

    /* 
     * @notice Checks if a given operator vault was active at a specified timestamp.
     * @param timestamp The timestamp to check.
     * @param operator The address of operator.
     * @param vault The vault to check.
     * @return A boolean indicating whether the operator vault was active at the specified timestamp.
     */
    function operatorVaultWasActiveAt(uint48 timestamp, address operator, address vault) public view returns (bool) {
        return _operatorVaults[operator].wasActiveAt(timestamp, vault);
    }

    /* 
     * @notice Returns the stake of an operator for a specific vault and subnetwork.
     * @param operator The address of the operator.
     * @param vault The address of the vault.
     * @param subnetwork The subnetwork identifier.
     * @return The stake of the operator.
     */
    function getOperatorStake(address operator, address vault, uint96 subnetwork) public view returns (uint256) {
        uint48 timestamp = getCaptureTimestamp();
        bytes32 subnetworkId = NETWORK.subnetwork(subnetwork);
        return IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetworkId, operator, timestamp, "");
    }

    /* 
     * @notice Returns the power of an operator for a specific vault and subnetwork.
     * @param operator The address of the operator.
     * @param vault The address of the vault.
     * @param subnetwork The subnetwork identifier.
     * @return The power of the operator.
     */
    function getOperatorPower(address operator, address vault, uint96 subnetwork) public view returns (uint256) {
        uint256 stake = getOperatorStake(operator, vault, subnetwork);
        return stakeToPower(vault, stake);
    }

    /* 
     * @notice Returns the stake of an operator.
     * @param operator The address of the operator.
     * @return The stake of the operator.
     */
    function getOperatorStake(address operator) public view virtual returns (uint256 stake) {
        uint48 timestamp = getCaptureTimestamp();
        address[] memory vaults = activeVaults(operator);
        uint160[] memory subnetworks = activeSubnetworks();

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < subnetworks.length; ++j) {
                stake += getOperatorStake(operator, vault, uint96(subnetworks[j]));
            }
        }

        return stake;
    }

    function getOperatorStakeAt(address operator, uint48 timestamp) public view virtual returns (uint256 stake) {
        address[] memory vaults = activeVaults(operator);
        uint160[] memory subnetworks = activeSubnetworks();

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < subnetworks.length; ++j) {
                stake += getOperatorStake(operator, vault, uint96(subnetworks[j]));
            }
        }

        return stake;
    }

    /* 
     * @notice Returns the power of an operator.
     * @param operator The address of the operator.
     * @return The power of the operator.
     */
    function getOperatorPower(address operator) public view virtual returns (uint256 power) {
        uint48 timestamp = getCaptureTimestamp();
        address[] memory vaults = activeVaults(operator);
        uint160[] memory subnetworks = activeSubnetworks();

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < subnetworks.length; ++j) {
                power += getOperatorPower(operator, vault, uint96(subnetworks[j]));
            }
        }

        return power;
    }

    /* 
     * @notice Returns the total stake of multiple operators.
     * @param operators The list of operator addresses.
     * @return The total stake of the operators.
     */
    function _totalStake(address[] memory operators) internal view returns (uint256 stake) {
        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = getOperatorStake(operators[i]);
            stake += operatorStake;
        }

        return stake;
    }

    /* 
     * @notice Returns the total power of multiple operators.
     * @param operators The list of operator addresses.
     * @return The total power of the operators.
     */
    function _totalPower(address[] memory operators) internal view returns (uint256 power) {
        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = getOperatorPower(operators[i]);
            power += operatorStake;
        }

        return power;
    }

    /* 
     * @notice Registers a new subnetwork.
     * @param subnetwork The identifier of the subnetwork to register.
     */
    function _registerSubnetwork(uint96 subnetwork) internal {
        _subnetworks.register(getCaptureTimestamp(), uint160(subnetwork));
    }

    /* 
     * @notice Pauses a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to pause.
     */
    function _pauseSubnetwork(uint96 subnetwork) internal {
        _subnetworks.pause(getCaptureTimestamp(), uint160(subnetwork));
    }

    /* 
     * @notice Unpauses a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to unpause.
     */
    function _unpauseSubnetwork(uint96 subnetwork) internal {
        _subnetworks.unpause(getCaptureTimestamp(), SLASHING_WINDOW, uint160(subnetwork));
    }

    /* 
     * @notice Unregisters a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to unregister.
     */
    function _unregisterSubnetwork(uint96 subnetwork) internal {
        _subnetworks.unregister(getCaptureTimestamp(), SLASHING_WINDOW, uint160(subnetwork));
    }

    /* 
     * @notice Registers a new shared vault.
     * @param vault The address of the vault to register.
     */
    function _registerSharedVault(address vault) internal {
        _validateVault(vault);
        _sharedVaults.register(getCaptureTimestamp(), vault);
    }

    /* 
     * @notice Registers a new operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to register.
     */
    function _registerOperatorVault(address operator, address vault) internal {
        _validateVault(vault);
        if (_sharedVaults.contains(vault)) {
            revert VaultAlreadyRegistred();
        }
        _operatorVaults[operator].register(getCaptureTimestamp(), vault);
        _vaultOperator.set(vault, operator);
    }

    /* 
     * @notice Pauses a shared vault.
     * @param vault The address of the vault to pause.
     */
    function _pauseSharedVault(address vault) internal {
        _sharedVaults.pause(getCaptureTimestamp(), vault);
    }

    /* 
     * @notice Unpauses a shared vault.
     * @param vault The address of the vault to unpause.
     */
    function _unpauseSharedVault(address vault) internal {
        _sharedVaults.unpause(getCaptureTimestamp(), SLASHING_WINDOW, vault);
    }

    /* 
     * @notice Pauses an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to pause.
     */
    function _pauseOperatorVault(address operator, address vault) internal {
        _operatorVaults[operator].pause(getCaptureTimestamp(), vault);
    }

    /* 
     * @notice Unpauses an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to unpause.
     */
    function _unpauseOperatorVault(address operator, address vault) internal {
        _operatorVaults[operator].unpause(getCaptureTimestamp(), SLASHING_WINDOW, vault);
    }

    /* 
     * @notice Unregisters a shared vault.
     * @param vault The address of the vault to unregister.
     */
    function _unregisterSharedVault(address vault) internal {
        _sharedVaults.unregister(getCaptureTimestamp(), SLASHING_WINDOW, vault);
    }

    /* 
     * @notice Unregisters an operator vault.
     * @param operator The address of the operator.
     * @param vault The address of the vault to unregister.
     */
    function _unregisterOperatorVault(address operator, address vault) internal {
        _operatorVaults[operator].unregister(getCaptureTimestamp(), SLASHING_WINDOW, vault);
        _vaultOperator.remove(vault);
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
    function _slashVault(
        uint48 timestamp,
        address vault,
        bytes32 subnetwork,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal returns (SlashResponse memory resp) {
        if (!(_sharedVaults.contains(vault) || _operatorVaults[operator].contains(vault))) {
            revert NotOperatorVault();
        }

        if (!vaultWasActiveAt(timestamp, operator, vault)) {
            revert InactiveVaultSlash();
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
     * @param slashIndex The index of the slash to execute.
     * @param hints Additional data for the veto slasher.
     * @return The amount that was slashed.
     */
    function _executeSlash(address vault, uint256 slashIndex, bytes calldata hints)
        internal
        returns (uint256 slashedAmount)
    {
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

        if (_vaultOperator.contains(vault)) {
            revert VaultAlreadyRegistred();
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
