// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {NetworkManagerLogic} from "./logic/NetworkManagerLogic.sol";

import {INetworkManager} from "../../interfaces/base/INetworkManager.sol";

import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";
import {StaticDelegateCallable} from "@symbioticfi/core/src/contracts/common/StaticDelegateCallable.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract NetworkManager is Initializable, StaticDelegateCallable, INetworkManager {
    /**
     * @inheritdoc INetworkManager
     */
    function NetworkManager_VERSION() public pure returns (uint64) {
        return NetworkManagerLogic.NetworkManager_VERSION;
    }

    function __NetworkManager_init(
        NetworkManagerInitParams memory initParams
    ) internal virtual onlyInitializing {
        NetworkManagerLogic.initialize(initParams);
    }

    /**
     * @inheritdoc INetworkManager
     */
    function NETWORK() public view virtual returns (address) {
        return NetworkManagerLogic.NETWORK();
    }

    /**
     * @inheritdoc INetworkManager
     */
    function SUBNETWORK_IDENTIFIER() public view virtual returns (uint96) {
        return NetworkManagerLogic.SUBNETWORK_IDENTIFIER();
    }

    /**
     * @inheritdoc INetworkManager
     */
    function SUBNETWORK() public view virtual returns (bytes32) {
        return NetworkManagerLogic.SUBNETWORK();
    }
}
