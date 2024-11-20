// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";

abstract contract ForcePauseSelfRegisterOperators is SelfRegisterOperators {
    function forcePauseOperator(
        address operator
    ) public checkAccess {
        _beforePauseOperator(operator);
        _pauseOperator(operator);
    }

    function forceUnpauseOperator(
        address operator
    ) public checkAccess {
        _beforeUnpauseOperator(operator);
        _unpauseOperator(operator);
    }

    function forcePauseOperatorVault(address operator, address vault) public checkAccess {
        _beforePauseOperatorVault(operator, vault);
        _pauseOperatorVault(operator, vault);
    }

    function forceUnpauseOperatorVault(address operator, address vault) public checkAccess {
        _beforeUnpauseOperatorVault(operator, vault);
        _unpauseOperatorVault(operator, vault);
    }
}
