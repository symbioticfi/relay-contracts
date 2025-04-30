// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC5267} from "@openzeppelin/contracts/interfaces/IERC5267.sol";

interface IOzEIP712 is IERC5267 {
    struct OzEIP712InitParams {
        string name;
        string version;
    }

    function OzEIP712_VERSION() external view returns (uint64);

    function hashTypedDataV4(
        bytes32 structHash
    ) external view returns (bytes32);

    function hashTypedDataV4Multichain(
        bytes32 structHash
    ) external view returns (bytes32);
}
