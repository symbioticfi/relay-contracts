// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IKeyManager} from "../../../managers/extendable/IKeyManager.sol";

interface INoKeyManager {
    function NoKeyManager_VERSION() external view returns (uint64);
}
