// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IVault {
    function delegator() external view returns (address);
    function slasher() external view returns (address);
}
