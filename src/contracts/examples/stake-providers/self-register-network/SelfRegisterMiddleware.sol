// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../../BaseMiddleware.sol";
import {SharedVaults} from "../../../modules/vaults/SharedVaults.sol";
import {SelfRegisterOperators} from "../../../modules/operators/SelfRegisterOperators.sol";

import {OwnableAccessManager} from "../../../modules/access/OwnableAccessManager.sol";
import {EqualStakePower} from "../../../modules/stake-powers/EqualStakePower.sol";

contract SelfRegisterMiddleware is
    BaseMiddleware,
    SharedVaults,
    SelfRegisterOperators,
    OwnableAccessManager,
    EqualStakePower
{
    constructor(
        address operatorRegistry,
        address operatorNetworkOptInService,
        address vaultFactory,
        address network,
        uint96 subnetworkID,
        uint48 slashingWindow,
        address owner_
    ) BaseMiddleware(operatorRegistry, operatorNetworkOptInService, vaultFactory) {
        initialize(network, subnetworkID, slashingWindow, owner_);
    }

    function initialize(
        address network,
        uint96 subnetworkID,
        uint48 slashingWindow,
        address owner_
    ) internal initializer {
        __BaseMiddleware_init(network, subnetworkID, slashingWindow);
        __SelfRegisterOperators_init("SelfRegisterMiddleware", 0);
        __OwnableAccessManager_init(owner_);
    }
}
