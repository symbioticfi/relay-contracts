// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {BaseMiddleware} from "../BaseMiddleware.sol";

/**
 * @title Subnetworks
 * @notice Contract for managing subnetworks that can be registered and controlled
 * @dev Extends BaseMiddleware to provide access control for subnetwork management functions
 */
abstract contract Subnetworks is BaseMiddleware {
    /**
     * @notice Registers a new subnetwork
     * @param subnetwork The ID of the subnetwork to register
     */
    function registerSubnetwork(
        uint96 subnetwork
    ) public checkAccess {
        _beforeRegisterSubnetwork(subnetwork);
        _registerSubnetwork(subnetwork);
    }

    /**
     * @notice Pauses a subnetwork
     * @param subnetwork The ID of the subnetwork to pause
     */
    function pauseSubnetwork(
        uint96 subnetwork
    ) public checkAccess {
        _beforePauseSubnetwork(subnetwork);
        _pauseSubnetwork(subnetwork);
    }

    /**
     * @notice Unpauses a subnetwork
     * @param subnetwork The ID of the subnetwork to unpause
     */
    function unpauseSubnetwork(
        uint96 subnetwork
    ) public checkAccess {
        _beforeUnpauseSubnetwork(subnetwork);
        _unpauseSubnetwork(subnetwork);
    }

    /**
     * @notice Unregisters a subnetwork
     * @param subnetwork The ID of the subnetwork to unregister
     */
    function unregisterSubnetwork(
        uint96 subnetwork
    ) public checkAccess {
        _beforeUnregisterSubnetwork(subnetwork);
        _unregisterSubnetwork(subnetwork);
    }

    /**
     * @notice Hook called before registering a subnetwork
     * @param subnetwork The subnetwork ID
     */
    function _beforeRegisterSubnetwork(
        uint96 subnetwork
    ) internal virtual {}

    /**
     * @notice Hook called before pausing a subnetwork
     * @param subnetwork The subnetwork ID
     */
    function _beforePauseSubnetwork(
        uint96 subnetwork
    ) internal virtual {}

    /**
     * @notice Hook called before unpausing a subnetwork
     * @param subnetwork The subnetwork ID
     */
    function _beforeUnpauseSubnetwork(
        uint96 subnetwork
    ) internal virtual {}

    /**
     * @notice Hook called before unregistering a subnetwork
     * @param subnetwork The subnetwork ID
     */
    function _beforeUnregisterSubnetwork(
        uint96 subnetwork
    ) internal virtual {}
}
