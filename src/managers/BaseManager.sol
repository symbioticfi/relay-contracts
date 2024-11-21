// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract BaseManager is Initializable {
    address public NETWORK; // Address of the network
    uint48 public SLASHING_WINDOW; // Duration of the slashing window
    address public VAULT_REGISTRY; // Address of the vault registry
    address public OPERATOR_REGISTRY; // Address of the operator registry
    address public OPERATOR_NET_OPTIN; // Address of the operator network opt-in service

    uint64 public constant INSTANT_SLASHER_TYPE = 0; // Constant representing the instant slasher type
    uint64 public constant VETO_SLASHER_TYPE = 1; // Constant representing the veto slasher type

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
        NETWORK = network;
        SLASHING_WINDOW = slashingWindow;
        VAULT_REGISTRY = vaultRegistry;
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NET_OPTIN = operatorNetOptIn;
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
