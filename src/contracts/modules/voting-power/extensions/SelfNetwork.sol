// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../VotingPowerProvider.sol";

import {ISelfNetwork} from "../../../../interfaces/modules/voting-power/extensions/ISelfNetwork.sol";

import {INetworkRegistry} from "@symbioticfi/core/src/interfaces/INetworkRegistry.sol";
import {INetworkMiddlewareService} from "@symbioticfi/core/src/interfaces/service/INetworkMiddlewareService.sol";

abstract contract SelfNetwork is VotingPowerProvider, ISelfNetwork {
    /**
     * @inheritdoc ISelfNetwork
     */
    uint64 public constant SelfNetwork_VERSION = 1;

    /**
     * @inheritdoc ISelfNetwork
     */
    address public immutable NETWORK_REGISTRY;

    /**
     * @inheritdoc ISelfNetwork
     */
    address public immutable NETWORK_MIDDLEWARE_SERVICE;

    constructor(address networkRegistry, address networkMiddlewareService) {
        NETWORK_REGISTRY = networkRegistry;
        NETWORK_MIDDLEWARE_SERVICE = networkMiddlewareService;
    }

    function __SelfNetwork_init() internal virtual onlyInitializing {}

    function __NetworkManager_init(
        NetworkManagerInitParams memory initParams
    ) internal virtual override {
        if (initParams.network != address(0) && initParams.network != address(this)) {
            revert ISelfNetwork.SelfNetwork_InvalidNetwork();
        }
        INetworkRegistry(NETWORK_REGISTRY).registerNetwork();
        INetworkMiddlewareService(NETWORK_MIDDLEWARE_SERVICE).setMiddleware(address(this));

        initParams.network = address(this);
        super.__NetworkManager_init(initParams);
    }
}
