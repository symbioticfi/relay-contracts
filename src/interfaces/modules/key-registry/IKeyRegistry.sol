// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

interface IKeyRegistry {
    struct KeyRegistryInitParams {
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
    }

    function KeyRegistry_VERSION() external view returns (uint64);

    function getOperatorsLength() external view returns (uint256);

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory);

    function getOperators() external view returns (address[] memory);
}
