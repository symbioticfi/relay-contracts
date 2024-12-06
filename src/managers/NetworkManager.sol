// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract NetworkManager is Initializable {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.NetworkManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkManagerStorageLocation =
        0x779150488f5e984d1f840ba606e388ada6c73b44f261274c3595c61a30023e00;

    /**
     * @notice Initializes the NetworkManager contract
     * @param network The address of the network
     */
    function __NetworkManager_init_private(
        address network
    ) internal onlyInitializing {
        assembly {
            sstore(NetworkManagerStorageLocation, network)
        }
    }

    /**
     * @notice Returns the address of the network
     * @return network The address of the network
     */
    function _NETWORK() internal view returns (address) {
        address network;
        assembly {
            network := sload(NetworkManagerStorageLocation)
        }
        return network;
    }
}
