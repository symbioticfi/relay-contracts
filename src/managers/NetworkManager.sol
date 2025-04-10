// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title NetworkManager
 * @notice Config contract for managing the network address
 * @dev Uses a single storage slot to store the network address value
 */
abstract contract NetworkManager is Initializable {
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
    function __NetworkManager_init_private(address network, uint96 subnetworkID) internal onlyInitializing {
        NetworkManagerConfig storage $ = _getNetworkManagerConfig();
        $._network = network;
        $._subnetworkID = subnetworkID;
    }

    /**
     * @notice Returns the address of the network
     * @return network The address of the network
     */
    function _NETWORK() internal view returns (address) {
        return _getNetworkManagerConfig()._network;
    }

    function _SUBNETWORK_IDENTIFIER() internal view returns (uint96) {
        return _getNetworkManagerConfig()._subnetworkID;
    }

    function _SUBNETWORK() internal view returns (bytes32) {
        return _NETWORK().subnetwork(_SUBNETWORK_IDENTIFIER());
    }
}
