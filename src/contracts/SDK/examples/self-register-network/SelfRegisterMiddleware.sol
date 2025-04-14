// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {SharedVaults} from "../../extensions/SharedVaults.sol";
import {SelfRegisterOperators} from "../../extensions/operators/SelfRegisterOperators.sol";

import {OwnableAccessManager} from "../../extensions/managers/access/OwnableAccessManager.sol";
import {EqualStakePower} from "../../extensions/managers/stake-powers/EqualStakePower.sol";

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
