// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import {AccessManager} from "../../../managers/extendable/AccessManager.sol";
import {IOzOwnable} from "../../../interfaces/extensions/managers/access/IOzOwnable.sol";

/**
 * @title OzOwnable
 * @notice A middleware extension that restricts access to a single owner address
 * @dev Implements AccessManager with owner-based access control
 */
abstract contract OzOwnable is AccessManager, OwnableUpgradeable, IOzOwnable {
    uint64 public constant OzOwnable_VERSION = 1;

    /**
     * @notice Initializes the contract with an owner address
     * @param owner_ The address to set as the owner
     */
    function __OzOwnable_init(
        address owner_
    ) internal onlyInitializing {
        __Ownable_init(owner_);
    }

    /**
     * @notice Checks if the caller has access (is the owner)
     * @dev Reverts if the caller is not the owner
     */
    function _checkAccess() internal view virtual override {
        _checkOwner();
    }
}
