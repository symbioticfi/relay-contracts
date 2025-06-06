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

    function _registerOperatorImpl(
        address operator
    ) internal virtual override {
        super._registerOperatorImpl(operator);
        (bool isOpNetVaultAutoDeploySupported,) =
            address(this).call(abi.encodeCall(IOpNetVaultAutoDeploy.OpNetVaultAutoDeploy_VERSION, ()));
        if (isOpNetVaultAutoDeploySupported) {
            PersistentSet.AddressSet storage allOperatorVaults =
                VaultManagerLogic._getVaultManagerStorage()._allOperatorVaults;
            _setMaxNetworkLimitVault(
                address(uint160(uint256(allOperatorVaults._inner._elements[allOperatorVaults.length() - 1]))),
                type(uint256).max
            );
        }
    }

    function _setMaxNetworkLimitVault(address vault, uint256 maxNetworkLimit) internal virtual {
        SelfNetworkLogic.setMaxNetworkLimit(vault, maxNetworkLimit);
    }

    function _setResolverVault(address vault, address resolver, bytes memory hints) internal virtual {
        SelfNetworkLogic.setResolverVault(vault, resolver, hints);
    }
}
