// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface INetworkManager {
    struct NetworkManagerInitParams {
        address network;
        uint96 subnetworkID;
    }
}
