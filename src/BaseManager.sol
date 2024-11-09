// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract BaseManager is Initializable, OwnableUpgradeable {
    error SlashingWindowTooShort(); // Error thrown when the slashing window is lower than epoch

    address public NETWORK; // Address of the network
    uint48 public EPOCH_DURATION; // Duration of each epoch
    uint48 public START_TIME; // Start time of the epoch
    uint48 public SLASHING_WINDOW; // Duration of the slashing window
    uint32 public IMMUTABLE_EPOCHS; // Duration of the state immutability in epochs
    address public VAULT_REGISTRY; // Address of the vault registry
    address public OPERATOR_REGISTRY; // Address of the operator registry
    address public OPERATOR_NET_OPTIN; // Address of the operator network opt-in service

    uint64 public constant INSTANT_SLASHER_TYPE = 0; // Constant representing the instant slasher type
    uint64 public constant VETO_SLASHER_TYPE = 1; // Constant representing the veto slasher type

    constructor() {
        _disableInitializers();
    }

    /* 
     * @notice initalizer of the BaseManager contract.
     * @param owner The address of the contract owner.
     * @param network The address of the network.
     * @param epochDuration The duration of each epoch.
     * @param slashingWindow The duration of the slashing window.
     * @param vaultRegistry The address of the vault registry.
     * @param operatorRegistry The address of the operator registry.
     * @param operatorNetOptIn The address of the operator network opt-in service.
     */
    function initialize(
        address owner,
        address network,
        uint48 epochDuration,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn
    ) public virtual initializer {
        if (slashingWindow < epochDuration) {
            revert SlashingWindowTooShort();
        }

        __Ownable_init(owner);

        NETWORK = network;
        EPOCH_DURATION = epochDuration;
        SLASHING_WINDOW = slashingWindow;
        IMMUTABLE_EPOCHS = uint32((slashingWindow + epochDuration - 1) / epochDuration);
        VAULT_REGISTRY = vaultRegistry;
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NET_OPTIN = operatorNetOptIn;
    }

    /* 
     * @notice Returns the start timestamp of a given epoch.
     * @param epoch The epoch number.
     * @return The start timestamp of the specified epoch.
     */
    function getEpochStart(uint32 epoch) public view returns (uint48 timestamp) {
        return START_TIME + epoch * EPOCH_DURATION;
    }

    /* 
     * @notice Returns the epoch number corresponding to a given timestamp.
     * @param timestamp The timestamp to convert to an epoch number.
     * @return The epoch number associated with the specified timestamp.
     */
    function getEpochAt(uint48 timestamp) public view returns (uint32 epoch) {
        return uint32((timestamp - START_TIME) / EPOCH_DURATION);
    }

    /* 
     * @notice Returns the current epoch number based on the current timestamp.
     * @return The current epoch number.
     */
    function getCurrentEpoch() public view returns (uint32 epoch) {
        return getEpochAt(Time.timestamp());
    }

    /* 
     * @notice Returns the start timestamp of the current epoch.
     * @return The start timestamp of the current epoch.
     */
    function getCurrentEpochStart() public view returns (uint48 timestamp) {
        return START_TIME + getCurrentEpoch() * EPOCH_DURATION;
    }
}
