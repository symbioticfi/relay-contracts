// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISelfRegisterOperators} from "../ISelfRegisterOperators.sol";

interface IForcePauseSelfRegisterOperators {
    error ForcePauseSelfRegisterOperators_OperatorNotRegistered();
    error ForcePauseSelfRegisterOperators_OperatorNotForcePaused();
    error ForcePauseSelfRegisterOperators_OperatorForcePaused();
    error ForcePauseSelfRegisterOperators_OperatorVaultNotForcePaused();
    error ForcePauseSelfRegisterOperators_OperatorVaultForcePaused();

    /// @custom:storage-location erc7201:symbiotic.storage.ForcePauseSelfRegisterOperators
    struct ForcePauseSelfRegisterOperatorsStorage {
        mapping(address => bool) _forcePaused;
        mapping(address => mapping(address => bool)) _forcePausedVault;
    }

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
