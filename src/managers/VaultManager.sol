// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

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

import {BaseManager} from "./BaseManager.sol";
import {PauseableEnumerableSet} from "../libraries/PauseableEnumerableSet.sol";

abstract contract VaultManager is BaseManager {
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

    /**
     * @notice Returns the number of subnetworks registered
     * @return The count of registered subnetworks
     */
    function subnetworksLength() public view returns (uint256) {
        return _subnetworks.length();
    }

    /**
     * @notice Returns the subnetwork information at a specified position
     * @param pos The index of the subnetwork
     * @return The subnetwork address
     * @return enableTime The time when the subnetwork was enabled
     * @return disableTime The time when the subnetwork was disabled
     */
    function subnetworkWithTimesAt(uint256 pos) public view returns (uint160, uint48, uint48) {
        return _subnetworks.at(pos);
    }

    /**
     * @notice Returns an array of active subnetworks at the current capture timestamp
     * @return An array of active subnetwork addresses
     */
    function activeSubnetworks() public view returns (uint160[] memory) {
        return _subnetworks.getActive(getCaptureTimestamp());
    }

    /**
     * @notice Returns an array of active subnetworks at a specific timestamp
     * @param timestamp The timestamp to check activity at
     * @return An array of active subnetwork addresses
     */
    function activeSubnetworksAt(uint48 timestamp) public view returns (uint160[] memory) {
        return _subnetworks.getActive(timestamp);
    }

    /**
     * @notice Checks if a given subnetwork was active at a specified timestamp
     * @param timestamp The timestamp to check
     * @param subnetwork The subnetwork to check
     * @return True if the subnetwork was active at the timestamp
     */
    function subnetworkWasActiveAt(uint48 timestamp, uint96 subnetwork) public view returns (bool) {
        return _subnetworks.wasActiveAt(timestamp, uint160(subnetwork));
    }

    /**
     * @notice Returns the number of shared vaults
     * @return The count of shared vaults
     */
    function sharedVaultsLength() public view returns (uint256) {
        return _sharedVaults.length();
    }

    /**
     * @notice Returns the vault information at a specified position
     * @param pos The index position in the shared vaults array
     * @return The vault address
     * @return enableTime The time when the vault was enabled
     * @return disableTime The time when the vault was disabled
     */
    function sharedVaultWithTimesAt(uint256 pos) public view returns (address, uint48, uint48) {
        return _sharedVaults.at(pos);
    }

    /**
     * @notice Returns an array of active shared vaults at the current capture timestamp
     * @return An array of active shared vault addresses
     */
    function activeSharedVaults() public view returns (address[] memory) {
        return _sharedVaults.getActive(getCaptureTimestamp());
    }

    /**
     * @notice Returns the number of vaults associated with an operator
     * @param operator The address of the operator
     * @return The count of vaults for the operator
     */
    function operatorVaultsLength(address operator) public view returns (uint256) {
        return _operatorVaults[operator].length();
    }

    /**
     * @notice Returns the vault information at a specified position for an operator
     * @param operator The address of the operator
     * @param pos The index position in the operator vaults array
     * @return The vault address
     * @return enableTime The time when the vault was enabled
     * @return disableTime The time when the vault was disabled
     */
    function operatorVaultWithTimesAt(address operator, uint256 pos) public view returns (address, uint48, uint48) {
        return _operatorVaults[operator].at(pos);
    }

    /**
     * @notice Returns an array of active vaults for a specific operator at the current capture timestamp
     * @param operator The address of the operator
     * @return An array of active vault addresses
     */
    function activeOperatorVaults(address operator) public view returns (address[] memory) {
        return _operatorVaults[operator].getActive(getCaptureTimestamp());
    }

    /**
     * @notice Returns all active vaults at the current capture timestamp
     * @return An array of active vault addresses
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

        assembly {
            mstore(vaults, len)
        }

        return vaults;
    }

    /**
     * @notice Returns all active vaults at a specific timestamp
     * @param timestamp The timestamp to check activity at
     * @return An array of active vault addresses
     */
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

        assembly {
            mstore(vaults, len)
        }

        return vaults;
    }

    /**
     * @notice Returns active vaults for a specific operator at the current capture timestamp
     * @param operator The address of the operator
     * @return An array of active vault addresses
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

    /**
     * @notice Returns active vaults for a specific operator at a given timestamp
     * @param timestamp The timestamp to check activity at
     * @param operator The address of the operator
     * @return An array of active vault addresses
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

    /**
     * @notice Checks if a vault was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param operator The address of operator
     * @param vault The vault address to check
     * @return True if the vault was active at the timestamp
     */
    function vaultWasActiveAt(uint48 timestamp, address operator, address vault) public view returns (bool) {
        return sharedVaultWasActiveAt(timestamp, vault) || operatorVaultWasActiveAt(timestamp, operator, vault);
    }

    /**
     * @notice Checks if a shared vault was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param vault The vault address to check
     * @return True if the shared vault was active at the timestamp
     */
    function sharedVaultWasActiveAt(uint48 timestamp, address vault) public view returns (bool) {
        return _sharedVaults.wasActiveAt(timestamp, vault);
    }

    /**
     * @notice Checks if an operator vault was active at a specific timestamp
     * @param timestamp The timestamp to check
     * @param operator The address of operator
     * @param vault The vault address to check
     * @return True if the operator vault was active at the timestamp
     */
    function operatorVaultWasActiveAt(uint48 timestamp, address operator, address vault) public view returns (bool) {
        return _operatorVaults[operator].wasActiveAt(timestamp, vault);
    }

    /**
     * @notice Gets the stake amount for an operator in a vault and subnetwork
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param subnetwork The subnetwork identifier
     * @return The stake amount
     */
    function getOperatorStake(address operator, address vault, uint96 subnetwork) public view returns (uint256) {
        uint48 timestamp = getCaptureTimestamp();
        bytes32 subnetworkId = NETWORK.subnetwork(subnetwork);
        return IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetworkId, operator, timestamp, "");
    }

    /**
     * @notice Gets the stake amount for an operator in a vault and subnetwork at a specific timestamp
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param subnetwork The subnetwork identifier
     * @param timestamp The timestamp to check stake at
     * @return The stake amount
     */
    function getOperatorStakeAt(address operator, address vault, uint96 subnetwork, uint48 timestamp)
        public
        view
        returns (uint256)
    {
        bytes32 subnetworkId = NETWORK.subnetwork(subnetwork);
        return IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetworkId, operator, timestamp, "");
    }

    /**
     * @notice Gets the power amount for an operator in a vault and subnetwork
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param subnetwork The subnetwork identifier
     * @return The power amount
     */
    function getOperatorPower(address operator, address vault, uint96 subnetwork) public view returns (uint256) {
        uint256 stake = getOperatorStake(operator, vault, subnetwork);
        return stakeToPower(vault, stake);
    }

    /**
     * @notice Gets the power amount for an operator in a vault and subnetwork at a specific timestamp
     * @param operator The address of the operator
     * @param vault The address of the vault
     * @param subnetwork The subnetwork identifier
     * @param timestamp The timestamp to check power at
     * @return The power amount
     */
    function getOperatorPowerAt(address operator, address vault, uint96 subnetwork, uint48 timestamp)
        public
        view
        returns (uint256)
    {
        uint256 stake = getOperatorStakeAt(operator, vault, subnetwork, timestamp);
        return stakeToPower(vault, stake);
    }

    /**
     * @notice Gets the total stake amount for an operator across all vaults and subnetworks
     * @param operator The address of the operator
     * @return stake The total stake amount
     */
    function getOperatorStake(address operator) public view virtual returns (uint256 stake) {
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

    /**
     * @notice Gets the total stake amount for an operator across all vaults and subnetworks at a specific timestamp
     * @param operator The address of the operator
     * @param timestamp The timestamp to check stake at
     * @return stake The total stake amount
     */
    function getOperatorStakeAt(address operator, uint48 timestamp) public view virtual returns (uint256 stake) {
        address[] memory vaults = activeVaultsAt(timestamp, operator);
        uint160[] memory subnetworks = activeSubnetworksAt(timestamp);

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < subnetworks.length; ++j) {
                stake += getOperatorStakeAt(operator, vault, uint96(subnetworks[j]), timestamp);
            }
        }

        return stake;
    }

    /**
     * @notice Gets the total power amount for an operator across all vaults and subnetworks
     * @param operator The address of the operator
     * @return power The total power amount
     */
    function getOperatorPower(address operator) public view virtual returns (uint256 power) {
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

    /**
     * @notice Gets the total power amount for an operator across all vaults and subnetworks at a specific timestamp
     * @param operator The address of the operator
     * @param timestamp The timestamp to check power at
     * @return power The total power amount
     */
    function getOperatorPowerAt(address operator, uint48 timestamp) public view virtual returns (uint256 power) {
        address[] memory vaults = activeVaultsAt(timestamp, operator);
        uint160[] memory subnetworks = activeSubnetworksAt(timestamp);

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < subnetworks.length; ++j) {
                power += getOperatorPowerAt(operator, vault, uint96(subnetworks[j]), timestamp);
            }
        }

        return power;
    }

    /**
     * @notice Calculates the total stake for a list of operators
     * @param operators Array of operator addresses
     * @return stake The total stake amount
     */
    function _totalStake(address[] memory operators) internal view returns (uint256 stake) {
        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = getOperatorStake(operators[i]);
            stake += operatorStake;
        }

        return stake;
    }

    /**
     * @notice Calculates the total power for a list of operators
     * @param operators Array of operator addresses
     * @return power The total power amount
     */
    function _totalPower(address[] memory operators) internal view returns (uint256 power) {
        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = getOperatorPower(operators[i]);
            power += operatorStake;
        }

        return power;
    }

    /**
     * @notice Registers a new subnetwork
     * @param subnetwork The identifier of the subnetwork to register
     */
    function _registerSubnetwork(uint96 subnetwork) internal {
        _subnetworks.register(Time.timestamp(), uint160(subnetwork));
    }

    /**
     * @notice Pauses a subnetwork
     * @param subnetwork The identifier of the subnetwork to pause
     */
    function _pauseSubnetwork(uint96 subnetwork) internal {
        _subnetworks.pause(Time.timestamp(), uint160(subnetwork));
    }

    /**
     * @notice Unpauses a subnetwork
     * @param subnetwork The identifier of the subnetwork to unpause
     */
    function _unpauseSubnetwork(uint96 subnetwork) internal {
        _subnetworks.unpause(Time.timestamp(), SLASHING_WINDOW, uint160(subnetwork));
    }

    /**
     * @notice Unregisters a subnetwork
     * @param subnetwork The identifier of the subnetwork to unregister
     */
    function _unregisterSubnetwork(uint96 subnetwork) internal {
        _subnetworks.unregister(Time.timestamp(), SLASHING_WINDOW, uint160(subnetwork));
    }

    /**
     * @notice Registers a new shared vault
     * @param vault The address of the vault to register
     */
    function _registerSharedVault(address vault) internal {
        _validateVault(vault);
        _sharedVaults.register(Time.timestamp(), vault);
    }

    /**
     * @notice Registers a new operator vault
     * @param operator The address of the operator
     * @param vault The address of the vault to register
     */
    function _registerOperatorVault(address operator, address vault) internal {
        _validateVault(vault);
        if (_sharedVaults.contains(vault)) {
            revert VaultAlreadyRegistred();
        }
        _operatorVaults[operator].register(Time.timestamp(), vault);
        _vaultOperator.set(vault, operator);
    }

    /**
     * @notice Pauses a shared vault
     * @param vault The address of the vault to pause
     */
    function _pauseSharedVault(address vault) internal {
        _sharedVaults.pause(Time.timestamp(), vault);
    }

    /**
     * @notice Unpauses a shared vault
     * @param vault The address of the vault to unpause
     */
    function _unpauseSharedVault(address vault) internal {
        _sharedVaults.unpause(Time.timestamp(), SLASHING_WINDOW, vault);
    }

    /**
     * @notice Pauses an operator vault
     * @param operator The address of the operator
     * @param vault The address of the vault to pause
     */
    function _pauseOperatorVault(address operator, address vault) internal {
        _operatorVaults[operator].pause(Time.timestamp(), vault);
    }

    /**
     * @notice Unpauses an operator vault
     * @param operator The address of the operator
     * @param vault The address of the vault to unpause
     */
    function _unpauseOperatorVault(address operator, address vault) internal {
        _operatorVaults[operator].unpause(Time.timestamp(), SLASHING_WINDOW, vault);
    }

    /**
     * @notice Unregisters a shared vault
     * @param vault The address of the vault to unregister
     */
    function _unregisterSharedVault(address vault) internal {
        _sharedVaults.unregister(Time.timestamp(), SLASHING_WINDOW, vault);
    }

    /**
     * @notice Unregisters an operator vault
     * @param operator The address of the operator
     * @param vault The address of the vault to unregister
     */
    function _unregisterOperatorVault(address operator, address vault) internal {
        _operatorVaults[operator].unregister(Time.timestamp(), SLASHING_WINDOW, vault);
        _vaultOperator.remove(vault);
    }

    /**
     * @notice Slashes a vault based on provided conditions
     * @param timestamp The timestamp when the slash occurs
     * @param vault The address of the vault
     * @param subnetwork The subnetwork identifier
     * @param operator The operator to slash
     * @param amount The amount to slash
     * @param hints Additional data for the slasher
     * @return resp A struct containing information about the slash response
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

    /**
     * @notice Executes a veto-based slash for a vault
     * @param vault The address of the vault
     * @param slashIndex The index of the slash to execute
     * @param hints Additional data for the veto slasher
     * @return slashedAmount The amount that was slashed
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

    /**
     * @notice Validates if the vault is properly initialized and registered
     * @param vault The address of the vault to validate
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
