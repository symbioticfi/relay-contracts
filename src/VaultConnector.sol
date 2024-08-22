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

abstract contract VaultConnector {
    using EnumerableSet for EnumerableSet.AddressSet;
    using Subnetwork for address;
    using BitMaps for BitMaps.BitMap;

    error NotVault();
    error NotExistVault();
    error VaultAlreadyRegistred();
    error VaultGracePeriodNotPassed();
    error VaultEpochTooShort();

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
    EnumerableSet.AddressSet internal vaults;
    mapping(address => BitMaps.BitMap) internal operatorVaults;

    constructor(address _network, address _vaultRegistry, uint48 _slashingWindow) {
        NETWORK = _network;
        VAULT_REGISTRY = _vaultRegistry;
        SLASHING_WINDOW = _slashingWindow;
        subnetworks = 1;
    }

    function getVaults() external view returns (address[] memory) {
        return vaults.values();
    }

    function _getOperatorVaults(address operator, uint48 epochStartTs)
        internal
        view
        returns (address[] memory _operatorVaults)
    {
        _operatorVaults = vaults.values();
        uint256 length = 0;
        for (uint256 pos; pos < _operatorVaults.length; ++pos) {
            if (!operatorVaults[operator].get(pos, epochStartTs)) {
                continue;
            }
            _operatorVaults[length++] = _operatorVaults[pos];
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(_operatorVaults, length)
        }
    }

    function _setSubnetworks(uint256 _subnetworks) internal {
        if (subnetworks >= _subnetworks) {
            revert InvalidSubnetworksCnt();
        }

        subnetworks = _subnetworks;
    }

    function _registerVault(address vault) internal {
        if (vaults.contains(vault)) {
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

        vaults.add(vault);
    }

    function _enableVaults(address operator, address[] memory _vaults) internal {
        for (uint256 i = 0; i < _vaults.length; ++i) {
            uint256 pos = vaults._inner._positions[bytes32(uint256(uint160(_vaults[i])))];
            if (pos == 0) {
                revert NotExistVault();
            }

            operatorVaults[operator].set(pos);
        }
    }

    function _disableVaults(address operator, address[] memory _vaults) internal {
        for (uint256 i = 0; i < _vaults.length; ++i) {
            uint256 pos = vaults._inner._positions[bytes32(uint256(uint160(_vaults[i])))];
            if (pos == 0) {
                revert NotExistVault();
            }

            operatorVaults[operator].unset(pos);
        }
    }

    function _getOperatorStake(address operator, uint48 epochStartTs) internal view returns (uint256 stake) {
        for (uint256 pos; pos < vaults.length(); ++pos) {
            if (!operatorVaults[operator].get(pos, epochStartTs)) {
                continue;
            }

            for (uint96 i = 0; i < subnetworks; ++i) {
                bytes32 subnetwork = NETWORK.subnetwork(i);
                address vault = vaults.at(pos);
                stake += IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, epochStartTs, "");
            }
        }

        return stake;
    }

    function _calcTotalStake(uint48 epochStartTs, address[] memory operators)
        internal
        view
        returns (uint256 totalStake)
    {
        // for epoch older than SLASHING_WINDOW total stake can be invalidated (use cache)
        if (epochStartTs < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        if (epochStartTs > Time.timestamp()) {
            revert InvalidEpoch();
        }

        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = _getOperatorStake(operators[i], epochStartTs);
            totalStake += operatorStake;
        }
    }

    function _slash(uint48 epochStartTs, address operator, uint256 amount) internal {
        if (epochStartTs < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        uint256 totalOperatorStake = _getOperatorStake(operator, epochStartTs);

        if (totalOperatorStake < amount) {
            revert TooBigSlashAmount();
        }

        // simple pro-rata slasher
        for (uint256 pos; pos < vaults.length(); ++pos) {
            if (!operatorVaults[operator].get(pos, epochStartTs)) {
                continue;
            }

            for (uint96 i = 0; i < subnetworks; ++i) {
                bytes32 subnetwork = NETWORK.subnetwork(i);
                address vault = vaults.at(pos);

                uint256 vaultStake =
                    IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, epochStartTs, "");

                _slashVault(epochStartTs, vault, subnetwork, operator, amount * vaultStake / totalOperatorStake);
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
