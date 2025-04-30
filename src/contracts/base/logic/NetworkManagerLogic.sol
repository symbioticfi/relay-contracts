// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

import {INetworkManager} from "../../../interfaces/base/INetworkManager.sol";

library NetworkManagerLogic {
    using Subnetwork for address;

    uint64 internal constant NetworkManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.NetworkManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkManagerLocation = 0x933223a21808ea6583da836861e2265bfa3c7e3b9070740cd75dc9ff6fb41700;

    /**
     * @notice Internal helper to access the VaultManager storage struct
     * @dev Uses assembly to load storage location from a constant slot
     * @return $ Config pointer to the VaultManagerConfig struct
     */
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
    }

    /**
     * @notice Returns the address of the network
     * @return network The address of the network
     */
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
