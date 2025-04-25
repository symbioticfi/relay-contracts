// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {NetworkManagerLogic} from "./logic/NetworkManagerLogic.sol";

import {INetworkManager} from "../../interfaces/base/INetworkManager.sol";

/**
 * @title NetworkManager
 * @notice Config contract for managing the network address
 * @dev Uses a single storage slot to store the network address value
 */
abstract contract NetworkManager is Initializable, INetworkManager {
    function NetworkManager_VERSION() public pure returns (uint64) {
        return NetworkManagerLogic.NetworkManager_VERSION;
    }

    function __NetworkManager_init(
        NetworkManagerInitParams memory initParams
    ) internal virtual onlyInitializing {
        NetworkManagerLogic.initialize(initParams);
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
