// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

abstract contract MiddlewareStorage is Ownable {
    address public immutable NETWORK;
    uint48 public immutable SLASHING_WINDOW;
    address public immutable VAULT_REGISTRY;
    address public immutable OPERATOR_REGISTRY;
    address public immutable OPERATOR_NET_OPTIN;

    uint64 public constant INSTANT_SLASHER_TYPE = 0;
    uint64 public constant VETO_SLASHER_TYPE = 1;
    uint160 public constant DEFAULT_SUBNETWORK = 0;

    constructor(
        address owner,
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn
    ) Ownable(owner) {
        NETWORK = network;
        SLASHING_WINDOW = slashingWindow;
        VAULT_REGISTRY = vaultRegistry;
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NET_OPTIN = operatorNetOptIn;
    }
}
