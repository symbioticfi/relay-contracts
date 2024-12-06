// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title ISubnetworks
 * @notice Interface for managing subnetworks that can be registered and controlled
 */
interface ISubnetworks {
    /**
     * @notice Registers a new subnetwork
     * @param subnetwork The ID of the subnetwork to register
     */
    function registerSubnetwork(
        uint96 subnetwork
    ) external;

    /**
     * @notice Pauses a subnetwork
     * @param subnetwork The ID of the subnetwork to pause
     */
    function pauseSubnetwork(
        uint96 subnetwork
    ) external;

    /**
     * @notice Unpauses a subnetwork
     * @param subnetwork The ID of the subnetwork to unpause
     */
    function unpauseSubnetwork(
        uint96 subnetwork
    ) external;

    /**
     * @notice Unregisters a subnetwork
     * @param subnetwork The ID of the subnetwork to unregister
     */
    function unregisterSubnetwork(
        uint96 subnetwork
    ) external;
}
