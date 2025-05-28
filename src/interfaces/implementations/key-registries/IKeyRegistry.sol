// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

interface IKeyRegistry {
    function getOperatorsLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint208);

    function getOperatorsLength() external view returns (uint208);

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory);

    function getOperators() external view returns (address[] memory);

    function initialize(
        IOzEIP712.OzEIP712InitParams memory ozEip712InitParams
    ) external;
}
