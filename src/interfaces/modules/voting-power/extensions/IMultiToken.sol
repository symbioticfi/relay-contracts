// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMultiToken {
    function registerToken(
        address token
    ) external;

    function unregisterToken(
        address token
    ) external;
}
