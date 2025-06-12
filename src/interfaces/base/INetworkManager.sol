// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INetworkManager {
    error NetworkManager_InvalidNetwork();

    /// @custom:storage-location erc7201:symbiotic.storage.NetworkManager
    struct NetworkManagerStorage {
        address _network;
        uint96 _subnetworkID;
    }

    struct NetworkManagerInitParams {
        address network;
        uint96 subnetworkID;
    }

    event InitSubnetwork(address network, uint96 subnetworkID);

    function NETWORK() external view returns (address);

    function SUBNETWORK_IDENTIFIER() external view returns (uint96);

    function SUBNETWORK() external view returns (bytes32);
}
