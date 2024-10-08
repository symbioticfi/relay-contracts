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

import {MiddlewareStorage} from "./MiddlewareStorage.sol";
import {EnumerableSetWithTimeData} from "./libraries/EnumerableSetWithTimeData.sol";

abstract contract VaultManager is MiddlewareStorage {
    using EnumerableSetWithTimeData for EnumerableSetWithTimeData.AddressSet;
    using EnumerableSetWithTimeData for EnumerableSetWithTimeData.Uint160Set;

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

    EnumerableSetWithTimeData.Uint160Set subnetworks;

    EnumerableSetWithTimeData.AddressSet internal sharedVaults;
    mapping(address => EnumerableSetWithTimeData.AddressSet) internal operatorVaults;

    struct SlashResponse {
        address vault;
        uint64 slasherType;
        bytes32 subnetwork;
        uint256 response; // if instant slashed amount else slash index
    }

    constructor() {
        subnetworks.register(DEFAULT_SUBNETWORK);
    }

    function subnetworksLength() external view returns (uint256) {
        return subnetworks.length();
    }

    function subnetworkWithTimesAt(uint256 pos) external view returns (uint160, uint48, uint48) {
        return subnetworks.at(pos);
    }

    function sharedVaultsLength() external view returns (uint256) {
        return sharedVaults.length();
    }

    function sharedVaultWithTimesAt(uint256 pos) external view returns (address, uint48, uint48) {
        return sharedVaults.at(pos);
    }

    function operatorVaultsLength(address operator) external view returns (uint256) {
        return operatorVaults[operator].length();
    }

    function opeartorVaultWithTimesAt(address operator, uint256 pos) external view returns (address, uint48, uint48) {
        return operatorVaults[operator].at(pos);
    }

    // useful when vaults have different assets
    function stakeToPower(address vault, uint256 stake) public view virtual returns (uint256) {
        return stake;
    }

    function activeSubnetworks(uint48 timestamp) public view returns (uint160[] memory) {
        return subnetworks.getActive(timestamp);
    }

    function activeVaults(address operator, uint48 timestamp) public view returns (address[] memory) {
        address[] memory activeSharedVaults = sharedVaults.getActive(timestamp);
        address[] memory activeOperatorVaults = operatorVaults[operator].getActive(timestamp);

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

    function registerSharedVault(address vault) external onlyOwner {
        _validateVault(vault);
        sharedVaults.register(vault);
    }

    function registerOperatorVault(address vault, address operator) external onlyOwner {
        _validateVault(vault);
        operatorVaults[operator].register(vault);
    }

    function pauseSharedVault(address vault) external onlyOwner {
        sharedVaults.pause(vault);
    }

    function unpauseSharedVault(address vault) external onlyOwner {
        sharedVaults.unpause(vault, SLASHING_WINDOW);
    }

    function pauseOperatorVault(address operator, address vault) external onlyOwner {
        operatorVaults[operator].pause(vault);
    }

    function unpauseOperatorVault(address operator, address vault) external onlyOwner {
        operatorVaults[operator].unpause(vault, SLASHING_WINDOW);
    }

    function unregisterSharedVault(address vault) external onlyOwner {
        sharedVaults.unregister(vault, SLASHING_WINDOW);
    }

    function unregisterOperatorVault(address operator, address vault) external onlyOwner {
        operatorVaults[operator].unregister(vault, SLASHING_WINDOW);
    }

    function getOperatorStake(address operator, uint48 timestamp) public view returns (uint256 stake) {
        address[] memory vaults = activeVaults(operator, timestamp);
        uint160[] memory _subnetworks = activeSubnetworks(timestamp);

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint256 j; j < _subnetworks.length; ++j) {
                bytes32 subnetwork = NETWORK.subnetwork(uint96(_subnetworks[j]));
                stake += IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, timestamp, "");
            }
        }

        return stake;
    }

    function getOperatorPower(address operator, uint48 timestamp) public view returns (uint256 power) {
        address[] memory vaults = activeVaults(operator, timestamp);
        uint160[] memory _subnetworks = activeSubnetworks(timestamp);

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

    function totalStake(uint48 timestamp, address[] memory operators) internal view returns (uint256 stake) {
        if (timestamp < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        if (timestamp > Time.timestamp()) {
            revert InvalidEpoch();
        }

        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = getOperatorStake(operators[i], timestamp);
            stake += operatorStake;
        }

        return stake;
    }

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

    function executeSlash(address vault, uint256 slashIndex, bytes calldata hints)
        external
        onlyOwner
        returns (uint256 slashedAmount)
    {
        if (!sharedVaults.contains(vault)) {
            revert NotVault();
        }

        address slasher = IVault(vault).slasher();
        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType != VETO_SLASHER_TYPE) {
            revert NonVetoSlasher();
        }

        return IVetoSlasher(slasher).executeSlash(slashIndex, hints);
    }

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
