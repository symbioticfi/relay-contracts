// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVotingPowerProvider} from "../IVotingPowerProvider.sol";

interface IOperatorsBlacklist {
    error OperatorsBlacklist_OperatorNotRegistered();
    error OperatorsBlacklist_OperatorNotBlacklisted();
    error OperatorsBlacklist_OperatorBlacklisted();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorsBlacklist
    struct OperatorsBlacklistStorage {
        mapping(address => bool) _blacklisted;
        mapping(address => mapping(address => bool)) _blacklistedVault;
    }

    event BlacklistOperator(address indexed operator);

    event UnblacklistOperator(address indexed operator);

    function isOperatorBlacklisted(
        address operator
    ) external view returns (bool);

    function blacklistOperator(
        address operator
    ) external;

    function unblacklistOperator(
        address operator
    ) external;
}
