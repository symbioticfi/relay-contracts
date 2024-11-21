// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract BaseManager is Initializable {
    uint64 public constant INSTANT_SLASHER_TYPE = 0; // Constant representing the instant slasher type
    uint64 public constant VETO_SLASHER_TYPE = 1; // Constant representing the veto slasher type

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

    function _getBaseManagerStorage() private pure returns (BaseManagerStorage storage $) {
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
    function initialize(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn
    ) public virtual initializer {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        $._network = network;
        $._slashingWindow = slashingWindow;
        $._vaultRegistry = vaultRegistry;
        $._operatorRegistry = operatorRegistry;
        $._operatorNetOptin = operatorNetOptIn;
    }

    function NETWORK() public view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._network;
    }

    function SLASHING_WINDOW() public view returns (uint48) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._slashingWindow;
    }

    function VAULT_REGISTRY() public view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._vaultRegistry;
    }

    function OPERATOR_REGISTRY() public view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._operatorRegistry;
    }

    function OPERATOR_NET_OPTIN() public view returns (address) {
        BaseManagerStorage storage $ = _getBaseManagerStorage();
        return $._operatorNetOptin;
    }

    /**
     * @notice Returns the current capture timestamp
     * @return timestamp The current capture timestamp
     */
    function getCaptureTimestamp() public view virtual returns (uint48 timestamp);

    /**
     * @notice Converts stake amount to voting power
     * @param vault The vault address
     * @param stake The stake amount
     * @return power The calculated voting power
     */
    function stakeToPower(address vault, uint256 stake) public view virtual returns (uint256 power) {
        return stake;
    }
}
