// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../BaseMiddleware.sol";

/**
 * @title OwnableAccessManager
 * @notice A middleware extension that restricts access to a single owner address
 * @dev Implements BaseMiddleware with owner-based access control
 */
abstract contract OwnableAccessManager is BaseMiddleware {
    address public owner;

    /**
     * @notice Error thrown when a non-owner address attempts to call a restricted function
     * @param sender The address that attempted the call
     */
    error OnlyOwnerCanCall(address sender);

    /**
     * @notice Error thrown when trying to set an invalid owner address
     * @param owner The invalid owner address
     */
    error InvalidOwner(address owner);

    /**
     * @notice Initializes the contract with an owner address
     * @param _owner The address to set as the owner
     */
    function __OwnableAccessManaged_init(
        address _owner
    ) internal onlyInitializing {
        owner = _owner;
    }

    /**
     * @notice Checks if the caller has access (is the owner)
     * @dev Reverts if the caller is not the owner
     */
    function _checkAccess() internal view override {
        if (msg.sender != owner) {
            revert OnlyOwnerCanCall(msg.sender);
        }
    }

    /**
     * @notice Updates the owner address
     * @param _owner The new owner address
     * @dev Can only be called by the current owner
     */
    function setOwner(
        address _owner
    ) public checkAccess {
        if (_owner == address(0)) {
            revert InvalidOwner(address(0));
        }
        owner = _owner;
    }
}
