// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVaultConfigurator} from "@symbioticfi/core/src/interfaces/IVaultConfigurator.sol";
import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IVaultTokenized} from "@symbioticfi/core/src/interfaces/vault/IVaultTokenized.sol";
import {IOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";
import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {IBaseSlasher} from "@symbioticfi/core/src/interfaces/slasher/IBaseSlasher.sol";
import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";
import {INetworkMiddlewareService} from "@symbioticfi/core/src/interfaces/service/INetworkMiddlewareService.sol";

import {IOpNetVaultAutoDeploy} from
    "../../../../../interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol";
import {INetworkManager} from "../../../../../interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../../interfaces/base/IVaultManager.sol";
import {ISelfNetwork} from "../../../../../interfaces/modules/voting-power/extensions/ISelfNetwork.sol";

library SelfNetworkLogic {
    function setMaxNetworkLimitVault(address vault, uint256 maxNetworkLimit) public {
        setMaxNetworkLimit(IVault(vault).delegator(), maxNetworkLimit);
    }

    function setMaxNetworkLimit(address delegator, uint256 maxNetworkLimit) public {
        IBaseDelegator(delegator).setMaxNetworkLimit(
            INetworkManager(address(this)).SUBNETWORK_IDENTIFIER(), maxNetworkLimit
        );
    }

    function setResolverVault(address vault, address resolver, bytes memory hints) public returns (bool) {
        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert ISelfNetwork.SelfNetwork_InvalidSlasher();
        }
        setResolver(slasher, resolver, hints);
    }

    function setResolver(address slasher, address resolver, bytes memory hints) public {
        IVetoSlasher(slasher).setResolver(INetworkManager(address(this)).SUBNETWORK_IDENTIFIER(), resolver, hints);
    }

    function setMiddleware(
        address middleware
    ) public {
        INetworkMiddlewareService(ISelfNetwork(address(this)).NETWORK_MIDDLEWARE_SERVICE()).setMiddleware(middleware);
    }
}
