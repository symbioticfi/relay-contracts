// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {SimpleMiddleware} from "../../src/examples/simple-network/SimpleMiddleware.sol";
import {DefaultBLSKeyManager} from "../../src/KeyManagers/DefaultBLSKeyManager.sol";

contract ExtendedSimpleMiddleware is SimpleMiddleware, DefaultBLSKeyManager {
    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address owner,
        uint48 epochDuration,
        uint48 slashingWindow
    )
        SimpleMiddleware(network, operatorRegistry, vaultRegistry, operatorNetOptin, owner, epochDuration, slashingWindow)
    {}
}
