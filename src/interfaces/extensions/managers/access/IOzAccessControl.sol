// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title IOzAccessControl
 * @notice Interface for a middleware extension that implements role-based access control
 */
interface IOzAccessControl {
    /**
     * @notice Returns the role required for a function selector
     * @param selector The function selector
     * @return bytes32 The required role
     */
    function getRole(
        bytes4 selector
    ) external view returns (bytes32);
}
