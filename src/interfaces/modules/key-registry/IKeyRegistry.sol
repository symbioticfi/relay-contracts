// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

interface IKeyRegistry {
    struct KeyRegistryInitParams {
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
    }

    function getOperatorsLength() external view returns (uint256);

    function getOperatorsAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    function getOperators() external view returns (address[] memory);
}
