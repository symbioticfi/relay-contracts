// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPermissionManager} from "../../../modules/base/IPermissionManager.sol";

import {IAccessControl} from "@openzeppelin/contracts/access/IAccessControl.sol";

interface IOzAccessControl {
    /**
     * @notice The storage of the OzAccessControl contract.
     * @param _selectorRoles The mapping from the function selector to the required role.
     * @custom:storage-location erc7201:symbiotic.storage.OzAccessControl
     */
    struct OzAccessControlStorage {
        mapping(bytes4 selector => bytes32 role) _selectorRoles;
    }

    /**
     * @notice Emitted when the required role is set for a selector.
     * @param selector The function selector.
     * @param role The required role.
     */
    event SetSelectorRole(bytes4 indexed selector, bytes32 indexed role);

    /**
     * @notice Returns the required role for a selector.
     * @param selector The function selector.
     * @return The required role.
     */
    function getRole(
        bytes4 selector
    ) external view returns (bytes32);
}
