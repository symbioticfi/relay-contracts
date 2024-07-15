// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {MockDelegator} from "./mockDelegator.sol";

contract MockVault {
    address public delegator;

    constructor() {
        delegator = address(new MockDelegator());
    }
}
