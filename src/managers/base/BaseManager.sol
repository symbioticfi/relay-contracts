// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {CaptureTimestampManager} from "./CaptureTimestampManager.sol";

abstract contract BaseManager is CaptureTimestampManager {
    uint64 internal constant INSTANT_SLASHER_TYPE = 0; // Constant representing the instant slasher type
    uint64 internal constant VETO_SLASHER_TYPE = 1; // Constant representing the veto slasher type

    /// @custom:storage-location erc7201:symbiotic.storage.BaseManager
    struct BaseManagerStorage {
        address _network; // Address of the network
        uint48 _slashingWindow; // Duration of the slashing window
        address _vaultRegistry; // Address of the vault registry
        address _operatorRegistry; // Address of the operator registry
        address _operatorNetOptin; // Address of the operator network opt-in service
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.BaseManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BaseManagerStorageLocation =
        0xb3503c3f5ee7753561129bea19627692ca916ecb48491bfcd223db17a12b8e00;

    function _getBaseManagerStorage() internal pure returns (BaseManagerStorage storage $) {
        assembly {
            $.slot := BaseManagerStorageLocation
        }
    }

    /**
     * @notice Initializes the BaseManager contract
     * @param network The address of the network
     * @param slashingWindow The duration of the slashing window
     * @param vaultRegistry The address of the vault registry
     * @param operatorRegistry The address of the operator registry
     * @param operatorNetOptIn The address of the operator network opt-in service
     */
    function __BaseManager_init(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn
    ) internal onlyInitializing {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        $._network = network;
        $._slashingWindow = slashingWindow;
        $._vaultRegistry = vaultRegistry;
        $._operatorRegistry = operatorRegistry;
        $._operatorNetOptin = operatorNetOptIn;
    }

    function _NETWORK() internal view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._network;
    }

    function _SLASHING_WINDOW() internal view returns (uint48) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._slashingWindow;
    }

    function _VAULT_REGISTRY() internal view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._vaultRegistry;
    }

    function _OPERATOR_REGISTRY() internal view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._operatorRegistry;
    }

    function _OPERATOR_NET_OPTIN() internal view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._operatorNetOptin;
    }
}
