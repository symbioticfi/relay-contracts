// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISetMaxNetworkLimitHook {
    function setMaxNetworkLimit(address delegator, uint96 subnetworkID, uint256 maxNetworkLimit) external;
}
