// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SimplePosMiddleware} from "../../src/examples/simple-pos-network/SimplePosMiddleware.sol";
import {DefaultKeyManager} from "../../src/key-manager/DefaultKeyManager.sol";

contract ExtendedSimplePosMiddleware is SimplePosMiddleware {
    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address owner,
        uint48 epochDuration,
        uint48 slashingWindow
    )
        SimplePosMiddleware(network, operatorRegistry, vaultRegistry, operatorNetOptin, owner, epochDuration, slashingWindow)
    {}
    
}
