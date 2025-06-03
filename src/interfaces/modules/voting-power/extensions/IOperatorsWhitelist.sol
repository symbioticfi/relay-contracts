// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVotingPowerProvider} from "../IVotingPowerProvider.sol";

interface IOperatorsWhitelist {
    error OperatorsWhitelist_OperatorNotWhitelisted();
    error OperatorsWhitelist_OperatorAlreadyWhitelisted();
    error OperatorsWhitelist_OperatorVaultNotWhitelisted();
    error OperatorsWhitelist_OperatorVaultAlreadyWhitelisted();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorsWhitelist
    struct OperatorsWhitelistStorage {
        mapping(address => bool) _whitelisted;
        mapping(address => mapping(address => bool)) _whitelistedVault;
        bool _isWhitelistEnabled;
    }

    struct OperatorsWhitelistInitParams {
        bool isWhitelistEnabled;
    }

    event SetWhitelistStatus(bool status);

    event WhitelistOperator(address indexed operator);

    event UnwhitelistOperator(address indexed operator);

    event WhitelistOperatorVault(address indexed operator, address indexed vault);

    event UnwhitelistOperatorVault(address indexed operator, address indexed vault);

    function OperatorsWhitelist_VERSION() external view returns (uint64);

    function isWhitelistEnabled() external view returns (bool);

    function isOperatorWhitelisted(
        address operator
    ) external view returns (bool);

    function isOperatorVaultWhitelisted(address operator, address vault) external view returns (bool);

    function setWhitelistStatus(
        bool status
    ) external;

    function whitelistOperator(
        address operator
    ) external;

    function whitelistOperatorVault(address operator, address vault) external;

    function unwhitelistOperator(
        address operator
    ) external;

    function unwhitelistOperatorVault(address operator, address vault) external;
}
