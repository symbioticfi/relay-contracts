// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVotingPowerProvider} from "../IVotingPowerProvider.sol";

interface IOperatorsJail {
    error OperatorsJail_OperatorNotRegistered();
    error OperatorsJail_OperatorNotJailed();
    error OperatorsJail_OperatorJailed();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorsJail
    struct OperatorsJailStorage {
        mapping(address => uint48) _jailedUntil;
    }

    event JailOperator(address indexed operator);

    event UnjailOperator(address indexed operator);

    function isOperatorJailed(
        address operator
    ) external view returns (bool);

    function getOperatorJailedUntil(
        address operator
    ) external view returns (uint48);

    function jailOperator(address operator, uint48 duration) external;

    function unjailOperator(
        address operator
    ) external;
}
