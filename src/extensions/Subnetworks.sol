// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../middleware/BaseMiddleware.sol";
import {ISubnetworks} from "../interfaces/extensions/ISubnetworks.sol";

/**
 * @title Subnetworks
 * @notice Contract for managing subnetworks that can be registered and controlled
 * @dev Extends BaseMiddleware to provide access control for subnetwork management functions
 */
abstract contract Subnetworks is BaseMiddleware, ISubnetworks {
    uint64 public constant Subnetworks_VERSION = 1;

    /**
     * @inheritdoc ISubnetworks
     */
    function registerSubnetwork(
        uint96 subnetwork
    ) public checkAccess {
        _beforeRegisterSubnetwork(subnetwork);
        _registerSubnetwork(subnetwork);
    }

    /**
     * @inheritdoc ISubnetworks
     */
    function pauseSubnetwork(
        uint96 subnetwork
    ) public checkAccess {
        _beforePauseSubnetwork(subnetwork);
        _pauseSubnetwork(subnetwork);
    }

    /**
     * @inheritdoc ISubnetworks
     */
    function unpauseSubnetwork(
        uint96 subnetwork
    ) public checkAccess {
        _beforeUnpauseSubnetwork(subnetwork);
        _unpauseSubnetwork(subnetwork);
    }

    /**
     * @inheritdoc ISubnetworks
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
