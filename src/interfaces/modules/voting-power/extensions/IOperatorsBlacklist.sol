// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVotingPowerProvider} from "../IVotingPowerProvider.sol";

interface IOperatorsBlacklist {
    error OperatorsBlacklist_OperatorNotRegistered();
    error OperatorsBlacklist_OperatorNotForcePaused();
    error OperatorsBlacklist_OperatorForcePaused();
    error OperatorsBlacklist_OperatorVaultNotForcePaused();
    error OperatorsBlacklist_OperatorVaultForcePaused();

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorsBlacklist
    struct OperatorsBlacklistStorage {
        mapping(address => bool) _forcePaused;
        mapping(address => mapping(address => bool)) _forcePausedVault;
    }

    event ForcePauseOperator(address indexed operator);

    event ForceUnpauseOperator(address indexed operator);

    event ForcePauseOperatorVault(address indexed operator, address indexed vault);

    event ForceUnpauseOperatorVault(address indexed operator, address indexed vault);

    function OperatorsBlacklist_VERSION() external view returns (uint64);

    function isOperatorForcePaused(
        address operator
    ) external view returns (bool);

    function isOperatorVaultForcePaused(address operator, address vault) external view returns (bool);

    function forcePauseOperator(
        address operator
    ) external;

    function forcePauseOperatorVault(address operator, address vault) external;

    function forceUnpauseOperator(
        address operator
    ) external;

    function forceUnpauseOperatorVault(address operator, address vault) external;
}
