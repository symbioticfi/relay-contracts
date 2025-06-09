// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISelfNetwork {
    error SelfNetwork_InvalidSlasher();
    error SelfNetwork_NotAuthorized();

    function SelfNetwork_VERSION() external view returns (uint64);

    function NETWORK_MIDDLEWARE_SERVICE() external view returns (address);

    function setMaxNetworkLimitVault(address vault, uint256 maxNetworkLimit) external;

    function setResolverVault(address vault, address resolver, bytes memory hints) external;

    function setMiddleware(
        address middleware
    ) external;
}
