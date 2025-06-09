// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {MigratablesFactory} from "./common/MigratablesFactory.sol";

import {INetworkFactory} from "../../../interfaces/modules/network/INetworkFactory.sol";

contract NetworkFactory is MigratablesFactory, INetworkFactory {
    constructor(
        address owner_
    ) MigratablesFactory(owner_) {}
}
