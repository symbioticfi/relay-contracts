// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PauseableEnumerableSet} from "../../libraries/PauseableEnumerableSet.sol";

import {IOperatorManager} from "./IOperatorManager.sol";
import {IStakePowerManager} from "./extendable/IStakePowerManager.sol";

import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

interface IVaultManager {
    error NotVault();
    error NotOperatorVault();
    error VaultNotInitialized();
    error VaultAlreadyRegistered();
    error VaultEpochTooShort();
    error InactiveOperatorSlash();
    error InactiveVaultSlash();
    error InactiveSubnetworkSlash();
    error UnknownSlasherType();
    error NonVetoSlasher();
    error NoSlasher();
    error TooOldTimestampSlash();
    error NotSharedVault();
    error NotOperatorSpecificVault();
    error InvalidOperatorNetwork();

    /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
    struct VaultManagerStorage {
        address _vaultRegistry;
        PauseableEnumerableSet.Uint160Set _subnetworks;
        PauseableEnumerableSet.AddressSet _sharedVaults;
        mapping(address => PauseableEnumerableSet.AddressSet) _operatorVaults;
        EnumerableMap.AddressToAddressMap _vaultOperator;
    }

    enum SlasherType {
        INSTANT, // Instant slasher type
        VETO // Veto slasher type

    }

    enum DelegatorType {
        NETWORK_RESTAKE,
        FULL_RESTAKE,
        OPERATOR_SPECIFIC,
        OPERATOR_NETWORK_SPECIFIC
    }

    event RegisterSubnetwork(uint96 subnetwork);
    event PauseSubnetwork(uint96 subnetwork);
    event UnpauseSubnetwork(uint96 subnetwork);
    event UnregisterSubnetwork(uint96 subnetwork);
    event RegisterSharedVault(address sharedVault);
    event RegisterOperatorVault(address operator, address vault);
    event PauseSharedVault(address sharedVault);
    event UnpauseSharedVault(address sharedVault);
    event PauseOperatorVault(address operator, address vault);
    event UnpauseOperatorVault(address operator, address vault);
    event UnregisterSharedVault(address sharedVault);
    event UnregisterOperatorVault(address operator, address vault);
    event InstantSlash(address vault, bytes32 subnetwork, uint256 slashedAmount);
    event VetoSlash(address vault, bytes32 subnetwork, uint256 slashIndex);
    event ExecuteSlash(address vault, uint256 slashIndex, uint256 slashedAmount);
}
