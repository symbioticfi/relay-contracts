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

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {BitMaps} from "./libraries/BitMaps.sol";
import {Subsets} from "./libraries/Subsets.sol";

abstract contract VaultConnector {
    using EnumerableSet for EnumerableSet.AddressSet;
    using Subnetwork for address;
    using BitMaps for BitMaps.BitMap;

    error NotVault();
    error NotExistVault();
    error VaultAlreadyRegistred();
    error VaultGracePeriodNotPassed();
    error VaultEpochTooShort();
    error InvalidVaultsPositions();

    error TooOldEpoch();
    error InvalidEpoch();

    error InvalidSubnetworksCnt();

    error TooBigSlashAmount();
    error UnknownSlasherType();

    address public immutable NETWORK;
    address public immutable VAULT_REGISTRY;
    uint48 public immutable SLASHING_WINDOW;
    uint48 public constant INSTANT_SLASHER_TYPE = 0;
    uint48 public constant VETO_SLASHER_TYPE = 1;
    uint256 public subnetworks;
    EnumerableSet.AddressSet internal sharedVaults;
    BitMaps.BitMap internal sharedVaultsStatus;
    EnumerableSet.AddressSet internal operatorVaults;
    mapping(address => BitMaps.BitMap) internal operatorVaultsStatus;

    constructor(address _network, address _vaultRegistry, uint48 _slashingWindow) {
        NETWORK = _network;
        VAULT_REGISTRY = _vaultRegistry;
        SLASHING_WINDOW = _slashingWindow;
        subnetworks = 1;
    }

    function getOperatorVaults() external view returns (address[] memory) {
        return operatorVaults.values();
    }

    function getSharedVaults() external view returns (address[] memory) {
        return sharedVaults.values();
    }

    function _getEnabledSharedVaults(uint48 timestamp) internal view returns (address[] memory vaults) {
        return Subsets.getEnabledEnumerableAddressSubset(sharedVaults, sharedVaultsStatus, timestamp);
    }

    // TODO this merge allocated less memory than two times to call to Subsets library and merge
    function _getEnabledOperatorVaults(address operator, uint48 timestamp)
        internal
        view
        returns (address[] memory vaults)
    {
        uint256 operatorVaultsLen;
        for (uint256 pos; pos < operatorVaults.length(); ++pos) {
            if (operatorVaultsStatus[operator].get(pos, timestamp)) {
                operatorVaultsLen++;
            }
        }

        vaults = new address[](sharedVaults.length() + operatorVaultsLen);
        uint256 idx = 0;

        for (uint256 pos; pos < operatorVaults.length(); ++pos) {
            if (operatorVaultsStatus[operator].get(pos, timestamp)) {
                vaults[idx++] = operatorVaults.at(pos);
            }
        }

        for (uint256 pos; pos < sharedVaults.length(); ++pos) {
            vaults[idx++] = sharedVaults.at(pos);
        }

        return vaults;
    }

    function _setSubnetworks(uint256 _subnetworks) internal {
        if (subnetworks >= _subnetworks) {
            revert InvalidSubnetworksCnt();
        }

        subnetworks = _subnetworks;
    }

    function _registerVault(address vault, bool isSharedVault) internal {
        if (operatorVaults.contains(vault) || sharedVaults.contains(vault)) {
            revert VaultAlreadyRegistred();
        }

        if (!IRegistry(VAULT_REGISTRY).isEntity(vault)) {
            revert NotVault();
        }

        uint48 vaultEpoch = IVault(vault).epochDuration();

        address slasher = IVault(vault).slasher();
        if (slasher != address(0) && IEntity(slasher).TYPE() == VETO_SLASHER_TYPE) {
            vaultEpoch -= IVetoSlasher(slasher).vetoDuration();
        }

        if (vaultEpoch < SLASHING_WINDOW) {
            revert VaultEpochTooShort();
        }

        if (isSharedVault) {
            sharedVaults.add(vault);
        } else {
            operatorVaults.add(vault);
        }
    }

    function _enableSharedVaults(uint256[] memory positions) internal {
        Subsets.enableSubset(sharedVaultsStatus, positions, sharedVaults.length());
    }

    function _disableSharedVaults(uint256[] memory positions) internal {
        Subsets.disableSubset(sharedVaultsStatus, positions, sharedVaults.length());
    }

    function _enableOperatorVaults(address operator, uint256[] memory positions) internal {
        Subsets.enableSubset(operatorVaultsStatus[operator], positions, operatorVaults.length());
    }

    function _disableOperatorVaults(address operator, uint256[] memory positions) internal {
        Subsets.disableSubset(operatorVaultsStatus[operator], positions, operatorVaults.length());
    }

    function _getOperatorStake(address operator, uint48 timestamp) internal view returns (uint256 stake) {
        address[] memory vaults = _getEnabledOperatorVaults(operator, timestamp);

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint96 subnet = 0; subnet < subnetworks; ++subnet) {
                bytes32 subnetwork = NETWORK.subnetwork(subnet);
                stake += IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, timestamp, "");
            }
        }

        return stake;
    }

    function _calcTotalStake(uint48 timestamp, address[] memory operators) internal view returns (uint256 totalStake) {
        if (timestamp < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        if (timestamp > Time.timestamp()) {
            revert InvalidEpoch();
        }

        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = _getOperatorStake(operators[i], timestamp);
            totalStake += operatorStake;
        }
    }

    function _slash(uint48 timestamp, address operator, uint256 amount) internal {
        if (timestamp < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        uint256 totalOperatorStake = _getOperatorStake(operator, timestamp);

        if (totalOperatorStake < amount) {
            revert TooBigSlashAmount();
        }

        // simple pro-rata slasher
        address[] memory vaults = _getEnabledOperatorVaults(operator, timestamp);

        for (uint256 i = 0; i < vaults.length; ++i) {
            for (uint96 subnet = 0; subnet < subnetworks; ++subnet) {
                bytes32 subnetwork = NETWORK.subnetwork(subnet);
                address vault = vaults[i];

                uint256 vaultStake =
                    IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, timestamp, "");

                _slashVault(timestamp, vault, subnetwork, operator, amount * vaultStake / totalOperatorStake);
            }
        }
    }

    function _slashVault(uint48 timestamp, address vault, bytes32 subnetwork, address operator, uint256 amount)
        private
    {
        address slasher = IVault(vault).slasher();
        uint256 slasherType = IEntity(slasher).TYPE();
        if (slasherType == INSTANT_SLASHER_TYPE) {
            ISlasher(slasher).slash(subnetwork, operator, amount, timestamp, new bytes(0));
        } else if (slasherType == VETO_SLASHER_TYPE) {
            IVetoSlasher(slasher).requestSlash(subnetwork, operator, amount, timestamp, new bytes(0));
        } else {
            revert UnknownSlasherType();
        }
    }
}
