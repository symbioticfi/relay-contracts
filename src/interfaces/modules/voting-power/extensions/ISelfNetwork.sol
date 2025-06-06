// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISelfNetwork {
    error SelfNetwork_InvalidSlasher();

    function SelfNetwork_VERSION() external view returns (uint64);

    function NETWORK_REGISTRY() external view returns (address);

    function NETWORK_MIDDLEWARE_SERVICE() external view returns (address);
}
