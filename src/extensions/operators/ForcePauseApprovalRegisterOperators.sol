// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ApprovalRegisterOperators} from "./ApprovalRegisterOperators.sol";
import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";
import {ForcePauseSelfRegisterOperators} from "./ForcePauseSelfRegisterOperators.sol";
import {BaseOperators} from "./BaseOperators.sol";
/**
 * @title ForcePauseSelfRegisterOperators
 * @notice Extension of SelfRegisterOperators that allows authorized addresses to forcefully pause operators
 * @dev Implements force pause functionality and prevents unpausing of force-paused operators
 */
abstract contract ForcePauseApprovalRegisterOperators is ForcePauseSelfRegisterOperators, ApprovalRegisterOperators {
    uint64 public constant ForcePauseApprovalRegisterOperators_VERSION = 1;

    function registerOperator(
        bytes memory key,
        address vault,
        bytes memory signature
    ) external override(ApprovalRegisterOperators, SelfRegisterOperators) {
        revert DirectRegistrationNotAllowed();
    }

    // Override the registerOperator function to resolve ambiguity
    function registerOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) public override(ApprovalRegisterOperators, SelfRegisterOperators) {
        revert DirectRegistrationNotAllowed();
    }

    function _beforeUnpauseOperator(address operator) internal virtual override(ForcePauseSelfRegisterOperators, BaseOperators) {
        super._beforeUnpauseOperator(operator);
    }

    function _beforeUnpauseOperatorVault(address operator, address vault) internal virtual override(ForcePauseSelfRegisterOperators, BaseOperators) {
        super._beforeUnpauseOperatorVault(operator, vault);
    }

    function _beforeUnregisterOperator(address operator) internal virtual override(ForcePauseSelfRegisterOperators, BaseOperators) {
        super._beforeUnregisterOperator(operator);
    }

    function _beforeUnregisterOperatorVault(address operator, address vault) internal virtual override(BaseOperators, ForcePauseSelfRegisterOperators) {
        super._beforeUnregisterOperatorVault(operator, vault);
    }
}
