// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {IOzAccessControl} from "../../../interfaces/features/permissions/IOzAccessControl.sol";

import {AccessControlUpgradeable} from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

/**
 * @title OzAccessControl
 * @notice A middleware extension that implements role-based access control
 * @dev Implements PermissionManager with role-based access control functionality
 */
abstract contract OzAccessControl is PermissionManager, AccessControlUpgradeable, IOzAccessControl {
    event SelectorRoleSet(bytes4 selector, bytes32 role);

    uint64 public constant OzAccessControl_VERSION = 1;

    /// @custom:storage-location erc7201:symbiotic.storage.OzAccessControl
    struct OzAccessControlStorage {
        mapping(bytes4 selector => bytes32 role) _selectorRoles;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OzAccessControl")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OzAccessControlStorageLocation =
        0xbe09a78a256419d2b885312b60a13e8082d8ab3c36c463fff4fbb086f1e96f00;

    function _getOzAccessControlStorage() internal pure returns (OzAccessControlStorage storage $) {
        assembly {
            $.slot := OzAccessControlStorageLocation
        }
    }

    /**
     * @inheritdoc IOzAccessControl
     */
    function getRole(
        bytes4 selector
    ) public view virtual returns (bytes32) {
        OzAccessControlStorage storage $ = _getOzAccessControlStorage();
        return $._selectorRoles[selector];
    }

    /**
     * @notice Initializes the contract
     */
    function __OzAccessControl_init() internal onlyInitializing {
        __AccessControl_init();
    }

    /**
     * @notice Sets the role required for a function selector
     * @param selector The function selector
     * @param role The required role
     */
    function _setSelectorRole(bytes4 selector, bytes32 role) internal virtual {
        OzAccessControlStorage storage $ = _getOzAccessControlStorage();
        $._selectorRoles[selector] = role;
        emit SelectorRoleSet(selector, role);
    }

    /**
     * @inheritdoc PermissionManager
     */
    function _checkPermission() internal view virtual override {
        _checkRole(getRole(msg.sig));
        if (!hasRole(getRole(msg.sig), msg.sender)) {
            revert AccessControlUnauthorizedAccount(msg.sender, getRole(msg.sig));
        }
    }
}
