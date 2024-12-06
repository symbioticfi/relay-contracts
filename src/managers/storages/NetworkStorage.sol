// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract NetworkStorage is Initializable {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.NetworkStorage")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkStorageLocation =
        0x779150488f5e984d1f840ba606e388ada6c73b44f261274c3595c61a30023e00;

    /**
     * @notice Initializes the NetworkManager contract
     * @param network The address of the network
     */
    function __NetworkStorage_init_private(
        address network
    ) internal onlyInitializing {
        assembly {
            sstore(NetworkStorageLocation, network)
        }
    }

    /**
     * @notice Returns the address of the network
     * @return network The address of the network
     */
    function _NETWORK() internal view returns (address) {
        address network;
        assembly {
            network := sload(NetworkStorageLocation)
        }
        return network;
    }
}
