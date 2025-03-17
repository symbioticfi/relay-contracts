// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IOperatorManager} from "./IOperatorManager.sol";
import {Updatable} from "../contracts/libraries/utils/Updatable.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

interface IVaultManager {
    struct VaultManagerInitParams {
        IOperatorManager.OperatorManagerInitParams baseParams;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
    struct VaultManagerStorage {
        EnumerableSet.AddressSet _tokens;
        mapping(address => Updatable.Uint208Value) _tokenPrice;
        EnumerableSet.AddressSet _sharedVaults;
        EnumerableSet.AddressSet _allOperatorVaults;
        mapping(address => EnumerableSet.AddressSet) _operatorVaults;
        mapping(address => Updatable.Uint208Value) _vaultWeight;
    }
}
