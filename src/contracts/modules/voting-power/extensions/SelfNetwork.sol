// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../VotingPowerProvider.sol";

import {ISelfNetwork} from "../../../../interfaces/modules/voting-power/extensions/ISelfNetwork.sol";

import {INetworkRegistry} from "@symbioticfi/core/src/interfaces/INetworkRegistry.sol";
import {INetworkMiddlewareService} from "@symbioticfi/core/src/interfaces/service/INetworkMiddlewareService.sol";
import {IOpNetVaultAutoDeploy} from "../../../../interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol";
import {PersistentSet} from "../../../../contracts/libraries/structs/PersistentSet.sol";
import {VaultManagerLogic} from "../../../../contracts/base/VaultManager.sol";
import {SelfNetworkLogic} from "./logic/SelfNetworkLogic.sol";

abstract contract SelfNetwork is VotingPowerProvider, ISelfNetwork {
    using PersistentSet for PersistentSet.AddressSet;

    /**
     * @inheritdoc ISelfNetwork
     */
    uint64 public constant SelfNetwork_VERSION = 1;

    /**
     * @inheritdoc ISelfNetwork
     */
    address public immutable NETWORK_MIDDLEWARE_SERVICE;

    modifier onlySelf() {
        if (msg.sender != address(this)) {
            revert SelfNetwork_NotAuthorized();
        }
        _;
    }

    constructor(
        address networkMiddlewareService
    ) {
        NETWORK_MIDDLEWARE_SERVICE = networkMiddlewareService;
    }

    function __SelfNetwork_init() internal virtual onlyInitializing {}

    function setMaxNetworkLimitVault(address vault, uint256 maxNetworkLimit) public virtual onlySelf {
        _setMaxNetworkLimitVault(vault, maxNetworkLimit);
    }

    function setResolverVault(address vault, address resolver, bytes memory hints) public virtual onlySelf {
        _setResolverVault(vault, resolver, hints);
    }

    function setMiddleware(
        address middleware
    ) public virtual onlySelf {
        _setMiddleware(middleware);
    }

    function _setMaxNetworkLimitVault(address vault, uint256 maxNetworkLimit) internal virtual {
        SelfNetworkLogic.setMaxNetworkLimit(vault, maxNetworkLimit);
    }

    function _setResolverVault(address vault, address resolver, bytes memory hints) internal virtual {
        SelfNetworkLogic.setResolverVault(vault, resolver, hints);
    }

    function _setMiddleware(
        address middleware
    ) internal virtual {
        SelfNetworkLogic.setMiddleware(middleware);
    }
}
