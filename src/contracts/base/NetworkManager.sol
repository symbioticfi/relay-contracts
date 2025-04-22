// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {NetworkManagerLogic} from "./logic/NetworkManagerLogic.sol";

/**
 * @title NetworkManager
 * @notice Config contract for managing the network address
 * @dev Uses a single storage slot to store the network address value
 */
abstract contract NetworkManager is Initializable {
    /**
     * @notice Initializes the NetworkManager contract
     * @param network The address of the network
     */
    function __NetworkManager_init(address network, uint96 subnetworkID) internal virtual onlyInitializing {
        NetworkManagerLogic.initialize(network, subnetworkID);
    }

    /**
     * @notice Returns the address of the network
     * @return network The address of the network
     */
    function NETWORK() internal view virtual returns (address) {
        return NetworkManagerLogic.NETWORK();
    }

    function SUBNETWORK_IDENTIFIER() internal view virtual returns (uint96) {
        return NetworkManagerLogic.SUBNETWORK_IDENTIFIER();
    }

    function SUBNETWORK() internal view virtual returns (bytes32) {
        return NetworkManagerLogic.SUBNETWORK();
    }
}
