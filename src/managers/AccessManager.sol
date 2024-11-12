// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

abstract contract AccessManager {
    modifier checkAccess() {
        _checkAccess(msg.sender, msg.sig);
        _;
    }

    /**
     * @notice Checks if the user has access to the given selector.
     * @param caller The address to check access for.
     * @param selector The selector to check access for.
     */
    function _checkAccess(address caller, bytes4 selector) internal view {}
}
