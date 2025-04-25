// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IOzEIP712 {
    struct OzEIP712InitParams {
        string name;
        string version;
    }

    function OzEIP712_VERSION() external view returns (uint64);

    function hashTypedDataV4(
        bytes32 structHash
    ) external view returns (bytes32);
}
