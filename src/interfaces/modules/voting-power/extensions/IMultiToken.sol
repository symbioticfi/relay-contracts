// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMultiToken {
    function MultiToken_VERSION() external view returns (uint64);

    function registerToken(
        address token
    ) external;

    function unregisterToken(
        address token
    ) external;
}
