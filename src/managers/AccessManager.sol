// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

abstract contract AccessManager {
    modifier checkAccess() {
        _checkAccess();
        _;
    }

    /**
     * @notice Checks if the user has access to the given selector.
     */
    function _checkAccess() internal virtual {}
}
