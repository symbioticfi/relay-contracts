// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IOzAccessControl
 * @notice Interface for a middleware extension that implements role-based access control
 */
interface IOzAccessControl {
    error AccessControlUnauthorizedAccount(address account, bytes32 role);
    error AccessControlBadConfirmation();

    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);
    event SelectorRoleSet(bytes4 indexed selector, bytes32 indexed role);

    /**
     * @notice Returns true if account has been granted role
     * @param role The role to check
     * @param account The account to check
     * @return bool True if account has role
     */
    function hasRole(bytes32 role, address account) external view returns (bool);

    /**
     * @notice Returns the admin role that controls the specified role
     * @param role The role to get the admin for
     * @return bytes32 The admin role
     */
    function getRoleAdmin(
        bytes32 role
    ) external view returns (bytes32);

    /**
     * @notice Returns the role required for a function selector
     * @param selector The function selector
     * @return bytes32 The required role
     */
    function getRole(
        bytes4 selector
    ) external view returns (bytes32);

    /**
     * @notice Grants role to account if caller has admin role
     * @param role The role to grant
     * @param account The account to grant the role to
     */
    function grantRole(bytes32 role, address account) external;

    /**
     * @notice Revokes role from account if caller has admin role
     * @param role The role to revoke
     * @param account The account to revoke the role from
     */
    function revokeRole(bytes32 role, address account) external;

    /**
     * @notice Allows an account to renounce a role they have
     * @param role The role to renounce
     * @param callerConfirmation Address of the caller for confirmation
     */
    function renounceRole(bytes32 role, address callerConfirmation) external;
}
