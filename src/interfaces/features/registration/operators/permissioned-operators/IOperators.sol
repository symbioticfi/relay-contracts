// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBaseOperators} from "./IBaseOperators.sol";

interface IOperators is IBaseOperators {
    function Operators_VERSION() external view returns (uint64);

    function registerOperatorWithPermission(address operator, address vault) external;
}
