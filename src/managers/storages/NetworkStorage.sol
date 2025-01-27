// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title NetworkStorage
 * @notice Storage contract for managing the network address
 * @dev Uses a single storage slot to store the network address value
 */
abstract contract NetworkStorage is Initializable {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.NetworkStorage")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkStorageLocation = 0x933223a21808ea6583da836861e2265bfa3c7e3b9070740cd75dc9ff6fb41700;

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
