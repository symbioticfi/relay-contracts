// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

import {INetworkManager} from "../../../interfaces/base/INetworkManager.sol";

library NetworkManagerLogic {
    using Subnetwork for address;

    uint64 internal constant NetworkManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.NetworkManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkManagerLocation = 0x779150488f5e984d1f840ba606e388ada6c73b44f261274c3595c61a30023e00;

    function _getNetworkManagerStorage() internal pure returns (INetworkManager.NetworkManagerStorage storage $) {
        assembly {
            $.slot := NetworkManagerLocation
        }
    }

    function initialize(
        INetworkManager.NetworkManagerInitParams memory initParams
    ) internal {
        INetworkManager.NetworkManagerStorage storage $ = _getNetworkManagerStorage();
        $._network = initParams.network;
        $._subnetworkID = initParams.subnetworkID;
        emit INetworkManager.InitSubnetwork(initParams.network, initParams.subnetworkID);
    }

    function NETWORK() internal view returns (address) {
        return _getNetworkManagerStorage()._network;
    }

    function SUBNETWORK_IDENTIFIER() internal view returns (uint96) {
        return _getNetworkManagerStorage()._subnetworkID;
    }

    function SUBNETWORK() internal view returns (bytes32) {
        return NETWORK().subnetwork(SUBNETWORK_IDENTIFIER());
    }
}
