// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVotingPowerProvider} from "../IVotingPowerProvider.sol";

interface IOperatorsBlacklist {
    error OperatorsBlacklist_OperatorNotRegistered();
    error OperatorsBlacklist_OperatorNotBlacklisted();
    error OperatorsBlacklist_OperatorBlacklisted();
    error OperatorsBlacklist_OperatorVaultNotBlacklisted();
    error OperatorsBlacklist_OperatorVaultBlacklisted();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorsBlacklist
    struct OperatorsBlacklistStorage {
        mapping(address => bool) _blacklisted;
        mapping(address => mapping(address => bool)) _blacklistedVault;
    }

    event BlacklistOperator(address indexed operator);

    event UnblacklistOperator(address indexed operator);

    event BlacklistOperatorVault(address indexed operator, address indexed vault);

    event UnblacklistOperatorVault(address indexed operator, address indexed vault);

    function OperatorsBlacklist_VERSION() external view returns (uint64);

    function isOperatorBlacklisted(
        address operator
    ) external view returns (bool);

    function isOperatorVaultBlacklisted(address operator, address vault) external view returns (bool);

    function blacklistOperator(
        address operator
    ) external;

    function blacklistOperatorVault(address operator, address vault) external;

    function unblacklistOperator(
        address operator
    ) external;

    function unblacklistOperatorVault(address operator, address vault) external;
}
