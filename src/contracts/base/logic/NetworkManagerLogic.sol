// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

library NetworkManagerLogic {
    using Subnetwork for address;

    /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
    struct NetworkManagerConfig {
        address _network;
        uint96 _subnetworkID;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.NetworkManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkManagerLocation = 0x933223a21808ea6583da836861e2265bfa3c7e3b9070740cd75dc9ff6fb41700;

    /**
     * @notice Internal helper to access the VaultManager storage struct
     * @dev Uses assembly to load storage location from a constant slot
     * @return $ Config pointer to the VaultManagerConfig struct
     */
    function _getNetworkManagerConfig() internal pure returns (NetworkManagerConfig storage $) {
        assembly {
            $.slot := NetworkManagerLocation
        }
    }

    /**
     * @notice Initializes the NetworkManager contract
     * @param network The address of the network
     */
    function initialize(address network, uint96 subnetworkID) public {
        NetworkManagerConfig storage $ = _getNetworkManagerConfig();
        $._network = network;
        $._subnetworkID = subnetworkID;
    }

    /**
     * @notice Returns the address of the network
     * @return network The address of the network
     */
    function NETWORK() internal view returns (address) {
        return _getNetworkManagerConfig()._network;
    }

    function SUBNETWORK_IDENTIFIER() internal view returns (uint96) {
        return _getNetworkManagerConfig()._subnetworkID;
    }

    function SUBNETWORK() public view returns (bytes32) {
        return NETWORK().subnetwork(SUBNETWORK_IDENTIFIER());
    }
}
