// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {PauseableEnumerableSet} from "./libraries/PauseableEnumerableSet.sol";

abstract contract BaseMiddleware is Ownable {
    using PauseableEnumerableSet for PauseableEnumerableSet.Uint160Set;

    error SlashingWindowTooShort(); // Error thrown when the slashing window is lower than epoch

    address public immutable NETWORK; // Address of the network
    uint48 public immutable EPOCH_DURATION; // Duration of each epoch
    uint48 public immutable START_TIME; // Start time of the epoch
    uint48 public immutable SLASHING_WINDOW; // Duration of the slashing window
    uint48 public immutable IMMUTABLE_EPOCHS; // Duration of the state immutability in epochs
    address public immutable VAULT_REGISTRY; // Address of the vault registry
    address public immutable OPERATOR_REGISTRY; // Address of the operator registry
    address public immutable OPERATOR_NET_OPTIN; // Address of the operator network opt-in service

    uint64 public constant INSTANT_SLASHER_TYPE = 0; // Constant representing the instant slasher type
    uint64 public constant VETO_SLASHER_TYPE = 1; // Constant representing the veto slasher type
    uint96 public constant DEFAULT_SUBNETWORK = 0; // Default subnetwork identifier

    PauseableEnumerableSet.Uint160Set subnetworks; // Set of active subnetworks

    /* 
     * @notice Constructor for initializing the BaseMiddleware contract. Epoch starts from 1.
     * @param owner The address of the contract owner.
     * @param network The address of the network.
     * @param epochDuration The duration of each epoch.
     * @param slashingWindow The duration of the slashing window.
     * @param vaultRegistry The address of the vault registry.
     * @param operatorRegistry The address of the operator registry.
     * @param operatorNetOptIn The address of the operator network opt-in service.
     */
    constructor(
        address owner,
        address network,
        uint48 epochDuration,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn
    ) Ownable(owner) {
        if (slashingWindow < epochDuration) {
            revert SlashingWindowTooShort();
        }

        NETWORK = network;
        EPOCH_DURATION = epochDuration;
        SLASHING_WINDOW = slashingWindow;
        IMMUTABLE_EPOCHS = (slashingWindow + epochDuration - 1) / epochDuration;
        VAULT_REGISTRY = vaultRegistry;
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NET_OPTIN = operatorNetOptIn;

        subnetworks.register(getCurrentEpoch(), uint160(DEFAULT_SUBNETWORK)); // Register default subnetwork
    }

    /* 
     * @notice Returns the start timestamp of a given epoch. Epoch starts from 1.
     * @param epoch The epoch number.
     * @return The start timestamp of the specified epoch.
     */
    function getEpochStart(uint48 epoch) public view returns (uint48 timestamp) {
        return START_TIME + (epoch - 1) * EPOCH_DURATION;
    }

    /* 
     * @notice Returns the epoch number corresponding to a given timestamp. Epoch starts from 1.
     * @param timestamp The timestamp to convert to an epoch number.
     * @return The epoch number associated with the specified timestamp.
     */
    function getEpochAt(uint48 timestamp) public view returns (uint48 epoch) {
        return (timestamp - START_TIME) / EPOCH_DURATION + 1;
    }

    /* 
     * @notice Returns the current epoch number based on the current timestamp. Epoch starts from 1.
     * @return The current epoch number.
     */
    function getCurrentEpoch() public view returns (uint48 epoch) {
        return getEpochAt(Time.timestamp());
    }

    /* 
     * @notice Returns the start timestamp of the current epoch. Epoch starts from 1.
     * @return The start timestamp of the current epoch.
     */
    function getCurrentEpochStart() public view returns (uint48 timestamp) {
        return START_TIME + (getCurrentEpoch() - 1) * EPOCH_DURATION;
    }

    /* 
     * @notice Returns the number of subnetworks registered.
     * @return The count of registered subnetworks.
     */
    function subnetworksLength() public view returns (uint256) {
        return subnetworks.length();
    }

    /* 
     * @notice Returns the subnetwork information at a specified position.
     * @param pos The index of the subnetwork.
     * @return The subnetwork details including address, enabled epoch, and disabled epoch.
     */
    function subnetworkWithTimesAt(uint256 pos) public view returns (uint160, uint48, uint48) {
        return subnetworks.at(pos);
    }

    /* 
     * @notice Returns an array of active subnetworks for the current epoch.
     * @return An array of active subnetwork addresses.
     */
    function activeSubnetworks() public view returns (uint160[] memory) {
        return subnetworks.getActive(getCurrentEpoch());
    }

    /* 
     * @notice Registers a new subnetwork.
     * @param subnetwork The identifier of the subnetwork to register.
     */
    function registerSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        subnetworks.register(getCurrentEpoch(), uint160(subnetwork));
    }

    /* 
     * @notice Pauses a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to pause.
     */
    function pauseSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        subnetworks.pause(getCurrentEpoch(), uint160(subnetwork));
    }

    /* 
     * @notice Unpauses a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to unpause.
     */
    function unpauseSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        subnetworks.unpause(getCurrentEpoch(), IMMUTABLE_EPOCHS, uint160(subnetwork));
    }

    /* 
     * @notice Unregisters a specified subnetwork.
     * @param subnetwork The identifier of the subnetwork to unregister.
     */
    function unregisterSubnetwork(uint96 subnetwork) public virtual onlyOwner {
        subnetworks.unregister(getCurrentEpoch(), IMMUTABLE_EPOCHS, uint160(subnetwork));
    }
}
