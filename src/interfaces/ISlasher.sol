// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface ISlasher {
    function TYPE() external view returns (uint64);
    function slashableStake(address network, address operator, uint48 captureTimestamp)
        external
        view
        returns (uint256);
    function slash(address network, address operator, uint256 amount, uint48 captureTimestamp)
        external
        returns (uint256 slashedAmount);
    function requestSlash(address network, address operator, uint256 amount, uint48 captureTimestamp)
        external
        returns (uint256 slashIndex);
}
